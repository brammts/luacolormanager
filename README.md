# ColorManager Library
==========================

## Version: 1.0.0

## Description:
The ColorManager library is a Lua library that provides a set of functions for working with colors in HEX and RGB formats. It allows you to convert between HEX and RGB, manipulate colors, and compare colors.

## Functions:
-------------

### HEX to RGB

* `hex_to_rgb(color_hex)`: Converts a HEX color to an RGB color.

### RGB to HEX

* `rgb_to_hex(red, green, blue)`: Converts an RGB color to a HEX color.

### Color Component Functions

* `get_color_component(color, component)`: Returns the value of a specific component (red, green, or blue) of a color.
* `set_color_component(color, component, value)`: Sets the value of a specific component (red, green, or blue) of a color.

### Color Manipulation Functions

* `invert_color(color)`: Inverts a color by subtracting each component from 255.
* `brighten_color(color, amount)`: Brightens a color by adding the specified amount to each component.
* `darken_color(color, amount)`: Darkens a color by subtracting the specified amount from each component.

### Color Comparison Functions

* `are_colors_equal(color1, color2)`: Checks if two colors are equal.
* `are_colors_similar(color1, color2, threshold)`: Checks if two colors are similar within a specified threshold.

## Usage:
---------

To use the ColorManager library, simply require it in your Lua script and call the desired functions.

```lua
local ColorManager = require("colormanager")

local hex_color = "#FF0000"
local rgb_color = ColorManager.hex_to_rgb(hex_color)
print(rgb_color)  -- {255, 0, 0}

local brightened_color = ColorManager.brighten_color(hex_color, 50)
print(brightened_color)  -- #FF7F7F