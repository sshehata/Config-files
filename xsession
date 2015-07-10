xrdb ~/.Xresources                                        # load Xresources file 
xset r rate 250 30
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'&       # switch caps to escape 
feh --bg-scale ~/.bg/anon2.jpg                            # apply background 
xautolock -time 15 -locker slock &
udiskie --tray &                                          # run udiske for automount
exec xmonad                                               # run xmonad
