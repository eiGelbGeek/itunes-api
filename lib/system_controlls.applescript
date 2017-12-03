on run argv
	if item 1 of argv is equal to "restart_itunes" then
		tell application "iTunes" to quit
		delay 3
		tell application "iTunes" to run
	end if
	if item 1 of argv is equal to "restart_macos" then
		tell application "Finder" to restart
	end if
	if item 1 of argv is equal to "sleep_macos" then
		tell application "Finder" to sleep
	end if
	if item 1 of argv is equal to "shutdown_macos" then
		tell application "Finder" to shut down
	end if
end run
