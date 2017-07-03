extends KinematicBody2D

const BULLET =  preload("res://Enemy_bullet.tscn")
var delay = null

func _ready():
	delay = Timer.new()
	randomize()
	delay.set_wait_time(rand_range(5,50))
	delay.set_one_shot(true)
	delay.connect("timeout", self, "shoot")
	add_child(delay)
	delay.start()
	set_fixed_process(true)
	
func _fixed_process(delta):
	var speed = 100/(1.5*global.ENEMIES)
	if global.FLAG==true:
		self.set_pos(Vector2(self.get_pos().x, self.get_pos().y+32))
		global.OK = global.OK+1
	elif global.DIR==false:
		move(Vector2(1,0)*speed*delta)
	elif global.DIR==true:
		move(Vector2(-1,0)*speed*delta)
func shoot():
		var bullet = BULLET.instance()
		bullet.set_pos(self.get_pos() + Vector2(0,20))
		get_parent().add_child(bullet)
		randomize()
		delay.set_wait_time(rand_range(0.2,2))
		delay.start()
