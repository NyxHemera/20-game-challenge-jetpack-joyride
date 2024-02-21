extends ParallaxBackground

var speed = 250
@export var speed_increment = 5

var time_since_increment = 0

func _process(delta):
	%BackgroundLayer.motion_offset.x -= (speed-10) * delta
	%FloorLayer.motion_offset.x -= speed * delta
	time_since_increment += delta
	
	if time_since_increment >= 1:
		time_since_increment = 0
		speed += speed_increment 
