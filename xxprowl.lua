module("prowl", package.seeall)

function prowl_encode (s)
    s = string.gsub(s, " ", "+")
    return s
end

function my_prowl (appl, event, description)
    local prowl_url      = "https://api.prowlapp.com/publicapi/add?apikey="
        .. "ADD_YOUR_API_KEY"
        .. "&application=" .. prowl_encode(appl)
        .. "&event="         .. prowl_encode(event)
        .. "&description=" .. prowl_encode(description)
        .. "&priority=-1"
    luup.inet.wget(prowl_url)
end
