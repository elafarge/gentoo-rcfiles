#!/bin/sh

WS_TERMINAL="1 "
WS_BROWSER="2 "
WS_EDITOR="3 "
WS_CHAT="4 "
WS_BACKGROUND="5 "
WS_MUSIC="6 "
WS_TRELLO="7 "

# Let's setup our workspaces, one by one
i3-msg "workspace $WS_TERMINAL"
i3-msg "append_layout ~/.rcfiles/i3-workspaces/tabbed-terminals.json"
i3-msg "move workspace to output HDMI1"

i3-msg "workspace $WS_BROWSER"
i3-msg "append_layout ~/.rcfiles/i3-workspaces/browser.json"
i3-msg "move workspace to output HDMI1"

i3-msg "workspace $WS_EDITOR"
i3-msg "append_layout ~/.rcfiles/i3-workspaces/editor.json"
i3-msg "move workspace to output HDMI1"

i3-msg "workspace $WS_CHAT"
i3-msg "append_layout ~/.rcfiles/i3-workspaces/chat.json"
i3-msg "move workspace to output VGA1"

i3-msg "workspace $WS_BACKGROUND"
i3-msg "append_layout ~/.rcfiles/i3-workspaces/background.json"
i3-msg "move workspace to output eDP1"

i3-msg "workspace $BROWSER"

# Let's populate these layouts !!!
exec i3-sensible-terminal &
exec i3-sensible-terminal &
exec i3-sensible-terminal &
exec i3-sensible-terminal &
exec i3-sensible-terminal &
exec i3-sensible-terminal &
exec i3-sensible-terminal &
exec i3-sensible-terminal &
exec firefox-developer-bin &
exec slack &
