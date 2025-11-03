extends Control

@export var max_stars: int = 100
@export var star_scene: PackedScene

var current_stars := 0
var is_drawing := false

@onready var star_container = $StarContainer
@onready var star_count_label = $StarCountLabel
@onready var reset_button = $ResetButton

func _ready():
	update_star_label()
	reset_button.pressed.connect(reset_drawing)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			is_drawing = event.pressed
	elif event is InputEventMouseMotion and is_drawing:
		place_star(event.position)

func place_star(pos: Vector2):
	if current_stars >= max_stars:
		return
	var star = star_scene.instantiate()
	star.position = pos
	star_container.add_child(star)
	current_stars += 1
	update_star_label()

func reset_drawing():
	for child in star_container.get_children():
		child.queue_free()
	current_stars = 0
	update_star_label()

func update_star_label():
	star_count_label.text = "Stars left: %d" % (max_stars - current_stars)
