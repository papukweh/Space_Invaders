extends Node2D

func _ready():
	global.current_scene = "Game_Over"
	if global.LIVES> 0 and not(global.LOSS):
		self.get_child(1).set_text("VICTORY!")
	else:
		self.get_child(1).set_text("GAME OVER")