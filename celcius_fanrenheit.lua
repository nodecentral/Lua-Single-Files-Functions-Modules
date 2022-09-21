--


--[[
-----------------------------
  Some local functions
-----------------------------
--]]

-- local 
function kelvin_to_fahrenheit(t)
  if not tonumber(t) then
    log.err("Invalid temperature")
    return 0
  end 
  return (t - 273.16) * 9/5 + 32
end

-- local 
function celsius_to_fahrenheit(t)
  if not tonumber(t) then
    log.err("Invalid temperature")
    return 0
  end 
  return t * 9 / 5 + 32 
end

-- Convert Kelvin to Celsius
function kelvin_to_celsius(t)
  return t-273.16
end

-- Convert Kelvin to Fahrenheit
function kelvin_to_fahrenheit(t)
  return (9/5 * (t - 273.16) + 32)
end