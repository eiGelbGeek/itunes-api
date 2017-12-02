on run argv
	if item 1 of argv is not equal to "delete" then
		set webradio_list to {¬
			"http://mp3channels.webradio.rockantenne.de/rockantenne", ¬
			"http://radiokiepenkerlnord.radiovonhier.de/high/stream.mp3"}

		set webradio_select_commit to item 1 of argv
		set webradio_select to item webradio_select_commit of webradio_list

		tell application "iTunes"
			open location webradio_select
		end tell
	end if

	if item 1 of argv is equal to "delete" then
		tell application "iTunes"
			repeat with t in (tracks of library playlist 1 whose kind contains "Internetaudio-Stream")
				tell library playlist 1 to delete t
			end repeat
			repeat with t in (tracks of library playlist 1 whose kind contains "MPEG-Audio-Stream")
				tell library playlist 1 to delete t
			end repeat
		end tell
	end if
end run
