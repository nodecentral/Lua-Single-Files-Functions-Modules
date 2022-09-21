module("xxionos", package.seeall)

-- Michal Kottman, 2011, public domain
local socket = require 'socket'
local smtp = require 'socket.smtp'
local ssl = require 'ssl'
local https = require 'ssl.https'
local ltn12 = require 'ltn12'

function sslCreate()
    local sock = socket.tcp()
    return setmetatable({
        connect = function(_, host, port)
            local r, e = sock:connect(host, port)
            if not r then return r, e end
            sock = ssl.wrap(sock, {mode='client', protocol='tlsv1'})
            return sock:dohandshake()
        end
    }, {
        __index = function(t,n)
            return function(_, ...)
                return sock[n](sock, ...)
            end
        end
    })
end

function sendMessage(subject, body)
    local msg = {
        headers = {
            to = 'Your Target <chris_parker_uk@hotmail.co.uk>',
            subject = subject
        },
        body = body
    }

    -- finally send it
    local ok, err = smtp.send {
        from = '<chris.parker@nodecentral.co.uk>',
        rcpt = '<chris_parker_uk@hotmail.co.uk>',
        source = smtp.message(msg),
        user = 'chris.parker@nodecentral.co.uk',
        password = 'ipswicht',
        server = 'smtp.ionos.co.uk',
        port = 465,
        create = sslCreate
    }
    if not ok then
        print("Mail send failed", err) -- better error handling required
    end
end

-- sendMessage("VeraPlus (Test Email) Restart Notification", "Hi, \n\nThis is the email body.\n\nMore information will be added later.\n\nKind Regards\nVera Home Control")