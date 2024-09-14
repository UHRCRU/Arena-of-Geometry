if (keyboard_check(vk_left) or keyboard_check(ord("A"))) x = x - 3;
if (keyboard_check(vk_right) or keyboard_check(ord("D"))) x = x + 3;
if (keyboard_check(vk_up) or keyboard_check(ord("W"))) y = y - 3;
if (keyboard_check(vk_down) or keyboard_check(ord("S"))) y = y + 3;
move_wrap(true, true, 0)
image_angle = point_direction(x,y,mouse_x,mouse_y);

if (mouse_check_button_pressed(mb_left) && (cooldown<1)) {
    var instance = instance_create_layer(x, y, layer, obj_Arrow);
    instance.direction = point_direction(x, y, mouse_x, mouse_y);
    instance.image_angle = instance.direction;
    instance.speed = 15;
	
	cooldown = 120;
}

	cooldown = cooldown - 1