extends Node2D

export(String, FILE) var main_scene_path
onready var fader = get_node("%Fader")
onready var menu_box = get_node("MainMenuUI/RootUI/Panel/MenuBoxContainer")
onready var audio_box = get_node("MainMenuUI/RootUI/Panel/AudioBoxContainer")

func _ready() -> void:
	toggle_audio_option(false)
	fader.fade_screen(false)

func _on_play() -> void:
	fader.fade_screen(true, "_go_to_main_scene", self)

func _on_quit() -> void:
	fader.fade_screen(true, "quit", get_tree())

func _on_audio_button_pressed():
	toggle_audio_option(true)

func _on_back_button_pressed():
	toggle_audio_option(false)

func _go_to_main_scene():
	get_tree().change_scene(main_scene_path)
	$"/root/Signalbus".emit_signal("loading_world")
	
func toggle_audio_option(value: bool) -> void:
	audio_box.visible = value
	menu_box.visible = not value
