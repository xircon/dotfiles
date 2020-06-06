#!/bin/bash

numlockx on&

#kill latte-dock
#latte-dock&


f_kill () {

   ka=("nextcloud" "dclock" "stalonetray" "lxqt-panel" "deadd-notification-center" "lxqt-notificationd" "indicator-kdeconnect")
   for i in "${ka[@]}"
    do
   	    killall $i&
        echo "Killed $i"
    done
}

f_startups () {
    
    # Start-up programs:
    sp=("albert" "xscreensaver" "lxqt-notificationd" "indicator-kdeconnect" "picom" "syncclip" "variety" "nm-applet" \
	                       "autokey-gtk" "pnmixer" "indicator-kdeconnect" "lxpolkit" "greenclip daemon")

    for i in "${sp[@]}"
    do
	    firstword=${i%% *}
	    running=$(pgrep -c $firstword)
        echo $i "|" $firstword >> ~/tttt
	    if [ "$running" == "0" ]; then
            echo "Launching $i"
    	    $i&
	    fi   
    done
    libinput-gestures-setup restart&

    echo "End of Loop"
}

f_fxprofile () {
    #Firefox profile cleaner:
    running=$(pgrep -c firefox)
    echo "profile cleaner"
    if [ "$running" == "0" ]; then
        profile-cleaner f &
    fi
}

f_setxkb () {
    setxkbmap -option "terminate:ctrl_alt_bksp"
    setxkbmap -option "caps:none"
    setxkbmap -option "shift:both_capslock"
    setxkbmap -layout gb -option ctrl:nocaps
}

f_myxcape () {
    killall xcape&
    xmodmap ~/.Xmodmap&

    sleep 1

    pkill -USR1 -x sxhkd &

    xcape -e "Hyper_L=space" &
    xcape -e 'Alt_L=Alt_L|f' &
    xcape -e 'Control_L=Super_L|1' &
    xcape -e 'Shift_L=Super_L|f' &
    xcape -e 'Shift_R=Super_L|m' &
    xcape -e 'Super_L=Super_L|d' &
 
}

f_emacs () {
    running=$(pgrep -c emacs)
    if [ "$running" == "0" ]; then
        bspc desktop --focus ^2
        emacs --daemon&
        sleep 3
        bspc desktop --focus ^1
    else
        bspc desktop --focus ^2
    fi
}


# case expression in
#     pattern1 )
#         statements ;;
#     pattern2 )
#         statements ;;
#     ...
# esac

f_kill

f_startups

f_setxkb

f_myxcape

f_fxprofile

f_emacs

#nohup /home/steve/.config/bspwm/desknamer.sh &
#stalonetray&
lxqt-panel&
skippy-xd-runner --start-daemon&
nextcloud &
killall running.bin || true && wg-quick up azirevpn-uk1 || true && running.bin &> /dev/null&
notify-send "MyBspwm end."

