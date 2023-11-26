extends Node

var PlayerScore
var OpponentScore

func _ready():
	PlayerScore = 0
	OpponentScore = 0
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)

func _on_left_wall_body_entered(body):
	$Ball.position = Vector2(576,324)
	OpponentScore += 1
	$OpponentScore.text = str(OpponentScore)
	get_tree().call_group('BallGroup', 'stop_ball')
	$CountdownTimer.start()

func _on_right_wall_body_entered(body):
	$Ball.position = Vector2(576,324)
	PlayerScore += 1
	$PlayerScore.text = str(PlayerScore)
	get_tree().call_group('BallGroup', 'stop_ball')
	$CountdownTimer.start()


func _on_countdown_timer_timeout():
	get_tree().call_group('BallGroup', 'restart_ball')
