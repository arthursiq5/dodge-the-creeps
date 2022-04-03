extends Area2D

export var speed = 400 # velocidade (pixels/sec)
var screen_size # tamanho da tela

func _ready():
	screen_size = get_viewport_rect().size
