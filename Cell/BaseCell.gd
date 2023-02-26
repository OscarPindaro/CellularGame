extends KinematicBody2D
class_name BaseCell

# constants
export(float, 0, 10) var MAX_LINEAR_VELOCITY: float = 1
export(float, 0, 10) var MAX_ANGULAR_SPEED : float = 1

# components
onready var head : Sprite = $Head
onready var head_pos : Vector2 = head.position
# characteristics
var direction : Vector2
var linear_velocity : float = 0 setget set_linear_velocity
var angular_velocity : float = 0 setget set_angular_velocity

var energy : float = 100



func set_linear_velocity(new_linear_velocity : float) -> void:
	self.linear_velocity = new_linear_velocity

func set_angular_velocity(new_angular_velocity : float):
	angular_velocity = new_angular_velocity



func _ready():
	direction = (head_pos - self.position).normalized()

func _physics_process(delta):
	# update position
	var _ret_vel = move_and_slide(direction*linear_velocity)
	# update rotation
	direction = direction.rotated(delta*angular_velocity)
