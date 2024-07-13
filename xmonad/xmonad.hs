import XMonad

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout
import XMonad.ManageHook
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig

main :: IO ()
main = xmonad $ docks $ ewmhFullscreen $ ewmh $ def
	{ modMask = mod4Mask
	, normalBorderColor = "#cc99ff"
	, focusedBorderColor = "#9933ff"
	, layoutHook = myLayoutHook
	, startupHook = myStartupHook
	, manageHook = myManageHook
	, terminal = "alacritty"
	}
	`additionalKeysP`
	[ ("M-d", spawn "rofi -show drun")
	, ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+")
	, ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%-")
	, ("<XF86AudioMute>", spawn "amixer set Master toggle")
	, ("M-S-t", spawn "google-chrome-stable --profile-directory=\"Profile 1\" --restore-last-session")
	]
	`removeKeysP`
	[ "M-p"
	, "M-S-p"
	]

myLayoutHook =  avoidStruts (tiled ||| Mirror tiled ||| Full)
	where
		tiled = Tall nmaster delta ratio
		nmaster = 1
		ratio = 1/2
		delta = 3/100

myManageHook = composeAll
	[ className =? "google-chrome"		--> doShift "1"
	, className =? "Google-chrome"		--> doShift "1"
	, className =? "slack"			--> doShift "2"
	, className =? "Slack"			--> doShift "2"
	, className =? "discord"		--> doShift "3"
	, manageSpawn
	]

myStartupHook :: X()
myStartupHook = do
	spawnOnce "/home/bmagee/bin/start.sh"
	spawn "/home/bmagee/bin/reload.sh"
