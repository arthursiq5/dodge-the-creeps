extends CanvasLayer

signal start_game


func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	# espera até o MessageTimer terminar de contar
	yield($MessageTimer, "timeout")

	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	# cria um timer de 1 segundo e espera ele terminar
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)



func _on_MessageTimer_timeout():
	$StartButton.hide()
	emit_signal("start_game")


func _on_StartButton_pressed():
	$Message.hide()
