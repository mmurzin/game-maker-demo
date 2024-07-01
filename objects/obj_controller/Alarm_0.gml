/// @description keyboard_handle
// You can write your code in this editor

var lh = gamepad_axis_value(global.selected_gamepad, gp_axislh)
var lv = gamepad_axis_value(global.selected_gamepad, gp_axislv)

//handle single action
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
lh > 0 && lh > contorller_threshold && prev_lh < contorller_threshold){
	action = Direction.Right
}

if(action != undefined && direction_mode != DirectionMode.Long){
	direction_mode = DirectionMode.Normal
	handle_action(action)
}
var long_action = undefined
//handle long click
if (prev_lh > contorller_threshold && lh > contorller_threshold){//right long click
	long_right_timer++
	if long_right_timer > long_timer_delay {
		long_action = Direction.Right
	}
} else if prev_lh < -1*contorller_threshold && lh < -1*contorller_threshold  {//left long click
	long_left_timer ++
	if long_left_timer > long_timer_delay{
		long_action = Direction.Left
	}
} else if (prev_lv > contorller_threshold && lv > contorller_threshold){//down long click
	long_down_timer++
	if long_down_timer > long_timer_delay{
		long_action = Direction.Down
	}
} else if (prev_lv < -1*contorller_threshold && lv < -1*contorller_threshold){
	long_up_timer++
	if long_up_timer > long_timer_delay {
		long_action = Direction.Up
	}
}


if long_action != undefined {
	long_left_timer = 0
	long_right_timer = 0
	long_down_timer = 0
	long_up_timer = 0
	direction_mode = DirectionMode.Long
	handle_action(long_action)
}

var is_clicked = gamepad_button_check_released(global.selected_gamepad, gp_face1) || keyboard_check_released(vk_enter)
if(is_clicked){
	handle_click()
}

prev_lh = lh
prev_lv = lv
alarm[0] = alarm_keyboard_speed;