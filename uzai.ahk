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


HideApps(sec, data)
{
    Loop, %sec% {
        For i, elm in data
        {
            title := elm.title
            action := elm.action
            ;Toast("search title=" . title . ", action=" . action, 1000)

            IfWinExist, %title%
            {
                ;Toast("found title=" . title, 1000)
                If( action = "close" )
                {
                    ;Toast("close title=" . title, 1000)
                    WinClose, %title%
                }
                Else If( action = "minimize" )
                {
                    ;Toast("minimize title=" . title, 1000)
                    WinMinimize, %title%
                }
                data.Remove(i)
            }
        }

        Sleep, 1000
    }
    ;Toast("HideApp2 finished", 1000)
}




arr := []
arr.Push({title:"Google Chat", action:"minimize"})
arr.Push({title:"Messenger", action:"close"})
arr.Push({title:"LINE", action:"close"})
arr.Push({title:"LINE", action:"close"})
arr.Push({title:"Zoom", action:"close"})

HideApps(30, arr)
