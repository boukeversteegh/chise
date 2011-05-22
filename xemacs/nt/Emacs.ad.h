(String) "Emacs.modeline*attributeForeground:	Black",
(String) "Emacs.modeline*attributeBackground:	Gray75",
(String) "Emacs.text-cursor*attributeBackground:	Red3",
(String) "*menubar*Foreground:			Gray30",
(String) "*menubar*Background:			Gray75",
(String) "*menubar*buttonForeground:		Blue",
(String) "*XlwMenu*selectColor:			ForestGreen",
(String) "*XmToggleButton*selectColor:		ForestGreen",
(String) "*popup*Foreground:			Black",
(String) "*popup*Background:			Gray75",
(String) "*dialog*Foreground:			Black",
(String) "*dialog*Background:			#A5C0C1",
(String) "*dialog*XmTextField*Background:		WhiteSmoke",
(String) "*dialog*XmText*Background:		WhiteSmoke",
(String) "*dialog*XmList*Background:		WhiteSmoke",
(String) "*dialog*Command*Background:		WhiteSmoke",
(String) "*XlwScrollBar*Foreground:		Gray30",
(String) "*XlwScrollBar*Background:		Gray75",
(String) "*XmScrollBar*Foreground:		Gray30",
(String) "*XmScrollBar*Background:		Gray75",
(String) "*topToolBarShadowColor:			Gray90",
(String) "*bottomToolBarShadowColor:		Gray40",
(String) "*backgroundToolBarColor:		Gray75",
(String) "*toolBarShadowThickness:		2",
(String) "*menubar*Font: 			-*-helvetica-bold-r-*-*-*-120-*-*-*-*-iso8859-*",
(String) "*popup*Font:			-*-helvetica-bold-r-*-*-*-120-*-*-*-*-iso8859-*",
(String) "*XmDialogShell*FontList:	-*-helvetica-bold-r-*-*-*-120-*-*-*-*-iso8859-*",
(String) "*XmTextField*FontList:		-*-courier-medium-r-*-*-*-120-*-*-*-*-iso8859-*",
(String) "*XmText*FontList:		-*-courier-medium-r-*-*-*-120-*-*-*-*-iso8859-*",
(String) "*XmList*FontList:		-*-courier-medium-r-*-*-*-120-*-*-*-*-iso8859-*",
(String) "*Dialog*Font:			-*-helvetica-bold-r-*-*-*-140-*-*-*-*-iso8859-*",
(String) "*dialog*button1.accelerators:#override\
<KeyPress>Return: ArmAndActivate()\\n\
<KeyPress>KP_Enter: ArmAndActivate()\\n\
Ctrl<KeyPress>m: ArmAndActivate()\\n",
(String) "*XmTextField*translations: #override\\n\
	!<Key>osfBackSpace:	delete-previous-character()\\n\
	!<Key>osfDelete:	delete-previous-character()\\n\
	!Ctrl<Key>h: 		delete-previous-character()\\n\
	!Ctrl<Key>d: 		delete-next-character()\\n\
	!Meta<Key>osfDelete:	delete-previous-word()\\n\
	!Meta<Key>osfBackSpace:	delete-previous-word()\\n\
	!Meta<Key>d:		delete-next-word()\\n\
	!Ctrl<Key>k:		delete-to-end-of-line()\\n\
	!Ctrl<Key>g:		process-cancel()\\n\
	!Ctrl<Key>b:		backward-character()\\n\
	!<Key>osfLeft:		backward-character()\\n\
	!Ctrl<Key>f:		forward-character()\\n\
	!<Key>osfRight:		forward-character()\\n\
	!Meta<Key>b:		backward-word()\\n\
	!Meta<Key>osfLeft:	backward-word()\\n\
	!Meta<Key>f:		forward-word()\\n\
	!Meta<Key>osfRight:	forward-word()\\n\
	!Ctrl<Key>e:		end-of-line()\\n\
	!Ctrl<Key>a:		beginning-of-line()\\n\
	!Ctrl<Key>w:		cut-clipboard()\\n\
	!Meta<Key>w:		copy-clipboard()\\n\
	<Btn2Up>:		copy-primary()\\n",
(String) "*dialog*XmPushButton*translations:#override\\n\
    <Btn1Down>:         Arm()\\n\
    <Btn1Down>,<Btn1Up>: Activate()\
			Disarm()\\n\
    <Btn1Down>(2+):     MultiArm()\\n\
    <Btn1Up>(2+):       MultiActivate()\\n\
    <Btn1Up>:           Activate()\
		        Disarm()\\n\
    <Key>osfSelect:  	ArmAndActivate()\\n\
    <Key>osfActivate:   ArmAndActivate()\\n\
    <Key>osfHelp:	Help()\\n\
    ~Shift ~Meta ~Alt <Key>Return:	ArmAndActivate()\\n\
    <EnterWindow>:      Enter()\\n\
    <LeaveWindow>:      Leave()\\n",
(String) "*ximStyles: XIMPreeditPosition|XIMStatusArea\
            XIMPreeditPosition|XIMStatusNothing\
            XIMPreeditPosition|XIMStatusNone\
            XIMPreeditNothing|XIMStatusArea\
            XIMPreeditNothing|XIMStatusNothing\
            XIMPreeditNothing|XIMStatusNone\
            XIMPreeditNone|XIMStatusArea\
            XIMPreeditNone|XIMStatusNothing\
            XIMPreeditNone|XIMStatusNone",
(String) "*EmacsFrame.ximForeground: black",
(String) "*EmacsFrame.ximBackground: white",
