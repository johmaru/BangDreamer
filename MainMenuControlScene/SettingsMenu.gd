extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")




func _on_lang_button_item_selected(index):
	match index:
		0:
			TranslationServer.set_locale("en-US")
		1:
			TranslationServer.set_locale("ja-JP")	
