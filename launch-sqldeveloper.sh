#!/bin/bash
#JAVA_HOME=/usr/lib/jvm/java-8-oracle
JAVA_HOME=/opt/java-jdk/jdk1.8.0_161
SQLD_HOME=/usr/share/sqldeveloper

# Launch Oracle's startup script asynchronously
env JAVA_HOME=$JAVA_HOME $SQLD_HOME/sqldeveloper.sh $* &

i="0"
while [ $i -lt 20 ]
do

# Try to get SQL Developer window ID
WIN_ID=$(xwininfo -root -tree \
| grep -i 'oracle sql developer' \
| grep -oP '(0x[a-f0-9]+)')

# If it is non-empty (window already exists)
if [ -n "$WIN_ID" ]
then
    echo "WIN_ID=$WIN_ID"

# Set WM_CLASS property of main window to same value
# that is used for the launcher window
    xprop -id $WIN_ID \
          -f WM_CLASS 8s \
          -set WM_CLASS "oracle-ide-osgi-boot-OracleIdeLauncher"

# and exit loop
    break
else

# Otherwise sleep for one second and increment loop counter
    echo "Sleeping: $i"
    sleep 1s
    i=$[$i+1]

fi
done
echo "Done"

