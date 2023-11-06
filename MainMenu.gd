extends Control
var mainInitilize = 0
var WindowSize = {}
var nowLanguage = {}
var WindowScreenMode = {}
var ConfigFilePath := OS.get_executable_path().get_base_dir() +  "/Config.cfg"
var GameConfigPath := OS.get_executable_path().get_base_dir() + "/gameSettings.cfg"
# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/NewGame.grab_focus()
	print(WindowSize)
	
	match  mainInitilize:
		0:
			match FileAccess.file_exists(ConfigFilePath):
				true:
					SetGameConfig()
					WindowsizeInitilize()
					LanguageInitilize()
					FullScreenInitilize()
					mainInitilize = 1
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
	config.set_value("Setting", "FullScreenMode", "0")
	config.save(ConfigFilePath)
	
func SetGameConfig() -> void:
	var config = ConfigFile.new()
	var err = config.load(ConfigFilePath)
	
	if err != OK:
		return
		
	for settings in config.get_sections():
		var lang = config.get_value(settings, "Lang")
		var ScreenSize = config.get_value(settings, "gameScreenSize")
		var ScreenMode = config.get_value(settings, "FullScreenMode")
		WindowSize = ScreenSize
		nowLanguage = lang
		WindowScreenMode = ScreenMode
		
func WindowsizeInitilize():
	match WindowSize:
		
		"0":
			#Exact Resolution is 1920x1020
			DisplayServer.window_set_size(Vector2i(1920,1020))
			DisplayServer.window_set_position(Vector2(DisplayServer.screen_get_position()) + DisplayServer.screen_get_size()*0.5 - DisplayServer.window_get_size()*0.5)
		"1":
			DisplayServer.window_set_size(Vector2i(1600,900))
			DisplayServer.window_set_position(Vector2(DisplayServer.screen_get_position()) + DisplayServer.screen_get_size()*0.5 - DisplayServer.window_get_size()*0.5)
		"2": 
			DisplayServer.window_set_size(Vector2i(1280,768))
			DisplayServer.window_set_position(Vector2(DisplayServer.screen_get_position()) + DisplayServer.screen_get_size()*0.5 - DisplayServer.window_get_size()*0.5)
			
func LanguageInitilize():
	match nowLanguage:
		"en":
			TranslationServer.set_locale("en-US")
		"ja":
			TranslationServer.set_locale("ja-JP")

func FullScreenInitilize():
	match WindowScreenMode:
		"1":
			
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		"0":
			
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
