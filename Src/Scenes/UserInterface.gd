extends CanvasLayer

var holding_item = null
var mouse_over_slot = false

func _input(event):
	if event.is_action_pressed("build_menu"):
		$BuildMenu.visible = !$BuildMenu.visible
		if !$BuildMenu.visible:
			mouse_over_slot = false
	if event.is_action_pressed("status_bar"):
		$Status.visible = !$Status.visible
#	if OS.is_window_minimized()  == true:
#
	if OS.is_window_maximized() == true:
		$BuildMenu.position = Vector2(200,1000)
	else:
		$BuildMenu.position = Vector2(200,250)
	
	if OS.window_fullscreen == true:
		$BuildMenu.position = Vector2(200,1000)
	else:
		$BuildMenu.position = Vector2(200,250)
		
	if event.is_action_pressed("full_screen"):
		OS.window_fullscreen = !OS.window_fullscreen
			
#	if event.is_action_pressed("scroll_up"):
#		PlayerInventory.active_item_scroll_down()
#	elif event.is_action_pressed("scroll_down"):
#		PlayerInventory.active_item_scroll_up()
		
func _ready():
		pass
		
		
#bool window_fullscreen [default: false]
#set_window_fullscreen(value)
#setteris_window_fullscreen() getter

