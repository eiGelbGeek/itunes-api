tell application "iTunes"
		open location "http://ndr-njoy-live.cast.addradio.de/ndr/njoy/live/mp3/128/stream.mp3"
		set new_stream to (some URL track of library playlist 1 whose address is "http://ndr-njoy-live.cast.addradio.de/ndr/njoy/live/mp3/128/stream.mp3")
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
