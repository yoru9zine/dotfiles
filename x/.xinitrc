xset r rate 200 200
xrdb ~/.Xresources
vmware-user-suid-wrapper

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
twmnd&
#compton -b --conf ~/.compton.conf & # compton make rendering slow...
hsetroot -solid black
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

#exec ratpoison
export GDK_SCALE=2
xrandr --dpi 220
fcitx&
xmodmap ~/.xmodmap
exec i3
#exec awesome
