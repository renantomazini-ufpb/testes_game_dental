extends Area2D

var dragging := false
var offset := Vector2.ZERO

@onready var escova: AnimatedSprite2D = $AnimatedSprite2D
@onready var bolha: CPUParticles2D = $CerdasArea/CerdasColision/Bolhas
var max_points := 100

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		dragging = event.pressed
		if dragging:
			#bolha.emitting = true
			#bolha.set_emitting(true)
			offset = escova.global_position - get_global_mouse_position()
		else:
			pass
			#bolha.emitting = false
			#bolha.set_emitting(false)
			#trail.clear_points() # opcional: limpa ao soltar

func _process(delta):
	if dragging:
		global_position = get_global_mouse_position() + escova.position
		#print("-")
		#print(self.global_position)
		#print("----")

func _on_dente_area_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	#print(area.name)
	pass

func _on_cerdas_area_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.name == "denteArea":
		bolha.emitting = true

func _on_cerdas_area_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.name == "denteArea":
		bolha.emitting = false


func _on_dente_colisor_cima_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.


func _on_dente_colisor_esquerda_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.


func _on_dente_colisor_direita_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.


func _on_dente_colisor_baixo_2_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
