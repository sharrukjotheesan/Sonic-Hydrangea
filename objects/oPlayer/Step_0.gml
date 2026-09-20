abs_dir = keyboard_check(vk_right) - keyboard_check(vk_left)
//	1 for right; -1 for left; 0 for none

if abs_dir != 0 
{
	hsp += abs_dir * accel
	hsp = clamp(hsp, -max_spd, max_spd)
	//	Doesnt accelerate past the max speed
}
else 
{
	hsp -= hsp * decel
	if abs(hsp) < 0.1 {hsp = 0}
}



//	Rounds to 2dp (for some reason it cant round to decimal places so i had to multiply then divide by 100

x += hsp
x = round(x)
y = round(y)