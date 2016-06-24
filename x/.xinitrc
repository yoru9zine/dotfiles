xset r rate 200 100
xrdb ~/.Xresources
vmware-user-suid-wrapper

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx&
twmnd&
compton -b --conf ~/.compton.conf &

exec ratpoison
