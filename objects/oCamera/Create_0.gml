view_enabled = true
view_visible[1] = true

cam_width = 360
cam_height = 240

camera = camera_create_view(0, 0, cam_width, cam_height)
view_camera[1] = camera

view_wport[1] = 2100
view_hport[1] = 1400

window_set_size(view_wport[1], view_hport[1])

x = xstart
y = ystart