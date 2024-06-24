/// @description Insert description here
// You can write your code in this editor
var lh = gamepad_axis_value(global.selected_gamepad, gp_axislh)
var lv = gamepad_axis_value(global.selected_gamepad, gp_axislv)


var action = undefined
var min_axis = 0.99
if (keyboard_check_released(vk_up) || lv < -1 * min_axis) {
	action = Direction.Up
} else if(keyboard_check_released(vk_left) || lh < -1 * min_axis) {
	action = Direction.Left
} else if(keyboard_check_released(vk_down)|| lv > min_axis ) {
	action = Direction.Down
} else if(keyboard_check_released(vk_right) || lh > min_axis) {
	action = Direction.Right
}

if(action != undefined){
	handle_action(action)
}

var is_clicked = gamepad_button_check_released(global.selected_gamepad, gp_face1) || keyboard_check_released(vk_enter)
if(is_clicked){
	handle_click()
}
alarm[0] = alarm_speed;