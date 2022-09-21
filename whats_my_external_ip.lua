--

require "xxprowlnotification" 
local http = require("socket.http")
local json = require("dkjson")

-----------------------------------------
-- Fetches the external IP.
-- Uses http://ipinfo.io web service.
-- @return string IP address, or `nil + errormsg`

local function externalip()
	local resp,code,headers,status = http.request("http://ipinfo.io/json")
		if code ~= 200 then 
			return nil, "Failed fetching external IP; "..tostring(status) 
		end
	local data, err = json.decode(resp)
		if not data then
			return nil, "Failed fetching external IP; "..tostring(err)
		end
		if data.ip then
			xxprowlnotification.my_prowl ("VeraPlus Cabin", "My External IP Notification", "Your External IP is " .. data.ip )
			return data.ip
  		else
    		return nil, "Failed fetching external IP; no ip field was returned"
  		end
	end

externalip()