extends KinematicBody

var objectName = "player"
var velocity = Vector3(0,0,0)
const SPEED = 8
const CONTROL_ACL = 0.05
const CONTROL_DECL = 0.05
var vel = Vector3()

func _ready():	
	print(objectName)

#Game loop
func _physics_process(delta):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0	
	elif Input.is_action_pressed("ui_right"):
		velocity.x = lerp(velocity.x, SPEED ,CONTROL_ACL)
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x = lerp(velocity.x, -SPEED ,CONTROL_ACL) 
	else: 
		velocity.x = lerp(velocity.x, 0 ,CONTROL_DECL)
		
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.x = 0	
	elif Input.is_action_pressed("ui_up"):
		velocity.y = lerp(velocity.y, SPEED ,CONTROL_ACL)
	elif Input.is_action_pressed("ui_down"):
		velocity.y = lerp(velocity.y, -SPEED ,CONTROL_ACL)
	else: 
		velocity.y = lerp(velocity.y, 0 , CONTROL_DECL)
	move_and_slide(velocity)