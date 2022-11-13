ListLines, Off
; NoTrayIcon
SetBatchLines, -1
SetTitleMatchMode, 2
DetectHiddenWindows, Off


Toast(msg, sec) {
    SplashTextOn, 1000, 50, Message from ahk , %msg%
    Sleep, %sec%
    SplashTextOff
}

MinimizeApps(sec, titles)
{
    Loop, %sec% {
        For index, element in titles
        {
            IfWinExist, %element%
            {
                titles.Remove(index)
                Sleep, 1500
                WinMinimize, %element%
                ;Toast(element . " minimized", 1000)
            }
        }
        Sleep, 1000
    }
    Toast(element . "UzaiWindowMinizer finished", 1000)
}


titles := Object()
titles.Insert("Google Chat")
titles.Insert("Messenger")
titles.Insert("LINE")
titles.Insert("LINE")	;LINE will appear window twice.
titles.Insert("Zoom")
MinimizeApps(30, titles)
