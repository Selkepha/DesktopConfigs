#NoEnv  		; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  	; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance

; Replace Start Menu Shortcut
; LWin::
; Send, ^{F1} ; ---> Open Launchy Instead
; return


; Win + Q ---> Quit Window
LWin & Q::
Send, !{F4}
return
