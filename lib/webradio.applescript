#Unoptimized_Applescript

on run argv
	#Webradio Stations
	set stream_URL01 to "http://mp3channels.webradio.rockantenne.de/rockantenne"
	set stream_URL02 to "http://radiokiepenkerlnord.radiovonhier.de/high/stream.mp3"

	if item 1 of argv is equal to "1" then
		tell application "iTunes"
			open location stream_URL01
			set new_stream to (some URL track of library playlist 1 whose address is stream_URL01)
			if not (user playlist "Webradio" exists) then
				make new playlist with properties {name:"Webradio"}
			else
				delete tracks of playlist "Webradio"
			end if
			duplicate new_stream to playlist "Webradio"
			tell playlist "Webradio"
				play track (get name of new_stream)
			end tell
		end tell
	end if

	if item 1 of argv is equal to "2" then
		tell application "iTunes"
			open location stream_URL02
			set new_stream to (some URL track of library playlist 1 whose address is stream_URL02)
			if not (user playlist "Webradio" exists) then
				make new playlist with properties {name:"Webradio"}
			else
				delete tracks of playlist "Webradio"
			end if
			duplicate new_stream to playlist "Webradio"
			tell playlist "Webradio"
				play track (get name of new_stream)
			end tell
		end tell
	end if
end run
