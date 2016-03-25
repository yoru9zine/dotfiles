xset r rate 200 80
xrdb ~/.Xresources
vmware-user-suid-wrapper

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx&

exec ratpoison
