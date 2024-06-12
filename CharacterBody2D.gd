extends CharacterBody2D

@onready var ap = $AnimationPlayer

func _enter_tree():
	set_multiplayer_authority(name.to_int())

func _physics_process(delta): #enables the function of movement
	if is_multiplayer_authority():
		velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 400
	move_and_slide()
	
	update_animations()

func update_animations(): #plays the animation for the player
	ap.play("idle")
	#ap.play("run")
	