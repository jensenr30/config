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


!#w::
{

}

#d::
{
    ; todo: open start menu
}

#e::
{
    Run "notepad++.exe"
}

#f::
{
    Run "explorer.exe"
}

^#f::
{
    Run "C:\Program Files (x86)\Everything\Everything.exe"
}

;-------------------------------------------------------------------------------
; Meta + comma (,)  :: open this file (edit shortcuts)
;-------------------------------------------------------------------------------
; #,::
;     Run notepad.exe "C:\Users\RyanJ\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\keyboard-shortcuts.ahk"
; return

;-------------------------------------------------------------------------------
; Ctrl + Meta + s :: sleep
;-------------------------------------------------------------------------------
^#s::
{
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
}




; ;-------------------------------------------------------------------------------
; ; Meta + t :: open a terminal (git bash)
; ;-------------------------------------------------------------------------------
; #t::
;     Run, "C:\Program Files\Git\git-bash.exe"
; return


; ;-------------------------------------------------------------------------------
; ; Ctrl + Meta + t :: open powershell
; ;-------------------------------------------------------------------------------
; ^#t::
;     Run, "C:\Windows\SysWOW64\WindowsPowerShell\v1.0\powershell.exe"
; return


; ;-------------------------------------------------------------------------------
; ; Meta + Alt + t :: open Cmder.exe
; ;-------------------------------------------------------------------------------
; !#t::
;     Run, "C:\Users\jense\cmder\Cmder.exe"
; return


; ;-------------------------------------------------------------------------------
; ; Meta + c :: open calculator
; ;-------------------------------------------------------------------------------
; #c::
;     Run, "C:\Windows\System32\calc.exe"
; return


; ;-------------------------------------------------------------------------------
; ; Meta + m :: open task Manager
; ;-------------------------------------------------------------------------------
; #m::
;     Run, "Taskmgr.exe"
; return


;-------------------------------------------------------------------------------
; Meta + i :: open simple Image editor
;-------------------------------------------------------------------------------
;#i::
;    Run, "mspaint.exe"
;return


;-------------------------------------------------------------------------------
; Meta + g :: open Gimp
;-------------------------------------------------------------------------------
;#g::
;    Run, "C:\Program Files\GIMP 2\bin\gimp-2.10.exe"
;return


