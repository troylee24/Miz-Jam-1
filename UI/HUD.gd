extends Control

onready var animPlayer = $AnimationPlayer
onready var textureProgress = $TextureProgress

const LOW_HEALTH_TRIGGER = 25

var is_health_low = false

func update_health(new_health):
	textureProgress.update_value(new_health)
	is_health_low = new_health <= LOW_HEALTH_TRIGGER
	animPlayer.play('Shake')

func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"Shake":
			if is_health_low:
				animPlayer.play("Flash")
		"Flash":
			if not is_health_low:
				animPlayer.stop("Flash")
