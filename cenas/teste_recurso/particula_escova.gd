extends Node

@export var speed = 100
@onready var particulas = $AnimatedSprite2D/CPUParticles2D

func _process(delta):
	var velocity = Vector2()
	particulas.gravity = Vector2(0,0)
	if Input.action_press.is_valid():
		if Input.is_action_pressed("andar_baixo"):
			velocity.y += 1	
			particulas.gravity = Vector2(0,-30)
		if Input.is_action_pressed("andar_cima"):
			velocity.y -= 1	
			particulas.gravity = Vector2(0,30)
		if Input.is_action_pressed("andar_esquerda"):
			$AnimatedSprite2D.flip_h = true
			particulas.position = Vector2(-280,-280)
			particulas.gravity = Vector2(-30,0)
			velocity.x -= 1	
		if Input.is_action_pressed("andar_direita"):
			$AnimatedSprite2D.flip_h = false
			particulas.position = Vector2(280,-280)
			particulas.gravity = Vector2(30,0)
			velocity.x += 1	
		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
		self.position += velocity * delta
		
