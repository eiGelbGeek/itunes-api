on run argv
	set webradio_list to {}
	set webradio_config_Path to POSIX path of ((path to home folder as text) & "Music:iTunes:webradio_stations.txt")
	set webradio to paragraphs of (read POSIX file webradio_config_Path)
	repeat with nextLine in webradio
		if length of nextLine is greater than 0 then
			copy nextLine to the end of webradio_list
		end if
	end repeat

	if item 1 of argv is not equal to "delete" then
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
