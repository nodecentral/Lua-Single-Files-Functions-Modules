module("xxprowlstartupfunction", package.seeall)

function prowl_encode (s)
    s = string.gsub(s, " ", "+")
    return s
end

function my_prowl (appl, event, description)
    local prowl_url      = "https://api.prowlapp.com/publicapi/add?apikey="
        .. "4581181d251acedeb3808d49de9dea466758b21f"
        .. "&application=" .. prowl_encode(appl)
        .. "&event="         .. prowl_encode(event)
        .. "&description=" .. prowl_encode(description)
        .. "&priority=-1"
    luup.inet.wget(prowl_url)
end


-- Luup Restart Prowl Notification

function sendProwl()
     luup.inet.wget("https://api.prowlapp.com/publicapi/add?apikey=4581181d251acedeb3808d49de9dea466758b21f&application=Vera+System+Notification&event=Vera+Restart+Alert&description=The+Vera+Luup+Engine+Has+Been+Restarted&priority=-1")
end
luup.call_delay("sendProwl", 60)

-- my_prowl (appl, event, description)
-- my_prowl ("Vera Home Controller", "Testing code", "this could any description")

-- luup.inet.wget("http://www.prowlapp.com/publicapi/add?apikey=4581181d251acedeb3808d49de9dea466758b21f&application=DSC+Security+Event&event=Armed+Notification&description=The+DSC+alarm+system+has+been+armed&priority=1")

--[=====[
-- option1
	xxprowlstartupfunction.my_prowl ("Vera Home Controller", "Testing code", "this could any description")

--option2
	require "xxprowlstartupfunction" 
	my_prowl = xxprowlstartupfunction.my_prowl ("Vera Home Controller", "Testing code", "this could any description")
	]=====]--

--[[  =  xxprowlstartupfunction.my_prowl ("VeraPlus Home Controller", "Luup Reload Notification", "Your VeraPlus Home Automation controller has reloaded luup")  =. ]]-