local M = {}

-- HEX to RGB functions

function M.hex_to_rgb(color_hex)
    color_hex = color_hex:gsub("#", "")

    local red = tonumber(color_hex:sub(1, 2), 16)
    local green = tonumber(color_hex:sub(3, 4), 16)
    local blue = tonumber(color_hex:sub(5, 6), 16)

    return { red, green, blue }
end

-- RGB to HEX functions

function M.rgb_to_hex(red, green, blue)
    local hex_red = string.format("%02X", red)
    local hex_green = string.format("%02X", green)
    local hex_blue = string.format("%02X", blue)

    return "#" .. hex_red .. hex_green .. hex_blue
end

-- Color component functions

function M.get_color_component(color, component)
    if type(color) == "string" then
        color = M.hex_to_rgb(color)
    end

    if component == "red" then
        return color[1]
    elseif component == "green" then
        return color[2]
    elseif component == "blue" then
        return color[3]
    else
        error("Invalid component")
    end
end

function M.set_color_component(color, component, value)
    if type(color) == "string" then
        color = M.hex_to_rgb(color)
    end

    if component == "red" then
        color[1] = value
    elseif component == "green" then
        color[2] = value
    elseif component == "blue" then
        color[3] = value
    else
        error("Invalid component")
    end

    return M.rgb_to_hex(color[1], color[2], color[3])
end

-- Color manipulation functions

function M.invert_color(color)
    if type(color) == "string" then
        color = M.hex_to_rgb(color)
    end

    local inverted_red = 255 - color[1]
    local inverted_green = 255 - color[2]
    local inverted_blue = 255 - color[3]

    return M.rgb_to_hex(inverted_red, inverted_green, inverted_blue)
end

function M.brighten_color(color, amount)
    if type(color) == "string" then
        color = M.hex_to_rgb(color)
    end

    local brightened_red = math.min(255, color[1] + amount)
    local brightened_green = math.min(255, color[2] + amount)
    local brightened_blue = math.min(255, color[3] + amount)

    return M.rgb_to_hex(brightened_red, brightened_green, brightened_blue)
end

function M.darken_color(color, amount)
    if type(color) == "string" then
        color = M.hex_to_rgb(color)
    end

    local darkened_red = math.max(0, color[1] - amount)
    local darkened_green = math.max(0, color[2] - amount)
    local darkened_blue = math.max(0, color[3] - amount)

    return M.rgb_to_hex(darkened_red, darkened_green, darkened_blue)
end

-- Color comparison functions

function M.are_colors_equal(color1, color2)
    if type(color1) == "string" then
        color1 = M.hex_to_rgb(color1)
    end

    if type(color2) == "string" then
        color2 = M.hex_to_rgb(color2)
    end

    return color1[1] == color2[1] and color1[2] == color2[2] and color1[3] == color2[3]
end

function M.are_colors_similar(color1, color2, threshold)
    if type(color1) == "string" then
        color1 = M.hex_to_rgb(color1)
    end

    if type(color2) == "string" then
        color2 = M.hex_to_rgb(color2)
    end

    local red_diff = math.abs(color1[1] - color2[1])
    local green_diff = math.abs(color1[2] - color2[2])
    local blue_diff = math.abs(color1[3] - color2[3])

    return red_diff <= threshold and green_diff <= threshold and blue_diff <= threshold
end

return M