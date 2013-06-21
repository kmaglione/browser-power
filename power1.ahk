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

DoIt(exe, window_title, log) {
	; run ff
	power_log := "C:\Program Files\Intel\Power Gadget 2.5\PowerLog.exe"
    if not FileExist(power_log) {
		;MsgBox, "Could not find " . %power_log%		
		power_log := "C:\Program Files\Intel\Power Gadget 2.6\PowerLog.exe"
    }
	if not FileExist(power_log) {
		MsgBox, "Could not find " . %power_log%
		Exit
    }
	Run, %power_log% -cmd %exe% ,,Max,OutputVarPID
	; wait for it to get ready
	SendToBrowser(window_title,5000, "Taras Glek{Enter}")
	SendToBrowser(window_title,5000, "^t")
	SendToBrowser(window_title,100, "^l")
	SendToBrowser(window_title,100, "http://en.wikipedia.org/wiki/Eurovision_Song_Contest_2013{Enter}")
	Sleep, 10000
	Loop 100
	{
	   SendToBrowser(window_title,10, "{Down}")
	}
	SendToBrowser(window_title,5000, "!{F4}")
	WinWait ahk_pid %OutputVarPID%
	Sleep, 1000
	FileMove, PowerLog.ipg, %log%
}

DoIt("C:\Program Files (x86)\Nightly\firefox.exe -no-remote -profile normal-profile www.google.com", "Nightly", "nightly_power.log")
Sleep, 1000
DoIt("ie.bat", "Windows Internet Explorer", "ie_power.log")