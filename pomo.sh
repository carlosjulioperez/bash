# https://www.cyberciti.biz/faq/how-to-display-countdown-timer-in-bash-shell-script-running-on-linuxunix/

countdown()
(
  IFS=:
  set -- $*
  secs=$(( ${1#0} * 3600 + ${2#0} * 60 + ${3#0} ))
  while [ $secs -gt 0 ]
  do
    sleep 1 &
    printf "\r%02d:%02d:%02d" $((secs/3600)) $(( (secs/60)%60)) $((secs%60))
    secs=$(( $secs - 1 ))
    wait
  done
  echo
)

# sleep 1500 && notify-send "break"; sleep 300 && notify-send "back to work"
# sleep 1500 && notify-send "break"; sleep 300 && notify-send "back to work"
# sleep 1500 && notify-send "break"; sleep 300 && notify-send "back to work"
# sleep 1500 && notify-send "break"; sleep 900 && notify-send "back to work"

# Demo
#countdown "00:00:05" && zenity --warning --text="Descanso corto" && countdown "00:00:05" && zenity --warning --text="¡A trabajar!"

countdown "00:25:00" && zenity --warning --text="Descanso corto" && countdown "00:05:00" && zenity --warning --text="¡A trabajar!"
countdown "00:25:00" && zenity --warning --text="Descanso corto" && countdown "00:05:00" && zenity --warning --text="¡A trabajar!"
countdown "00:25:00" && zenity --warning --text="Descanso corto" && countdown "00:05:00" && zenity --warning --text="¡A trabajar!"
countdown "00:25:00" && zenity --warning --text="Descanso corto" && countdown "00:15:00" && zenity --warning --text="Pomodoro terminado"
