import XMonad
import XMonad.Util.Paste
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run

main = do
   xmproc <- spawnPipe "/usr/bin/xmobar /home/sshihata/.xmobarrc"
   xmonad $ defaultConfig
	{ manageHook = manageDocks <+> manageHook defaultConfig
	, layoutHook = avoidStruts $ layoutHook defaultConfig
	, logHook = dynamicLogWithPP xmobarPP
				{ ppOutput = hPutStrLn xmproc
				, ppTitle = xmobarColor "green" "" . shorten 50
				}
	, terminal    = "urxvt"
	, borderWidth = 1
	, focusedBorderColor = "light blue"
	} `additionalKeysP`	
	[ (("<XF86AudioLowerVolume>"), spawn "amixer -q set Master unmute && amixer -q set Master 1%-")
	, (("<XF86AudioRaiseVolume>"), spawn "amixer -q set Master unmute && amixer -q set Master 1%+")
	, (("<XF86AudioMute>"), spawn "amixer -q set Master toggle")
	]
