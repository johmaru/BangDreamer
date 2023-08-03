extends Control
var WindowSize = {}
const ConfigPath := "user://Config.json"
const ConfigFilePath := "user://Config.cfg"
var GameConfigPath := OS.get_executable_path().get_base_dir() + "/gameSettings.cfg"
# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/NewGame.grab_focus()
	print(WindowSize)
	match FileAccess.file_exists(ConfigFilePath):
		true:
			pass
		false:
			initConfigFile()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_exit_pressed():
	get_tree().quit()


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://MainMenuControlScene/SettingsMenu.tscn")
	
func _input(event):
	var NewGameBTN = $MarginContainer/VBoxContainer/NewGame
	var SettingsBTN = $MarginContainer/VBoxContainer/Settings
	var ExitBTN = $MarginContainer/VBoxContainer/Exit
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			$QuitMenu.visible = true


func _on_quit_yes_button_pressed():
	get_tree().quit()


func _on_quit_no_button_pressed():
	$QuitMenu.visible = false


func _on_new_game_focus_entered():
	$MarginContainer/VBoxContainer/NewGame.DRAW_HOVER

func initConfigFile() -> void:
	var config = ConfigFile.new()
	
	config.set_value("Setting", "gameScreenSize", "2")
	config.set_value("Setting", "Lang", "en")
	config.save(ConfigFilePath)
