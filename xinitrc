#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Always good to get audio working...
start-pulseaudio-x11

# Have CAPS LOCK mapped to ESC (so useful in VIM... and even i3)
# xmodmap -e 'clear Lock' #ensures you're not stuck in CAPS on mode
# xmodmap -e 'keycode 0x42=Escape' #remaps the keyboard so CAPS LOCK=ESC
# setxkbmap -option caps:escape &

# Use right Alt as a compose key to be able to type French
setxkbmap -option compose:ralt &

xset r rate 200 25

# Redshift, our eyes friend
redshift -l 48.856614:2.352222 &

termite -e "vim -c \"autocmd CursorHold .notes.md :write\" .notes.md" --class=Scratchpad --title=Scratchpad &

# Let's get started with i3 !!!
exec i3
