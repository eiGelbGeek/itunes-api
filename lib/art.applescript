set now_playing to ""
set UnixPath to POSIX path of ((path to me as text) & "::")

tell application "iTunes"
	if player state is playing then
		try
			set now_playing to get kind of current track
		end try
		if now_playing is not equal to "Internetaudio-Stream" then
			try
				set aTrack to the current track
				set aArtwork to data of artwork 1 of aTrack
				my write_to_file(aArtwork, "/tmp/currently-playing.jpg", false)
			on error
				tell current application to do shell script "cp " & UnixPath & "img/no_cover.jpg" & " /tmp/currently-playing.jpg"
				log "error getting info"
			end try
		else if now_playing is equal to "Internetaudio-Stream" then
			tell current application to do shell script "cp " & UnixPath & "img/livestream_cover.jpg" & " /tmp/currently-playing.jpg"
		else if now_playing is equal to "MPEG-Audio-Stream" then
			tell current application to do shell script "cp " & UnixPath & "img/livestream_cover.jpg" & " /tmp/currently-playing.jpg"
		end if
	else if player state is paused then
		tell current application to do shell script "cp " & UnixPath & "img/paused_cover.jpg" & " /tmp/currently-playing.jpg"
	else if player state is stopped then
		tell current application to do shell script "cp " & UnixPath & "img/stopped_cover.jpg" & " /tmp/currently-playing.jpg"
	end if
end tell

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
