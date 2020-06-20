#!/bin/bash
# note - X11/keysymdef.h

profile-cleaner f

notify-send Plasma-xcape "Script starting"

setxkbmap -option "terminate:ctrl_alt_bksp"
#setxkbmap -layout gb -option ctrl:swapcaps # Caps Lock is Control on a GB keyboard


notify-send Plasma-xcape "Killing evdoublebind & xcape instances prior to relaunch"
killall xcape &>/dev/null
#killall evdoublebind &>/dev/null

echo "peanuts"

setxkbmap -option caps:none
setxkbmap -option "shift:both_capslock"
setxkbmap -option ctrl:nocaps

### Clear stale locks.
rm -f ~/emacs.d/.emacs.desktop.lock

xmodmap ~/.Xmodmap &
sleep 5

xcape -e "Hyper_L=space" &
#xcape -e 'Shift_L=Escape|BackSpace'&
#xcape -e "Shift_L=Control_L|1"&
#xcape -e 'Alt_L=Super_L|w'
#xcape -e "Control_L=Super_L|t"&

~/scripts/evdbsh &

killall running.bin

# while ! ping -c 1 -W 1 8.8.8.8; do
#     echo "Waiting for 1.2.3.4 - network interface might be down..."
#     sleep 1
# done

#up=$(pgrep -c ^wg-crypt-azirev)
#echo $up
#if [ $up == "0" ]
#then
    #wg-quick up azirevpn-uk1
#fi

#running.bin &> /dev/null &

#qk start &

#megasync&

#Count running xcape processes:
notify-send "Running xcape processes: " `pgrep -c xcape`

#autocutsel -fork &
#autocutsel -selection PRIMARY -fork &

#sudo vmtouch -d -l /usr/bin/emacs-27.0.50 &
#emacs --daemon&

#killall plasmashell
#sleep 2
#plasmashell&

### Launch evdoublebind:
#evdoublebind /dev/input/event4 &

#qk start &

sxhkd -c /home/steve/.config/sxhkd/plasma-sxkhdrc&

notify-send "The end!"

exit 0
