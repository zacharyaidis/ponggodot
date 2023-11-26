extends Node


func _on_left_wall_body_entered(body):
	$Ball.position = Vector2(576,324)


func _on_right_wall_body_entered(body):
	$Ball.position = Vector2(576,324)
