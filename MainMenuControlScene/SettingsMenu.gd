extends Control


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
		1:
			TranslationServer.set_locale("ja-JP")	


func _on_option_button_item_selected(index):
	
	match index:
		
		0:
			#Exact Resolution is 1920x1020
			DisplayServer.window_set_size(Vector2i(1920,1020))
			DisplayServer.window_set_position(Vector2(DisplayServer.screen_get_position()) + DisplayServer.screen_get_size()*0.5 - DisplayServer.window_get_size()*0.5)
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
			DisplayServer.window_set_position(Vector2(DisplayServer.screen_get_position()) + DisplayServer.screen_get_size()*0.5 - DisplayServer.window_get_size()*0.5)
		2: 
			DisplayServer.window_set_size(Vector2i(1280,768))
			DisplayServer.window_set_position(Vector2(DisplayServer.screen_get_position()) + DisplayServer.screen_get_size()*0.5 - DisplayServer.window_get_size()*0.5)


func _on_resized():
	pass # Replace with function body.


func _on_full_screen_button_toggled(button_pressed):
	
	match button_pressed:
		true:
			
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			
		false:
			
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			get_tree().change_scene_to_file("res://MainMenu.tscn")


func _on_res_change_button_focus_entered():
	$TOPMarginContainer/VBoxContainer/TabContainer.current_tab = 1


func _on_lang_button_focus_entered():
	$TOPMarginContainer/VBoxContainer/TabContainer.current_tab = 0
