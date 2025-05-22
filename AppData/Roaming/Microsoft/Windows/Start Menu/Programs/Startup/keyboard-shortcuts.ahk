; FUCK CAPS
SetCapsLockState "AlwaysOff"

; CAPSLOCK vim motions
Capslock & h::{
    Send "{Left}"
}
Capslock & j::{
    Send "{Down}"
}
Capslock & k::{
    Send "{Up}"
}
Capslock & l::{
    Send "{Right}"
}
Capslock & d::{
    Send "{PgDn}"
}
Capslock & u::{
    Send "{PgUp}"
}


; Meta + Shift + R - reload
+#r::
{
    Reload
}


; Meta + Alt + W - close window
!#w::
{
    Send "!{F4}"
    Return
}


; Meta + D - application launcher
#d::
{
    Send "^{Esc}"
}


; Meta + E - editor
#e::
{
    Run "notepad++.exe"
}


; Meta + F - file explorer
#f::
{
    Run "explorer.exe"
}


; Ctrl + Meta + F - file search
^#f::
{
    Run "C:\Program Files (x86)\Everything\Everything.exe"
}


; Ctrl + Meta + s :: sleep
^#s::
{
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
}


; Meta + c :: open calculator
; #c::
; {
;      Run "C:\Windows\System32\calc.exe"
; }


; Meta + m :: open task Manager
#m::
{
    Run "Taskmgr.exe"
}


; Meta + i :: open simple Image editor
#i::
{
    Run "mspaint.exe"
}

; Meta + g :: open Gimp
#g::
{
    Run "C:\Users\ryan.jensen\AppData\Local\Programs\GIMP 2\bin\gimp-2.10.exe"
    Return
}


