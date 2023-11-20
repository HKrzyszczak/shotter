extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal laser(pos, direction)
signal grenade(pos, direction)


func _process(_delta):
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity=direction * 500
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	if Input.is_action_pressed("primary action") and can_laser:
		can_laser = false
		$LaserReloadTimer.start()
		var laser_markers = $ParticleStartMarkers.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		laser.emit(selected_laser.global_position, player_direction)

	if Input.is_action_pressed("secondary action") and can_grenade:
		can_grenade = false
		
		$GrenadeReloadTimer.start()
		var grenade_position = $ParticleStartMarkers/GunCenterMarker.global_position
		grenade.emit(grenade_position, player_direction)


func _on_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true
