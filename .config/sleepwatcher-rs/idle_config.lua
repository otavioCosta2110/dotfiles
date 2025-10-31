Helpers:log("Loading idle_config.lua")

function LockScreen()
	Helpers:log("Locking Screen")
	IdleNotifier:run_once("swaylock -f -c 000000")
end

function LockHandler()
	IdleNotifier:run("playerctl -a pause")
	IdleNotifier:run("nmcli radio wwan off")
	LockScreen()
end

function UnlockHandler()
	DpmsOn()
end

function DpmsOn()
	Helpers:log("Turning screen on")
	IdleNotifier:run("/home/otavio/.local/scripts/dpms_on.sh")
end

function DpmsOff()
	Helpers:log("Turning screen off")
	IdleNotifier:run("/home/otavio/.local/scripts/dpms_off.sh")
end

function Suspend()
	IdleNotifier:run("systemctl suspend")
end

function ScreenLock(event)
	if event == "idled" then
		LockScreen()
	end
end

function ScreenOff(event)
	if event == "resumed" then
		DpmsOn()
	elseif event == "idled" then
    print("idled")
		DpmsOff()
	end
end

function SystemSuspend(event)
	if event == "idled" then
		Suspend()
	end
end

DbusHandler:PrepareSleep("LockHandler")
DbusHandler:LockHandler("LockHandler")
-- DbusHandler:UnlockHandler("UnlockHandler")
IdleNotifier:get_notification(300,  "ScreenOff")
IdleNotifier:get_notification(310,  "ScreenLock")
IdleNotifier:get_notification(3600, "SystemSuspend")

Helpers:log("Finished loading idle_config.lua")
