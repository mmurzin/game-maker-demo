/// @description Insert description here
// You can write your code in this editor
var lh = gamepad_axis_value(global.selected_gamepad, gp_axislh)
var lv = gamepad_axis_value(global.selected_gamepad, gp_axislv)

var action = undefined
if (keyboard_check(vk_up) || lv < -0.5) {
	action = Direction.Up
} else if(keyboard_check(vk_left) || lh < -0.5) {
	action = Direction.Left
} else if(keyboard_check(vk_down)|| lv > 0.5 ) {
	action = Direction.Down
} else if(keyboard_check(vk_right) || lh > 0.5) {
	action = Direction.Right
}

if(action != undefined){
	handle_action(action)
}

var is_clicked = gamepad_button_check(global.selected_gamepad, gp_face1) || keyboard_check(vk_enter)
if(is_clicked){
	handle_click()
}
alarm[0] = alarm_speed;