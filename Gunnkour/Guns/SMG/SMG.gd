extends Node2D

var bulletCounter = 0

func _physics_process(delta):
	
	if (Input.is_action_pressed("Mouse") && bulletCounter < 20):
		$"/root/global".camera.shake = $"/root/global".camera.shake_magnitude*(bulletCounter*0.12)
		$"/root/global".player.mouseLocation = get_local_mouse_position()
		var force = Vector2(0, $"/root/global".player.mouseLocation.y*-0.15)
		$"/root/global".player.apply_central_impulse(force)
		$smgshot.play("Shoot")
		$Gunshot.play()
		bulletCounter = bulletCounter + 1
		
	if(Input.is_action_just_pressed("Reload")):
		$smgshot.play("Reload")

func _on_smgshot_animation_finished(anim_name):
	if anim_name == 'Reload':
		bulletCounter = 0
func _on_smgshot_animation_started(anim_name):
	if anim_name == 'Reload':
		$Reload.play()
