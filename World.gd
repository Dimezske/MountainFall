extends Node2D

onready var starting_pos = $StartingPosition
onready var player = $Player

func _ready():
	player.global_position = starting_pos.global_position
	

