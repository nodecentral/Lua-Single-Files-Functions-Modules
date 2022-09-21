module("xxcifsmount", package.seeall)

function cifsmount ()

x = {user="enter_name", 
	pass="enter_password", 
	device="//xxx.xxx.xxx.xxx/folder_name", 
	directory="/mnt/nas"}

--print(x.user, x.pass, x.device, x.directory)

	local function df ()
		local info
		local p = io.popen ("df",'r')
			if p then info = p:read "*a"; p:close () end
		return info	
	end

	local function log (msg) 
	  print(("'%s' %s"): format (x.device or '', msg), 'mount') 
 	end
  
	local df = df ()
		if df: find (x.device, 1, true) then
			print "already mounted"
		else
			local cmd = table.concat {"mount -t cifs -o user=", x.user, ",pass=", x.pass, ' ', x.device, ' ', x.directory}
			local ok = os.execute (cmd)
			log (ok)
				if ok then print "mounted OK"
				else print "failed to mount, Vera will try again in 10 mins" 
				end
		end
end
