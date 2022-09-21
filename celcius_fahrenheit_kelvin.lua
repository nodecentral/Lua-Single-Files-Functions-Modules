-- fahrenheit_to_celsius
local function fahrenheit_to_celsius(fahrenheit)
	return (fahrenheit - 32) * 5 / 9
end

-- celsius_to_fahrenheit(celsius)
local function celsius_to_fahrenheit(celsius)
	return celsius * 9 / 5 + 32
end

-- celsius_to_fahrenheit
local function celsius_to_fahrenheit(t)
  if not tonumber(t) then
    log.err("Invalid temperature")
    return 0
  end 
  return t * 9 / 5 + 32 
end

-- Convert Kelvin to Celsius
local function kelvin_to_celsius(t)
  return t-273.16
end

-- Convert Kelvin to Fahrenheit
local function kelvin_to_fahrenheit(t)
  return (9/5 * (t - 273.16) + 32)
end

-- kelvin_to_fahrenheit
local function kelvin_to_fahrenheit(t)
  if not tonumber(t) then
    log.err("Invalid temperature")
    return 0
  end 
  return (t - 273.16) * 9/5 + 32
end
