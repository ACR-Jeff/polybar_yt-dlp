#!/bin/bash

#################################################################
###	  Displays YT-DLP download progress in Polybar	      ###
###        https://gitlab.com/ACR-Jeff/polybar_yt-dlp         ###
###			  By: ACR-Jeff			      ###
#################################################################

### Terminal Process, Replace 'kitty' with your Terminal ###
proc="kitty"

# pgrep search for process
if pgrep -x "$proc" >/dev/null
then

# xdotool search for process classname
wnd_focus=$(xdotool search --classname $proc)

wnd_title=$(xprop -id $wnd_focus WM_NAME) 2>/dev/null
lookfor='"(.*)"'                                                                                                            

# Looksfor title
if [[ "$wnd_title" =~ $lookfor ]]; then                                                                                     
  wnd_title=${BASH_REMATCH[1]}  
  # if title contains yt-dlp then continue
  if [[ $wnd_title =~ "yt-dlp" ]]; then
  string1="${wnd_title/yt-dlp/" DOWNLOAD: "}"
  replaced1=$string1
  strings2="${replaced1/of/" | ""SIZE:"}"
  replaced2=$strings2
  strings3="${replaced2/'at'*'/s'/" | "}"
  replaced3=$strings3
  strings4="${replaced3/'(frag'/" | ""FRAGS:  "}"
  replaced4=$strings4
  strings5="${replaced4/')'/}"
  replaced5=$strings5
  strings6="${replaced5/'~'/}"
  replaced6=$strings6 
  replaced7=$replaced6
  
  # echo output to polybar
  echo "${replaced7/ETA/""ETA:  ""}"
  
fi                                                                                                         
fi
2>/dev/null
else
echo ""
fi
2>/dev/null
