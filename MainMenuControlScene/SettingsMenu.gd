extends Control
var ConfigFilePath := OS.get_executable_path().get_base_dir() +  "/Config.cfg"
var config = ConfigFile.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	$TOPMarginContainer/VBoxContainer.FOCUS_ALL
	$BUTTOMMarginContainer/VBoxContainer/Back.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")




func _on_lang_button_item_selected(index):
	match index:
		0:
			TranslationServer.set_locale("en-US")
			config.load(ConfigFilePath)
			config.set_value("Setting", "Lang", "en")
			config.save(ConfigFilePath)
		1:
			TranslationServer.set_locale("ja-JP")
			config.load(ConfigFilePath)
			config.set_value("Setting", "Lang", "ja")
			config.save(ConfigFilePath)


func _on_option_button_item_selected(index):
	match index:
		
		0:
			#Exact Resolution is 1920x1020
			DisplayServer.window_set_size(Vector2i(1920,1020))
			DisplayServer.window_set_position(Vector2(DisplayServer.screen_get_position()) + DisplayServer.screen_get_size()*0.5 - DisplayServer.window_get_size()*0.5)
			config.load(ConfigFilePath)
			config.set_value("Setting", "gameScreenSize", "0")
			config.save(ConfigFilePath)
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
			DisplayServer.window_set_position(Vector2(DisplayServer.screen_get_position()) + DisplayServer.screen_get_size()*0.5 - DisplayServer.window_get_size()*0.5)
			config.load(ConfigFilePath)
			config.set_value("Setting", "gameScreenSize", "1")
			config.save(ConfigFilePath)
		2: 
			DisplayServer.window_set_size(Vector2i(1280,768))
			DisplayServer.window_set_position(Vector2(DisplayServer.screen_get_position()) + DisplayServer.screen_get_size()*0.5 - DisplayServer.window_get_size()*0.5)
			config.load(ConfigFilePath)
			config.set_value("Setting", "gameScreenSize", "2")
			config.save(ConfigFilePath)


func _on_resized():
	pass # Replace with function body.


func _on_full_screen_button_toggled(button_pressed):
	
	match button_pressed:
		true:
			
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			config.load(ConfigFilePath)
			config.set_value("Setting", "FullScreenMode", "1")
			config.save(ConfigFilePath)
		false:
			
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			config.load(ConfigFilePath)
			config.set_value("Setting", "FullScreenMode", "0")
			config.save(ConfigFilePath)
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			get_tree().change_scene_to_file("res://MainMenu.tscn")


func _on_res_change_button_focus_entered():
	$TOPMarginContainer/VBoxContainer/TabContainer.current_tab = 1


func _on_lang_button_focus_entered():
	$TOPMarginContainer/VBoxContainer/TabContainer.current_tab = 0
