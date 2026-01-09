extends Area2D
var ultimo = 'nada'
var rep_hor = 0
var rep_ver = 0


func limpo() -> void:
	emit_signal('dente_limpo')
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rep_ver > 10:
		$DenteColisorBaixo/CollisionShapeBaixo.disabled = true
		$DenteColisorCima/CollisionShapeCima.disabled = true
		$DenteColisorEsquerda/CollisionShapeEsquerda.disabled = false
		$DenteColisorDireita/CollisionShapeDireita.disabled = false
	if rep_hor >= 10 and rep_ver >= 10:
		$denteSprite.set_animation('feliz')


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.name == 'AreaEscova':
		$denteSprite.set_animation('maismenos')
		#$denteSprite.frame = 0


func _on_dente_colisor_cima_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if ultimo=='bai':
		rep_ver= rep_ver + 1
	ultimo = 'cim'


func _on_dente_colisor_esquerda_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	ultimo = 'esq' # Replace with function body.


func _on_dente_colisor_direita_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if ultimo=='esq':
		rep_hor= rep_hor + 1
	ultimo = 'dir' # Replace with function body.


func _on_dente_colisor_baixo_2_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	ultimo = 'bai' # Replace with function body.


func _on_timer_timeout() -> void:
	print("pts hoz: " + str(rep_hor))
	print("pts ver: " + str(rep_ver))
	
