#1/bin/bash
echo "All variables passed to the script $@"
echo "Number of varibles passed $#"
echo "script name $0"
echo "Current working directory $pwd"
echo "directory of current user $HOME"
echo "pid of script executing now $$"
sleep 100 &
echo "pid of last background command $!"
