player_x = oMovebox.x - 1/2 * cam_width
player_y = oMovebox.y - 1/2 * cam_height

x = lerp(x, player_x, 0.1)
y = lerp(y, player_y, 0.1)

camera_set_view_pos(camera, round(x), round(y))