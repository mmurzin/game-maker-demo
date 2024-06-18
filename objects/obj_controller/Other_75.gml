
switch(async_load[? "event_type"])             
{
case "gamepad discovered":   
	show_debug_message("--> event gamepad discovered");
	for (var _i = 0; _i < gamepad_get_device_count(); _i++)
	{
	    if (gamepad_is_connected(_i))
	    {
			var _gamepad = ds_map_create();
			ds_map_add(global.gamepads, _i, gamepad_get_description(_i));
			if global.selected_gamepad == -1 {
				global.selected_gamepad = _i
			}
	    }
	}
    break;
case "gamepad lost":                          
	show_debug_message("--> event gamepad lost");
    break;
}