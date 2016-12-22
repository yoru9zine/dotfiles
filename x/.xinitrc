xset r rate 200 100
xrdb ~/.Xresources
vmware-user-suid-wrapper

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx&
twmnd&
#compton -b --conf ~/.compton.conf & # compton make rendering slow...
hsetroot -solid black

#exec ratpoison
export GDK_SCALE=2
xrandr --dpi 220
exec i3
