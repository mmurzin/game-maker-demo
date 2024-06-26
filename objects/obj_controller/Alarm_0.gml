/// @description keyboard_handle
// You can write your code in this editor

var lh = gamepad_axis_value(global.selected_gamepad, gp_axislh)
var lv = gamepad_axis_value(global.selected_gamepad, gp_axislv)


var action = undefined
if (keyboard_check_released(vk_up) || 
gamepad_button_check_released(global.selected_gamepad, gp_padu) ||
lv < 0 && lv < -1*contorller_threshold && prev_lv > -1*contorller_threshold) {
	action = Direction.Up
} else if(keyboard_check_released(vk_left) || 
gamepad_button_check_released(global.selected_gamepad, gp_padl) ||
lh < 0 && lh < -1*contorller_threshold && prev_lh > -1*contorller_threshold) {
	action = Direction.Left
} else if(keyboard_check_released(vk_down)||
gamepad_button_check_released(global.selected_gamepad, gp_padd) ||
lv > 0 && lv > contorller_threshold && prev_lv < contorller_threshold) {
	action = Direction.Down
} else if(keyboard_check_released(vk_right) || 
gamepad_button_check_released(global.selected_gamepad, gp_padr) ||
lh > 0 && lh > contorller_threshold && prev_lh < contorller_threshold) {
	action = Direction.Right
}

if(action != undefined){
	handle_action(action)
}

var is_clicked = gamepad_button_check_released(global.selected_gamepad, gp_face1) || keyboard_check_released(vk_enter)
if(is_clicked){
	handle_click()
}

prev_lh = lh
prev_lv = lv
alarm[0] = alarm_keyboard_speed;