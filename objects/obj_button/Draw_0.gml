/// @description Insert description here
// You can write your code in this editor
clicked_sprite = "";
var shadow_size = 4
if(is_focused) {
	gpu_set_blendmode(bm_add)
	for(var c = 0; c<360;c+=60){
		draw_sprite_ext(
		sprite_index,image_index,
		x+lengthdir_x(shadow_size,c),
		y+lengthdir_y(shadow_size,c),
		image_xscale,image_yscale,
		image_angle,image_blend,1)
	}
}

gpu_set_blendmode(bm_normal)
draw_self();



