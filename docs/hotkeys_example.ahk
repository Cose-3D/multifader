^!F1::
if WinExist("ahk_exe Spotify.exe") {
    ; APPCOMMAND_MEDIA_PAUSE = 47
    PostMessage, 0x319, , 47 << 16, , ahk_exe Spotify.exe
    ToolTip, Spotify: PAUSA
    SetTimer, RemoveToolTip, 1000
}
return

^!F2::
if WinExist("ahk_exe Spotify.exe") {
    ; APPCOMMAND_MEDIA_PLAY = 46
    PostMessage, 0x319, , 46 << 16, , ahk_exe Spotify.exe
    ToolTip, Spotify: PLAY
    SetTimer, RemoveToolTip, 1000
}
return

RemoveToolTip:
    ToolTip
return

^!F3::
Browsers := ["msedge.exe"]
For _, browser in Browsers {
    if WinExist("ahk_exe " browser) {
        PostMessage, 0x319, , 47 << 16, , ahk_exe %browser%
    }
}
ToolTip, Browser: PAUSA
SetTimer, RemoveToolTip, 1000
return

^!F4::
Browsers := ["msedge.exe"]
For _, browser in Browsers {
    if WinExist("ahk_exe " browser) {
        PostMessage, 0x319, , 46 << 16, , ahk_exe %browser%
    }
}
ToolTip, Browser: PLAY
SetTimer, RemoveToolTip, 1000
return

^!F5::
Browsers := ["firefox.exe", "opera.exe", "brave.exe", "librewolf.exe"]
For _, browser in Browsers {
    if WinExist("ahk_exe " browser) {
        PostMessage, 0x319, , 47 << 16, , ahk_exe %browser%
    }
}
ToolTip, Browser: PAUSA
SetTimer, RemoveToolTip, 1000
return

^!F6::
Browsers := ["firefox.exe", "opera.exe", "brave.exe", "librewolf.exe"]
For _, browser in Browsers {
    if WinExist("ahk_exe " browser) {
        PostMessage, 0x319, , 46 << 16, , ahk_exe %browser%
    }
}
ToolTip, Browser: PLAY
SetTimer, RemoveToolTip, 1000
return

^!F7::
if WinExist("ahk_exe mpv.exe") {
    ControlSend, ahk_parent, ^!p, ahk_exe mpv.exe
    ToolTip, Mpv: PAUSA
    SetTimer, RemoveToolTip, 1000
}
return

^!F8::
if WinExist("ahk_exe mpv.exe") {
    ControlSend, ahk_parent, ^!o, ahk_exe mpv.exe
    ToolTip, Mpv: PLAY
    SetTimer, RemoveToolTip, 1000
}
return

^!F11::
KeyWait, F4
DetectHiddenWindows, On
SetTitleMatchMode, 2
winamp_hwnd := WinExist("ahk_class Winamp v1.x")

WM_USER := 0x400
IPC_ISPLAYING := 104

state := DllCall("SendMessage", "UInt", winamp_hwnd, "UInt", WM_USER, "UInt", 0, "UInt", IPC_ISPLAYING)

if (state = 1) {
    PostMessage, 0x111, 40046, 0, , ahk_class Winamp v1.x
    ToolTip, Winamp: PAUSA
    SetTimer, RemoveToolTip, 1000
}
else if (state = 3) {
    ToolTip, Winamp in pausa
    SetTimer, RemoveToolTip, 1000
}
else if (state = 0) {
    ToolTip, Winamp in stop
    SetTimer, RemoveToolTip, 1000
}
else
    MsgBox, Stato Winamp sconosciuto o errore.
return


^!F12::
KeyWait, F3
DetectHiddenWindows, On
SetTitleMatchMode, 2
winamp_hwnd := WinExist("ahk_class Winamp v1.x")

WM_USER := 0x400
IPC_ISPLAYING := 104

state := DllCall("SendMessage", "UInt", winamp_hwnd, "UInt", WM_USER, "UInt", 0, "UInt", IPC_ISPLAYING)

if (state = 1) {
    ToolTip, Winamp sta riproducendo.
    SetTimer, RemoveToolTip, 1000
}
else if(state = 3 || state = 0) {
    PostMessage, 0x111, 40045, 0, , ahk_class Winamp v1.x
    ToolTip, Winamp: PLAY
    SetTimer, RemoveToolTip, 1000
}
else
    MsgBox, Stato Winamp sconosciuto o errore.
return
