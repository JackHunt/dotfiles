import XMonad
import XMonad.Layout.ThreeColumns
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

threeColLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ def
  {
    modMask = mod4Mask,  -- Rebind Mod to the Super key
    layoutHook = threeColLayout  -- Use custom layouts
  }
  `additionalKeysP`
  [
    ("M-d", spawn "rofi -show drun")
  ]
