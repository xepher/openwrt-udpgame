require("luci.sys")

m = Map("udpgame", translate("UDPGame"), translate("Config udpgame"))

s = m:section(TypedSection, "udpgame", "")
s.addremove = false
s.anonymous = true

server = s:option(Value, "server", translate("Server IP"))
service_port = s:option(Value, "service_port", translate("Service Port"))
udp2raw_port = s:option(Value, "udp2raw_port", translate("Udp2raw Port"))
password = s:option(Value, "password", translate("Password"))
fec = s:option(Value, "fec", translate("Fec"))

return m