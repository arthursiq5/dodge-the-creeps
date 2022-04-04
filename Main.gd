extends Node

export (PackedScene) var mob_scene
var score

func _ready():
	randomize()
	new_game()

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()

func new_game():
	score = 0
	get_tree().call_group("mobs", "queue_free")
	$Player.start($StartPosition.position)
	$StartTimer.start()
	
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_MobTimer_timeout():
	var mob = mob_scene.instance()
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	
	# Seleciona uma direção perpendicular ao caminho para o mob
	var direction = mob_spawn_location.rotation + PI / 2
	
	# define a posição do mob para um local aleatório
	mob.position = mob_spawn_location.position
	
	# adiciona detalhes randômicos à direção
	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	# define a velocidade do mob
	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	
	add_child(mob)
