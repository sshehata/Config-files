import XMonad

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
import XMonad.Hooks.ICCCMFocus

import Data.Ratio ((%))

import qualified XMonad.StackSet as W
import qualified Data.Map as M

cTerminal = "urxvt"
cBorderWidth = 1
cFocusedBorderColor = "dark gray"
cNormalBorderColor = "black"
cWorkspaces    = ["1","2","3","4","5","6","7","8","9"]
cBitmapsDir = "/home/sshehata/.xmonad/icons"
cManageHook = composeAll . concat $
  [ [isFullscreen --> (doF W.focusDown <+> doFullFloat)]
  , [title =? t --> doFloat | t <-  myTitleFloats ]
  ]
  where
    myTitleFloats = ["File Operation Progress"]

cLogHook :: Handle -> X ()
cLogHook h = dynamicLogWithPP $ defaultPP
  {
    ppUrgent            =   dzenColor "#ff0000" "black"
    , ppWsSep             =   ""
    , ppLayout            =   dzenColor "#ff0000" "black" .
    (\x -> case x of
     "Tall"             ->      "^i(" ++ cBitmapsDir ++ "/tall.xpm)"
     "Mirror Tall"      ->      "^i(" ++ cBitmapsDir ++ "/mtall.xpm)"
     "Full"                      ->      "^i(" ++ cBitmapsDir ++ "/full.xpm)"
     "Simple Float"              ->      "~"
     _                           ->      x
    )
    , ppTitle             =   ("" ++) . dzenColor "green" "black" . dzenEscape
    , ppOutput            =   hPutStrLn h
  }

cXmonadBar = "dzen2 -x '0' -y '0'  -h '18' -w '640' -ta 'l' "
cStatusBar = "conky | dzen2 -x '640' -h '18' -w '1040' -ta 'r' -y '0'"

main = do
   dzenLeftBar <- spawnPipe cXmonadBar
   dzenRightBar <- spawnPipe cStatusBar
   xmonad $ defaultConfig {
     terminal = cTerminal,
     borderWidth = cBorderWidth,
     focusedBorderColor = cFocusedBorderColor,
     normalBorderColor = cNormalBorderColor,
     manageHook = cManageHook <+> manageDocks <+> manageHook defaultConfig,
     layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig,
     startupHook = setWMName "LG3D",
     logHook = takeTopFocus
       --cLogHook dzenLeftBar >> fadeInactiveLogHook 0xdddddddd
     } `additionalKeysP`
     [ (("<XF86AudioLowerVolume>"), spawn "amixer -q set Master unmute && amixer -q set Master 1%-")
     , (("<XF86AudioRaiseVolume>"), spawn "amixer -q set Master unmute && amixer -q set Master 1%+")
     , (("<XF86AudioMute>"), spawn "amixer -q set Master toggle")     
     , (("M-<Down>"), nextWS)
     , (("M-<Up>"), prevWS)
     , (("M-<Right>"), moveTo Next EmptyWS)
     , (("M-<Left>"), moveTo Prev NonEmptyWS)
     , (("M-<Tab>"), toggleWS)
     , (("M-<Print>"), spawn "scrot ~/screen_%Y-%m-%d-%H-%M-%S.png -d 1")
     ]
