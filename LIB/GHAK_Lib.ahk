; Function for adding info to log file
LogEvent(msg){
	FileAppend, % "`n" TimeStamp() A_Tab msg, % FILE_A.LOG_LOC
	FileAppend, % "`n" TimeStamp() A_Tab msg, % FILE_A.FULL_LOG_LOC
	return
}
TimeStamp(){
	return (A_YYYY "." A_MM "." A_DD "@" A_Hour ":" A_Min)
}

ErrMsg(msg){
	LogEvent("ERROR!" A_Tab msg)
	MsgBox, 0x2033, % "Error!", % "An error has occurred:`n===`n"
		. msg 
		. "`n===`n`nPress Yes to continue running the script`n"
		. "Press No to reload the script`n"
		. "Press Cancel to close the script."
	IfMsgBox, No
	{
		Reload
		ExitApp
	}
	IfMsgBox, Cancel
		Exitapp
	return
}

; Function ran at script exit/close
ExitScript(){
	; Make log of shutdown
	LogEvent("Program shutdown issued.")
	ExitApp
}
