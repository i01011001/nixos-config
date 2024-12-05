
local wezterm = require 'wezterm'
local config = {}
-- config.font = wezterm.font {
-- 	family = 'Iosevka Nerd Font Mono',
-- 	weight = 'Medium',
-- }
config.font = wezterm.font  'Iosevka Nerd Font Mono' 
config.color_scheme = "void"
config.font_size = 11.0
config.cell_width = 0.85
config.line_height = .95
config.enable_tab_bar = false
-- config.max_fps  = 120
config.window_close_confirmation = "NeverPrompt"
config.hide_mouse_cursor_when_typing = false
config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 5,
}
config.enable_wayland = true

-- config.webgpu_preferred_adapter = {
--         backend= "Vulkan",
--         device= 7957,
--         device_type= "DiscreteGpu",
--         driver= "NVIDIA",
--         driver_info= "550.40.80",
--         name= "NVIDIA GeForce RTX 2060",
--         vendor= 4318,
--     }
-- config.front_end = "WebGpu"
-- config.webgpu_power_preference = "HighPerformance"


return config
