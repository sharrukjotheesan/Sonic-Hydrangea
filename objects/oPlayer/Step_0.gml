#region		Calibrating variables

theta = degtorad(angle)		//	Sets theta to angle in radians every step
room_id = layer_tilemap_get_id(layer_get_id("Tiles_1"))		//	ID of room (tile layer which is the floor)

#endregion

#region		Creating bottom-left & bottom right corners

dist = point_distance(0, 0, (sprite_width)/2, (sprite_height)/2)	//	Absolute distance from the centre to a corner
initial_angle_bottom_left = point_direction(0, 0, (sprite_width)/2, (sprite_height)/2)	//	The usual angle from centre to corner when image_angle = 0
initial_angle_bottom_right = point_direction(0, 0, -(sprite_width)/2, (sprite_height)/2)

raycasts = 
{
	bottom_l_x: x + lengthdir_x(dist, initial_angle_bottom_left + image_angle),	//	Calculates actual position of bottom_left
	bottom_l_y: y + lengthdir_y(dist, initial_angle_bottom_left + image_angle),
	
	bottom_r_x: x + lengthdir_x(dist, initial_angle_bottom_right + image_angle), //	Calculates actual position of bottom_right
	bottom_r_y: y + lengthdir_y(dist, initial_angle_bottom_right + image_angle)
	//	Done by: centre + distance in direction of (initial angle when angle == 0) + image's angle
}

#endregion

#region		Checking bottom-left & bottom_right corners to calculate angle

raycasted = 
{	//	The raycasted points stemming from the raycasts (don't wanna 
	bottom_left_x: raycasts.bottom_l_x,
	bottom_left_y: raycasts.bottom_l_y,
	
	bottom_right_x: raycasts.bottom_r_x,
	bottom_right_y: raycasts.bottom_r_y
}

//	Drop bottom_left coord down until it touches smth

while not position_meeting(raycasted.bottom_left_x, raycasted.bottom_left_y, room_id) 
{
	raycasted.bottom_left_y++
	if raycasted.bottom_left_y > room_height {break}
}

//	Go back up a bit in case it already started there

while position_meeting(raycasted.bottom_left_x, raycasted.bottom_left_y, room_id) 
{
	raycasted.bottom_left_y--
	if raycasted.bottom_left_y < 0 {break}
}

//	Drop bottom_right coord down until it touches smth

while not position_meeting(raycasted.bottom_right_x, raycasted.bottom_right_y, room_id) 
{
	raycasted.bottom_right_y++
	if raycasted.bottom_right_y > room_height {break}
}

//	Go back up a bit in case it already started there

while position_meeting(raycasted.bottom_right_x, raycasted.bottom_right_y, room_id) 
{
	raycasted.bottom_right_y--
	if raycasted.bottom_right_y < 0 {break}
}

//	Calculating angle

angle = point_direction(-raycasted.bottom_left_x, raycasted.bottom_left_y, raycasted.bottom_right_x, raycasted.bottom_right_y)
theta = degtorad(angle)

image_angle = angle

#endregion


#region		Basic movement

if keyboard_check(vk_left) {vector.G = -5}
if keyboard_check(vk_right){vector.G = 5}
if not keyboard_check(vk_left) and not keyboard_check(vk_right) {vector.G = 0}
 
x += vector.G * cos(theta)
y += -1 * vector.G * sin(theta)

#endregion
