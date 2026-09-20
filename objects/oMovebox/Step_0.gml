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

#region Collision



#endregion

#region Convert gpsd to xspd & ypsd

hspd = gspd * cos(degtorad(angle))
vspd = -1 * gspd * sin(degtorad(angle))

x += hspd
y += vspd

#endregion
