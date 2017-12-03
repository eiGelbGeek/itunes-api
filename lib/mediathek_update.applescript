on run argv
		my write_to_file(item 1 of argv, "/tmp/addMediaPfad.txt", false)
		set aPath to (do shell script "sed 's/---/\\//g' /tmp/addMediaPfad.txt")
		# Timeout (in seconds) for updating the library, if necessary, set it higher for large libraries!
		set aTimeout to "600"
		set aPfad to POSIX file aPath
		tell application "iTunes"
			with timeout of aTimeout seconds
				add aPfad
			end timeout
		end tell
end run

on write_to_file(this_data, target_file, append_data)
	try
		set the target_file to the target_file as string
		log target_file
		set the open_target_file to open for access target_file with write permission
		log "trying"
		if append_data is false then set eof of the open_target_file to 0
		write this_data to the open_target_file starting at eof
		close access the open_target_file
		return true
	on error
		log "failed"
		try
			close access file target_file
		end try
		return false
	end try
end write_to_file
