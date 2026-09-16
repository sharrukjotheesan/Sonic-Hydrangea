angle = 0
theta = degtorad(angle)			//	Radians version of 'angle' used for calculations

room_id = layer_tilemap_get_id(layer_get_id("Tiles_1"))		//	ID of room (tile layer which is the floor)

vector = 
{					
	G: 0,						//	Ground speed vector which is split into:
	X: 0,						//	Horizontal vector
	Y: 0						//	Vertical vector
}

modes = ["ground", "air"]		//	Different ways Sonic behaves
current_mode = ""				//	Current mode
