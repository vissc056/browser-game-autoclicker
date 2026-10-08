#MaxThreadsPerHotkey 2
#SingleInstance Force

#IfWinActive ahk_exe chrome.exe

F7::
    if (ToggleA1) {
        Gosub, StopA1
        return
    }

    Gosub, StopAllModes
    ToggleA1 := 1

    ToolTip, Press a NUMBER (0-9) to assign to F7...
    Input, KeyA1, L1, {LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{Tab}{Enter}{Space}{Backspace}{Delete}

    if KeyA1 not in 0,1,2,3,4,5,6,7,8,9
    {
        ToggleA1 := 0
        ToolTip, Please press a NUMBER (0-9)
        SetTimer, RemoveToolTip, -1000
        return
    }

    KeyWait, %KeyA1%

    IsFirstLoopA1 := true

    Hotkey, IfWinActive, ahk_exe chrome.exe
    Hotkey, ~$%KeyA1%, UserStopA1, On
    Hotkey, IfWinActive

    SetTimer, RunModeA1, 10

    ToolTip, F7 Active: [%KeyA1% + %KeyA1% + Click]
    SetTimer, RemoveToolTip, -1000
return


UserStopA1:
    if (ToggleA1)
        Gosub, StopA1
return


RunModeA1:
    if (!ToggleA1)
        return

    if (IsFirstLoopA1) {
        Send, %KeyA1%
        Click
        IsFirstLoopA1 := false
    } else {
        Send, %KeyA1%%KeyA1%
        Click
    }
return


StopA1:
    ToggleA1 := 0
    SetTimer, RunModeA1, Off

    if (KeyA1 != "") {
        Hotkey, IfWinActive, ahk_exe chrome.exe
        Hotkey, ~$%KeyA1%, UserStopA1, Off
        Hotkey, IfWinActive
    }

    KeyA1 := ""

    ToolTip, F7 Spammer OFF
    SetTimer, RemoveToolTip, -1000
return


F8::
    if (ToggleA2) {
        Gosub, StopA2
        return
    }

    Gosub, StopAllModes
    ToggleA2 := 1

    ToolTip, Press a NUMBER (0-9) to assign to F8...
    Input, KeyA2, L1, {LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{Tab}{Enter}{Space}{Backspace}{Delete}

    if KeyA2 not in 0,1,2,3,4,5,6,7,8,9
    {
        ToggleA2 := 0
        ToolTip, Please press a NUMBER (0-9)
        SetTimer, RemoveToolTip, -1000
        return
    }

    KeyWait, %KeyA2%

    IsFirstLoopA2 := true

    Hotkey, IfWinActive, ahk_exe chrome.exe
    Hotkey, ~$%KeyA2%, UserStopA2, On
    Hotkey, IfWinActive

    SetTimer, RunModeA2, 10

    ToolTip, F8 Active: [%KeyA2% + Click]
    SetTimer, RemoveToolTip, -1000
return


UserStopA2:
    if (ToggleA2)
        Gosub, StopA2
return


RunModeA2:
    if (!ToggleA2)
        return

    if (IsFirstLoopA2) {
        Click
        IsFirstLoopA2 := false
    } else {
        Send, %KeyA2%
        Click
    }
return


StopA2:
    ToggleA2 := 0
    SetTimer, RunModeA2, Off

    if (KeyA2 != "") {
        Hotkey, IfWinActive, ahk_exe chrome.exe
        Hotkey, ~$%KeyA2%, UserStopA2, Off
        Hotkey, IfWinActive
    }

    KeyA2 := ""

    ToolTip, F8 Spammer OFF
    SetTimer, RemoveToolTip, -1000
return


F9::
    if (ModeB > 0) {
        Gosub, StopModeB
        return
    }

    Gosub, StopAllModes

    ToolTip, Press a NUMBER to start F9...
    Input, KeyB, L1, {LControl}{RControl}{LAlt}{RShift}{LShift}{Tab}{Enter}{Space}{Backspace}{Delete}

    if KeyB not in 0,1,2,3,4,5,6,7,8,9
    {
        KeyB := ""
        ToolTip, Please press a NUMBER (0-9)
        SetTimer, RemoveToolTip, -1000
        return
    }

    KeyWait, %KeyB%

    ModeB := 1

    Hotkey, IfWinActive, ahk_exe chrome.exe
    Hotkey, ~$%KeyB%, ModeBKey, On
    Hotkey, IfWinActive

    SetTimer, RunModeB, 10

    ToolTip, F9: 1 Action Mode
    SetTimer, RemoveToolTip, -1000
return


ModeBKey:
    if (ModeB = 1) {
        ModeB := 2

        ToolTip, F9: 5 Action Mode
        SetTimer, RemoveToolTip, -1000
        return
    }

    if (ModeB = 2) {
        Gosub, StopModeB
        return
    }
return


RunModeB:
    if (ModeB = 0)
        return

    Click
return


StopModeB:
    ModeB := 0
    SetTimer, RunModeB, Off

    if (KeyB != "") {
        Hotkey, IfWinActive, ahk_exe chrome.exe
        Hotkey, ~$%KeyB%, ModeBKey, Off
        Hotkey, IfWinActive
    }

    KeyB := ""

    ToolTip, F9 Click Spammer OFF
    SetTimer, RemoveToolTip, -1000
return


F10::
    Gosub, StopAllModes

    ToolTip, All Spammers Stopped
    SetTimer, RemoveToolTip, -1000
return


StopAllModes:
    Gosub, StopA1
    Gosub, StopA2
    Gosub, StopModeB
return


RemoveToolTip:
    ToolTip
return


#IfWinActive

F12::ExitApp
