extends Node2D

@export var star_min_scale: float = 0.01
@export var star_max_scale: float = 0.05

func _ready():
	var star_scale = randf_range(star_min_scale,star_max_scale)
	$StarSprite.scale = Vector2(star_scale, star_scale)
