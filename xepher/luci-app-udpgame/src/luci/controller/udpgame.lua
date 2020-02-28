module("luci.controller.udpgame", package.seeall)

function index()
	entry({"admin", "services", "udpgame"}, firstchild(), _("UDPGame")).dependent = false
	entry({"admin", "services", "udpgame", "udpgame"}, template("udpgame"), _("UDPGame"), 1)
	entry({"admin", "services", "udpgame", "config"}, cbi("udpgame"), _("Config"), 2)
	entry({"admin", "services", "udpgame", "restart"}, call("restart"))
	entry({"admin", "services", "udpgame", "stop"}, call("stop"))
end

function restart()
	luci.sys.exec("/etc/init.d/udpgame restart >/dev/null")
	luci.template.render("udpgame")
end

function stop()                                              
    luci.sys.exec("/etc/init.d/udpgame stop >/dev/null")
	luci.template.render("udpgame")
end
