#region Horizontal movement

abs_dir = keyboard_check(vk_right) - keyboard_check(vk_left)
//	1 for right; -1 for left; 0 for none

if abs_dir != 0 
{
	gspd += abs_dir * accel
	gspd = clamp(gspd, -max_g, max_g)
	//	Doesnt accelerate past the max speed
}
else 
{
	gspd -= gspd * decel
	if abs(gspd) < 0.1 {gspd = 0}
}

#endregion

#region Vertical movement

if keyboard_check_pressed(vk_space) != 0 
{
	vspd += 1
}

#endregion


#region Gravity

fspd += grav

if place_meeting(x, y + 1, tilemap) {vspd = 0; fspd = 0}
if place_meeting(x + 1, y, tilemap) {hspd = 0}

#endregion

#region Convert gpsd to xspd & ypsd

hspd = gspd * cos(degtorad(angle))
vspd = -1 * gspd * sin(degtorad(angle)) + fspd

move_and_collide(hspd, vspd, tilemap)

#endregion
