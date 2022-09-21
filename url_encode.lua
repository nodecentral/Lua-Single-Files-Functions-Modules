function url_encode(str)
  if (str) then
    str = string.gsub (str, "\n", "\r\n")
    str = string.gsub (str, "([^%w %-%_%.%~])",
        function (c) return string.format ("%%%02X", string.byte(c)) end)
    str = string.gsub (str, " ", "+")
  end
  return str
end

-- oMy need for url encoding is for sending alerts with differing content (shown below if someone needs similar behaviour):

local status, t_stamp =  luup.variable_get("urn:micasaverde-com:serviceId:PowermaxAlarmPanel1", "PanelStatusData", 5)
local status = tostring(status)
luup.inet.wget("http://127.0.0.1:3480/data_request?id=add_alert&device=" .. devnro .. "&type=3&source=3&users=verauser&description=" .. url_encode(status))

--- Another way

local url = require "socket.url"
local text = "A space or two"
local enc = url.escape (text)
print (enc)

local dec = url.unescape (enc)
print (dec)

-- will produce the output:

A%20space%20or%20two
A space or two


-- another way
-- https://community.getvera.com/t/lua-socket-url-unescape-and-spaces/184625/4

-- We use encodeURIComponent() function and we also replace ’ with %27” and use the following encode function

     encodeString: function(str){
            try{
                var str = encodeURIComponent(str);
                // treat single quote
                str = str.replace("'","%27");
                return str;
            } catch(e) {
                Utils.logError('Error in Utils.encodeString(): ' + e);
            }
        },

		--I ended up putting this into my code to further parse url type strings

  newID = string.gsub(newID,'%&','%%26') -- encode any &
  newID = string.gsub(newID,'#','%%23')  -- encode any #
  newID = string.gsub(newID,'+','%%2B')  -- encode any +
  newID = string.gsub(newID,'@','%%40')  -- encode any @