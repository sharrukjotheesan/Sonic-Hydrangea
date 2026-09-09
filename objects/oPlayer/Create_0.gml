angle = 0
theta = degtorad(angle)			//	Radians version of 'angle' used for calculations

vector = 
{					
	G: 0,						//	Ground speed vector which is split into:
	X: 0,						//	Horizontal vector
	Y: 0						//	Vertical vector
}

raycasts = 
{
	//	bbox_left, bbox_bottom is bottom left
	//	bbox_right, bbox_bototm is bottom right
	
	left_floor: bbox_bottom,	//	Highest point where the ground is (Where Sonic should stand)
	right_floor: bbox_bottom	//	Ditto but right
								//	Both used to calculate angle
} 

modes = ["ground", "air"]		//	Different ways Sonic behaves
current_mode = ""				//	Current mode
