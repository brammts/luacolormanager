local ColorManager = require("colormanager")

local function test_hex_to_rgb()
  local hex_color = "#FF0000"
  local rgb_color = ColorManager.hex_to_rgb(hex_color)
  assert(rgb_color[1] == 255 and rgb_color[2] == 0 and rgb_color[3] == 0)
end

local function test_rgb_to_hex()
  local red, green, blue = 255, 0, 0
  local hex_color = ColorManager.rgb_to_hex(red, green, blue)
  assert(hex_color == "#FF0000")
end

local function test_get_color_component()
  local hex_color = "#FF0000"
  local red = ColorManager.get_color_component(hex_color, "red")
  assert(red == 255)
end

local function test_set_color_component()
  local hex_color = "#FF0000"
  local new_color = ColorManager.set_color_component(hex_color, "green", 255)
  assert(new_color == "#FFFF00")
end

local function test_invert_color()
  local hex_color = "#FF0000"
  local inverted_color = ColorManager.invert_color(hex_color)
  assert(inverted_color == "#00FFFF")
end

local function test_darken_color()
  local hex_color = "#FF0000"
  local darkened_color = ColorManager.darken_color(hex_color, 50)
  assert(darkened_color == "#7F0000")
end

local function test_are_colors_equal()
  local hex_color1 = "#FF0000"
  local hex_color2 = "#FF0000"
  assert(ColorManager.are_colors_equal(hex_color1, hex_color2))
end

local function test_are_colors_similar()
  local hex_color1 = "#FF0000"
  local hex_color2 = "#FF7F7F"
  assert(ColorManager.are_colors_similar(hex_color1, hex_color2, 50))
end

test_hex_to_rgb()
test_rgb_to_hex()
test_get_color_component()
test_set_color_component()
test_invert_color()
test_brighten_color()
test_darken_color()
test_are_colors_equal()
test_are_colors_similar()