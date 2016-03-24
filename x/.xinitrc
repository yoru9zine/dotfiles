xset r rate 200 80
xrdb ~/.Xresources
vmware-user-suid-wrapper

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx&
exec ratpoison
