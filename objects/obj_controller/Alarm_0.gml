/// @description keyboard_handle
// You can write your code in this editor

var lh = gamepad_axis_value(global.selected_gamepad, gp_axislh)
var lv = gamepad_axis_value(global.selected_gamepad, gp_axislv)

if keyboard_check(vk_up) && keyboard_up_timer == 0 {

}


//handle single action
var action = undefined
if ((keyboard_check(vk_up) && !up_key_pressed) || 
	keyboard_up_timer > keyboard_timer_delay || 
	gamepad_button_check_released(global.selected_gamepad, gp_padu) ||
	lv < 0 && lv < -1*contorller_threshold && prev_lv > -1*contorller_threshold) {
	action = Direction.Up
	up_key_pressed = true
} else if((keyboard_check(vk_left) && !left_key_pressed)||
	keyboard_left_timer > keyboard_timer_delay || 
	gamepad_button_check_released(global.selected_gamepad, gp_padl) ||
	lh < 0 && lh < -1*contorller_threshold && prev_lh > -1*contorller_threshold) {
	action = Direction.Left
	left_key_pressed = true
} else if((keyboard_check(vk_down) && !down_key_pressed) ||
	keyboard_down_timer > keyboard_timer_delay||
	gamepad_button_check_released(global.selected_gamepad, gp_padd) ||
	lv > 0 && lv > contorller_threshold && prev_lv < contorller_threshold) {
	action = Direction.Down
	down_key_pressed = true
} else if((keyboard_check(vk_right) && !right_key_pressed)||
	keyboard_right_timer > keyboard_timer_delay || 
	gamepad_button_check_released(global.selected_gamepad, gp_padr) ||
	lh > 0 && lh > contorller_threshold && prev_lh < contorller_threshold){
	action = Direction.Right
	right_key_pressed = true
}

if keyboard_check_released(vk_up){
	up_key_pressed = false
} else if keyboard_check_released(vk_left){
	left_key_pressed = false
} else if keyboard_check_released(vk_down){
	down_key_pressed = false
} else if keyboard_check_released(vk_right){
	right_key_pressed = false
}

//update keyboard timers
if keyboard_check(vk_up){
	keyboard_up_timer++
} else if keyboard_check(vk_down) {
	keyboard_down_timer++
} else if keyboard_check(vk_left){
	keyboard_left_timer++
} else if keyboard_check(vk_right){
	keyboard_right_timer++
}

if(action != undefined && direction_mode != DirectionMode.Long){
	direction_mode = DirectionMode.Normal
	keyboard_up_timer = 0
	keyboard_down_timer = 0
	keyboard_right_timer = 0
	keyboard_left_timer = 0
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