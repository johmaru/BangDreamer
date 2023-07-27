extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_exit_pressed():
	get_tree().quit()


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://MainMenuControlScene/SettingsMenu.tscn")
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			$QuitMenu.visible = true


func _on_quit_yes_button_pressed():
	get_tree().quit()


func _on_quit_no_button_pressed():
	$QuitMenu.visible = false
