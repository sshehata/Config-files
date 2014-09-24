xrdb ~/.Xresources                                        # load Xresources file 
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'&       # switch caps to escape 
feh --bg-scale ~/.bg/wolverine-arch.jpg                   # apply background 
udiskie --tray &                                          # run udiske for automount
exec xmonad                                               # run xmonad
