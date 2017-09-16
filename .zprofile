# Start the SSH agent if not running already
eval "$(keychain --agents gpg,ssh --noask --timeout 600 --eval aws_rythm terraform github_rythm etienne_ks5)"

# Environment
export GOPATH="/home/etienne/Code/Go"
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Let's get audio working
jack_control start
pulseaudio --start

# If logged in on tty1 (which can be done automatically with getty), then start
# X! (and therefore, all underlying systemd units)
if [[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]]; then
  exec startx
fi


