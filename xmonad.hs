import XMonad
import XMonad.Config.Desktop

import XMonad.Prompt
import XMonad.Prompt.RunOrRaise (runOrRaisePrompt)
import XMonad.Prompt.AppendFile (appendFilePrompt)

import System.IO
import System.Exit
import XMonad.Operations

import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Actions.CycleWS

import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog

import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace (onWorkspace, onWorkspaces)
import XMonad.Layout.Reflect (reflectHoriz)
import XMonad.Layout.IM
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutHints
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Grid

import Data.Ratio ((%))

import qualified XMonad.StackSet as W
import qualified Data.Map as M

-- Define Terminal
cTerminal = "urxvt"

-- Define Border Width
cBorderWidth = 1

-- Define workspaces
cWorkspaces    = ["1:terminal","2:web","3:media","4:spotify","5:misc","6:background","7","8","9:banished"]

-- Directories
myIconsDir = "/home/sshehata/.icons"

-- Define commands
shBackground = "/bin/nitrogen --restore"
shCursor = "xsetroot -cursor_name left_ptr"

-- Define theme colors
colorOrange   = "#FD971F"
colorDarkGray = "#1B1D1E"
colorPink     = "#F92672"
colorGreen    = "#A6E22E"
colorBlue     = "#66D9EF"
colorElecBlue = "#3ECAE8"
colorYellow   = "#E6DB74"
colorWhite    = "#CCCCC6"
colorRed      = "#B22222"
colorBlack    = "#000000"

myFocusedBorderColor = colorRed
myDefaultTextColor = colorElecBlue
myNormalBorderColor = colorBlack

fontDefault = "xft:Source Code Pro ExtraLight:style=ExtraLight:size=10"

cManageHook = composeAll . concat $
  [ [isFullscreen --> (doF W.focusDown <+> doFullFloat)]
  , [title =? t --> doFloat | t <-  myTitleFloats ]
  , [className =? "mpv" --> doFullFloat]
  ]
  where
    myTitleFloats = ["File Operation Progress"]

cLogHook :: Handle -> X ()
cLogHook h = dynamicLogWithPP $ def
  {
    ppUrgent              =   dzenColor "#ff0000" "black"
    , ppWsSep             =   ""
    , ppLayout            =   dzenColor "dark gray" "black" .
    (\x -> case x of
     "Tall"               ->      "^i(" ++ myIconsDir ++ "/layout-tall.xbm)"
     "Mirror Tall"        ->      "^i(" ++ myIconsDir ++ "/layout-mirror-tall.xbm)"
     "Full"               ->      "^i(" ++ myIconsDir ++ "/layout-full.xbm)"
     "Simple Float"       ->      "~"
     _                    ->      x
    )
    , ppTitle             =   ("" ++) . dzenColor "dark gray" "black" . dzenEscape
    , ppOutput            =   hPutStrLn h
  }

cXmonadBar = "dzen2 -x '0' -y '0' -dock  -h '18' -w '1400' -ta 'l' "
cStatusBar = "conky | dzen2 -dock -x '1280' -h '18' -w '1480' -ta 'r' -y '0'"

main = do
   -- Startup
   spawnPipe shBackground
   spawnPipe shCursor
   dzenLeftBar          <- spawnPipe cXmonadBar
   dzenRightBar         <- spawnPipe cStatusBar

   -- Config
   xmonad $ desktopConfig {
     terminal           = cTerminal,
     borderWidth        = cBorderWidth,
     focusedBorderColor = myFocusedBorderColor,
     normalBorderColor  = myNormalBorderColor,
     manageHook         = manageDocks <+> cManageHook <+> manageHook def,
     layoutHook         = avoidStruts $ smartBorders $ layoutHook def,
     logHook            = cLogHook dzenLeftBar >> fadeInactiveLogHook 0xdddddddd,
     startupHook        = setWMName "LG3D"
     } `additionalKeysP`
     [ (("<XF86AudioLowerVolume>"), spawn "amixer -q set Master unmute && amixer -q set Master 1%-")
     , (("<XF86AudioRaiseVolume>"), spawn "amixer -q set Master unmute && amixer -q set Master 1%+")
     , (("<XF86AudioMute>"), spawn "amixer -q set Master toggle")     
     , (("<XF86MonBrightnessUp>"), spawn "/usr/local/bin/brightness-up.sh")
     , (("<XF86MonBrightnessDown>"), spawn "/usr/local/bin/brightness-down.sh")
     , (("M-<Down>"), nextWS)
     , (("M-<Up>"), prevWS)
     , (("M-<Right>"), moveTo Next emptyWS)
     , (("M-<Left>"), moveTo Prev (XMonad.Actions.CycleWS.Not emptyWS))
     , (("M-<Tab>"), toggleWS)
     , (("M-<Print>"), spawn "scrot ~/screen_%Y-%m-%d-%H-%M-%S.png")
     , (("M-s"), spawn "slock")
     ]
