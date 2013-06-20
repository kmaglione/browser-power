;window_title = "Windows Internet Explorer"
SetTitleMatchMode, 2

SendToBrowser(title, delay, text) {
	Sleep, % delay
	if WinExist(title)
	{
		WinActivate
	} else {
		MsgBox, "Could not find window:" %title%
		Exit
	}
	
	Send % text
}

DoIt(exe, window_title) {
	; run ff
	Run "C:\Program Files\Intel\Power Gadget 2.5\PowerLog.exe" -cmd %exe%
	; wait for it to get ready
	SendToBrowser(window_title,5000, "Taras Glek{Enter}")
	SendToBrowser(window_title,5000, "^t")
	SendToBrowser(window_title,10, "^l")
	SendToBrowser(window_title,10, "http://en.wikipedia.org/wiki/Eurovision_Song_Contest_2013{Enter}")
	Sleep, 10000
	Loop 100
	{
	   SendToBrowser(window_title,10, "{Down}")
	}
	SendToBrowser(window_title,5000, "!{F4}")
}

DoIt("C:\Program Files (x86)\Nightly\firefox.exe -no-remote -profile normal-profile www.google.com", "Nightly")
;DoIt("ie.bat", "Windows Internet Explorer")