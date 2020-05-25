#!/bin/bash
#test
# declare variables and get parameters
RED='\033[0;31m' # Red color
NC='\033[0m' # No Color
DATE=$(date +"%d-%m-%Y-%H-%M-%S")
FILE=html

CALIBRE=
CEPH=
CLOUDINIT=
KERNEL=
KUBERNETES=
MANPAGES=
MODULE=
OPENSTACK=
SYSTEMD=
UBUNTU=

CALIBRESEARCH=
CEPHSEARCH=
CLOUDINITSEARCH=
KERNELSEARCH=
KUBERNETESSEARCH=
MANPAGESSEARCH=
MODULESEARCH=
OPENSTACKSEARCH=
SYSTEMDSEARCH=
UBUNTUSEARCH=

CASE=-i
FINDCASE=i

CALIBREPATH=$HOME/Documents/calibre
CEPHPATH=$HOME/Documents/tongue/docs.ceph.com/docs/master
CLOUDINITPATH=$HOME/Documents/tongue/cloudinit.readthedocs.io/en/latest/topics
KERNELPATH=$HOME/Documents/tongue/www.kernel.org/doc/html/latest
KUBERNETESPATH=$HOME/Documents/tongue/kubernetes.io/docs
MANPAGESPATH=$HOME/Documents/tongue/man7.org/linux/man-pages
MODULEPATH=$HOME/Documents/tongue/cateee.net/lkddb/web-lkddb
OPENSTACKPATH=$HOME/Documents/tongue/docs.openstack.org
SYSTEMDPATH=$HOME/Documents/tongue/www.freedesktop.org/software/systemd/man
UBUNTUPATH1=$HOME/Documents/tongue/assets.ubuntu.com/v1
UBUNTUPATH2=$HOME/Documents/tongue/help.ubuntu.com
LOGPATH=/var/log/tongue

while [ "$1" != "" ]; do
    case $1 in

      -a | --calibre )        shift
                              CALIBRESEARCH=yes ; FILE=pdf ; CALIBRE=$1
                              shift
                              ;;
      -c | --ceph )           shift
                              CEPHSEARCH=yes ; FILE=html ; CEPH=$1
                              shift
                              ;;
      -e | --openstack )      shift
                              OPENSTACKSEARCH=yes ; FILE=html ; OPENSTACK=$1
                              shift
                              ;;
      -g | --man-pages )      shift
                              MANPAGESSEARCH=yes ; FILE=html ; MANPAGES=$1
                              shift
                              ;;
      -k | --kubernetes )     shift
                              KUBERNETESSEARCH=yes ; FILE=html ; KUBERNETES=$1
                              shift
                              ;;
      -n | --kernel )         shift
                              KERNELSEARCH=yes ; FILE=html ; KERNEL=$1
                              shift
                              ;;
      -o | --module )         shift
                              MODULESEARCH=yes ; FILE=html ; MODULE=$1
                              shift
                              ;;
      -t | --cloud-init )     shift
                              CLOUDINITSEARCH=yes ; FILE=html ; CLOUDINIT=$1
                              shift
                              ;;
      -u | --ubuntu )         shift
                              UBUNTUSEARCH=yes ; FILE=pdf ; UBUNTU=$1
                              shift
                              ;;
      -y | --systemd )        shift
                              SYSTEMDSEARCH=yes ; FILE=html ; SYSTEMD=$1
                              shift
                              ;;
      -s | --search )         shift
                              SEARCH=$1
                              shift
                              ;;
      -i | --case-sensitive ) shift
                              CASE= ; FINDCASE=
                              ;;
      -p | --pdf )            shift
                              FILE=pdf
                              ;;
      -I | --image )          shift
                              FILE=image
                              ;;
      -l | --list )           shift
                              LIST=yes
                              ;;
      -h | --help )           shift
                              HELP=yes
                              FILE=
                              ;;
      * )                     shift
                              HELP=yes
      ;;
    esac
done

if [ ! -d "$LOGPATH" ]; then echo "Seems like you are running tongue for the first time. At this stage, we need sudo permissions to create the directory $LOGPATH, where the search results will be stored. Please provide the password bellow if prompted:" ; sudo mkdir $LOGPATH; sudo chown $USER $LOGPATH; exit 1; fi
if [ "$FILE" = "image" ] && [[ "$CEPHSEARCH"||"$OPENSTACKSEARCH"||"$SYSTEMDSEARCH"||"$KUBERNETESSEARCH"||"$CLOUDINITSEARCH" = "" ]]; then echo "Image search runs only with -c, -e, -k, -t or -y parameters"; fi

## CALIBRE SEARCH START ##
if [ "$FILE" = "pdf" ] && [ "$CALIBRESEARCH" = "yes" ]; then
    if [ -z "$CALIBRE" ] && [ -z "$SEARCH" ]; then echo "CALIBRE field (-a) and search field (-s) are empty. Possible values for (-a) field are:"; ls -d $CALIBREPATH/*/* | sed -e "s|$CALIBREPATH||g" | less -F -X -R 2>/dev/null; exit 1; fi
    if [ -z "$CALIBRE" ] && [ ! -z "$SEARCH" ]; then echo "CALIBRE field (-a) is empty. Possible values are:"; ls -d $CALIBREPATH/*/* | sed -e "s|$CALIBREPATH||g" | less -F -X -R 2>/dev/null; exit 1; fi
    if [ ! -z "$CALIBRE" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
# save url list
    echo "Searching for '"$SEARCH"' on local Calibre PDF library folder '"$CALIBRE"'. Please wait"
    pdfgrep -rc $CASE "$SEARCH" $CALIBREPATH/$CALIBRE 2>/dev/null |grep -v '\:0' |sed -e 's/pdf\:/pdf \:/g' > $LOGPATH/tongue-urls-match
    pdfgrep -rc $CASE "$SEARCH" $CALIBREPATH/$CALIBRE 2>/dev/null |sed -e 's/pdf\:/pdf \:/g' > $LOGPATH/tongue-search-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls-match |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    printf "${RED}----------------- [CALIBRE PDF SEARCH RESULTS] -----------------${NC}\n" > $LOGPATH/tongue-results-$DATE
    pdfgrep -rn --color=always $CASE "$SEARCH" $CALIBREPATH/$CALIBRE 2>/dev/null |sed -e "s|$CALIBREPATH|file\:\/\/$CALIBREPATH|g" -e "s| (|\%20(|g" -e "s| - |\%20-\%20|g" -e "s,\.pdf\x1B\[m\x1B\[K\x1B\[36m\x1B\[K\:,\.pdf\x1B\[m\x1B\[K\x1B\[36m\x1B\[K\#page\=,g" -e "s,\x1B\[m\x1B\[K\x1B\[36m\x1B\[K\:,\x1B\[m\x1B\[K\x1B\[36m\x1B\[K \:,g" >> $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -F -X -I $(ls -t $LOGPATH/tongue-results*| head -1)
# show report
    echo " "
    printf "${RED}----------------- [CALIBRE PDF PAGES SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} PDF(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls-match >> $LOGPATH/tongue-reports
    sed -e "s|$CALIBREPATH|file\:\/\/$CALIBREPATH|g" -e "s| (|\%20(|g" -e "s| - |\%20-\%20|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n >> $(ls -t $LOGPATH/tongue-results*| head -1)
    sed -e "s|$CALIBREPATH|file\:\/\/$CALIBREPATH|g" -e "s| (|\%20(|g" -e "s| - |\%20-\%20|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n |less -F -X -R
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
## CALIBRE SEARCH END ##

## CEPH SEARCH START ##
if [ "$FILE" = "html" ] && [ "$CEPHSEARCH" = "yes" ]; then
    if [ -z "$CEPH" ] && [ -z "$SEARCH" ]; then echo "CEPH field (-c) and search field (-s) are empty. Possible values for (-c) field are:"; ls $CEPHPATH 2>/dev/null; exit 1; fi
    if [ -z "$CEPH" ] && [ ! -z "$SEARCH" ]; then echo "CEPH field (-c) is empty. Possible values are:"; ls $CEPHPATH 2>/dev/null; exit 1; fi
    if [ ! -z "$CEPH" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
# save url list
    echo "Searching for '"$SEARCH"' on CEPH pages for '"$CEPH"'. Please wait"
    grep -E -rc $CASE --include \*.$FILE "$SEARCH" $CEPHPATH/$CEPH 2> /dev/null |grep -v '\:0' |sed 's/html\:/html \:/g' |sort -V > $LOGPATH/tongue-urls-match
    grep -E -rl $CASE --include \*.$FILE "$SEARCH" $CEPHPATH/$CEPH 2> /dev/null > $LOGPATH/tongue-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls-match |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    printf "${RED}----------------- [CEPH PAGES SEARCH RESULTS] -----------------${NC}\n" > $LOGPATH/tongue-results-$DATE
    grep -E --color=always -r $CASE --include \*.$FILE "$SEARCH" $CEPHPATH/$CEPH 2> /dev/null |sed -e "s/<[^>]*>//g" -e "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" -e "s|\.html|.html |g" -e "s:%25:%:g" -e "s:%20: :g" -e "s:%3C:<:g" -e "s:%3E:>:g" -e "s:%23:#:g" -e "s:%7B:{:g" -e "s:%7D:}:g" -e "s:%40:@:g" -e "s:%7C:|:g" -e "s:%7E:~:g" -e "s:%5B:\[:g" -e "s:%5D:\]:g" -e "s:%3B:\;:g" -e "s:%2F:/:g" -e "s:%3F:?:g" -e "s^%3A^:^g" -e "s:%3D:=:g" -e "s:%26:&:g" -e "s:%24:\$:g" -e "s:%21:\!:g" -e "s:%2A:\*:g" -e "s:%22:\":g" -e "s:\&quot;:\":g" -e "s:\&#246;:ö:g" -e "s:\&\#252\;:ü:g" -e "s:\&\#196\;:Ä:g" -e "s:\&amp;:\&:g" -e "s:\&gt\;:>:g" -e "s:\&lt\;:<:g" -e "s:\&\#160\;: :g" -e "s:\&\#39\;:\':g" -e "s:\&\#34\;:\":g" -e "s:\&lsquo\;:\‘:g" -e "s:\&rsquo\;:\’:g" >> $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -F -X -I $(ls -t $LOGPATH/tongue-results*| head -1)
# show report
    echo " "
    printf "${RED}----------------- [CEPH PAGES SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} page(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls-match >> $LOGPATH/tongue-reports
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n >> $(ls -t $LOGPATH/tongue-results*| head -1)
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n |less -F -X -R
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
# image search
if [ "$FILE" = "image" ] && [ "$CEPHSEARCH" = "yes" ]; then
  if [ -z "$CEPH" ] && [ -z "$SEARCH" ]; then echo "CEPH field (-c) and search field (-s) are empty. Possible values for (-c) field are:"; ls $CEPHPATH 2>/dev/null; exit 1; fi
  if [ -z "$CEPH" ] && [ ! -z "$SEARCH" ]; then echo "CEPH field (-c) is empty. Possible values are:"; ls $CEPHPATH 2>/dev/null; exit 1; fi
  if [ ! -z "$CEPH" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
#if [ "$CEPH" = "*" ]; then [ "$CEPH" = "" ]; fi
# save url list
    find $CEPHPATH/$CEPH -type f \( -"$FINDCASE"name \*"$CEPH"\*.svg -o -"$FINDCASE"name \*"$CEPH"\*.png -o -"$FINDCASE"name \*"$CEPH"\*.jpg -o -"$FINDCASE"name \*"$CEPH"\*.jpeg \) > $LOGPATH/tongue-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    find $CEPHPATH/$CEPH -type f \( -"$FINDCASE"name \*"$CEPH"\*.svg -o -"$FINDCASE"name \*"$CEPH"\*.png -o -"$FINDCASE"name \*"$CEPH"\*.jpg -o -"$FINDCASE"name \*"$CEPH"\*.jpeg \) |sed -e "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" -e "s|\.html|.html |g" > $LOGPATH/tongue-results-$DATE
# show report
    echo " "
    printf "${RED}----------------- [CEPH IMAGE SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} page(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls >> $LOGPATH/tongue-reports
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports > $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -X -F $(ls -t $LOGPATH/tongue-results*| head -1)
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
## CEPH SEARCH END ##

## CLOUD-INIT SEARCH START ##
if [ "$FILE" = "html" ] && [ "$CLOUDINITSEARCH" = "yes" ]; then
    if [ -z "$CLOUDINIT" ] && [ -z "$SEARCH" ]; then echo "CLOUD-INIT field (-t) and search field (-s) are empty. Possible values for (-t) field are:"; ls -a $CLOUDINITPATH 2>/dev/null; exit 1; fi
    if [ -z "$CLOUDINIT" ] && [ ! -z "$SEARCH" ]; then echo "CLOUD-INIT field (-t) is empty. Possible values are:"; ls $CLOUDINITPATH 2>/dev/null; exit 1; fi
    if [ ! -z "$CLOUDINIT" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
# save url list
    echo "Searching for '"$SEARCH"' on CLOUDINIT for '"$CLOUDINIT"'. Please wait"
    grep -E -rc $CASE --include \*.$FILE "$SEARCH" $CLOUDINITPATH/$CLOUDINIT 2> /dev/null |grep -v '\:0' |sed 's/html\:/html \:/g' |sort -V > $LOGPATH/tongue-urls-match
    grep -E -rl $CASE --include \*.$FILE "$SEARCH" $CLOUDINITPATH/$CLOUDINIT 2> /dev/null > $LOGPATH/tongue-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls-match |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    printf "${RED}----------------- [CLOUD-INIT SEARCH RESULTS] -----------------${NC}\n" > $LOGPATH/tongue-results-$DATE
    grep -E --color=always -r $CASE --include \*.$FILE "$SEARCH" $CLOUDINITPATH/$CLOUDINIT 2> /dev/null |sed -e "s/<[^>]*>//g" -e "s|$HOME\/Documents\/tongue\/|http\:\/\/|g" -e "s|\.html|.html |g" -e "s:%25:%:g" -e "s:%20: :g" -e "s:%3C:<:g" -e "s:%3E:>:g" -e "s:%23:#:g" -e "s:%7B:{:g" -e "s:%7D:}:g" -e "s:%40:@:g" -e "s:%7C:|:g" -e "s:%7E:~:g" -e "s:%5B:\[:g" -e "s:%5D:\]:g" -e "s:%3B:\;:g" -e "s:%2F:/:g" -e "s:%3F:?:g" -e "s^%3A^:^g" -e "s:%3D:=:g" -e "s:%26:&:g" -e "s:%24:\$:g" -e "s:%21:\!:g" -e "s:%2A:\*:g" -e "s:%22:\":g" -e "s:\&quot;:\":g" -e "s:\&#246;:ö:g" -e "s:\&\#252\;:ü:g" -e "s:\&\#196\;:Ä:g" -e "s:\&amp;:\&:g" -e "s:\&gt\;:>:g" -e "s:\&lt\;:<:g" -e "s:\&\#160\;: :g" -e "s:\&\#39\;:\':g" -e "s:\&\#34\;:\":g" -e "s:\&lsquo\;:\‘:g" -e "s:\&rsquo\;:\’:g" >> $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -F -X -I $(ls -t $LOGPATH/tongue-results*| head -1)
# show report
    echo " "
    printf "${RED}----------------- [CLOUD-INIT SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} page(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls-match >> $LOGPATH/tongue-reports
    sed "s|$HOME\/Documents\/tongue\/|http\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n >> $(ls -t $LOGPATH/tongue-results*| head -1)
    sed "s|$HOME\/Documents\/tongue\/|http\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n |less -F -X -R
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
# image search
if [ "$FILE" = "image" ] && [ "$CLOUDINITSEARCH" = "yes" ]; then
  if [ -z "$CLOUDINIT" ] && [ -z "$SEARCH" ]; then echo "CLOUDINIT field (-t) and search field (-s) are empty. Possible values for (-t) field are:"; ls $CLOUDINITPATH 2>/dev/null; exit 1; fi
  if [ -z "$CLOUDINIT" ] && [ ! -z "$SEARCH" ]; then echo "CLOUDINIT field (-t) is empty. Possible values are:"; ls $CLOUDINITPATH 2>/dev/null; exit 1; fi
  if [ ! -z "$CLOUDINIT" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
#if [ "$CLOUDINIT" = "*" ]; then [ "$CLOUDINIT" = "" ]; fi
# save url list
    find $CLOUDINITPATH/$CLOUDINIT -type f \( -"$FINDCASE"name \*"$CLOUDINIT"\*.svg -o -"$FINDCASE"name \*"$CLOUDINIT"\*.png -o -"$FINDCASE"name \*"$CLOUDINIT"\*.jpg -o -"$FINDCASE"name \*"$CLOUDINIT"\*.jpeg \) > $LOGPATH/tongue-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    find $CLOUDINITPATH/$CLOUDINIT -type f \( -"$FINDCASE"name \*"$CLOUDINIT"\*.svg -o -"$FINDCASE"name \*"$CLOUDINIT"\*.png -o -"$FINDCASE"name \*"$CLOUDINIT"\*.jpg -o -"$FINDCASE"name \*"$CLOUDINIT"\*.jpeg \) |sed -e "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" -e "s|\.html|.html |g" > $LOGPATH/tongue-results-$DATE
# show report
    echo " "
    printf "${RED}----------------- [CLOUDINIT IMAGE SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} page(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls >> $LOGPATH/tongue-reports
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports > $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -X -F $(ls -t $LOGPATH/tongue-results*| head -1)
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
## CLOUD-INIT SEARCH END ##

## KERNEL SEARCH START ##
if [ "$FILE" = "html" ] && [ "$KERNELSEARCH" = "yes" ]; then
    if [ -z "$KERNEL" ] && [ -z "$SEARCH" ]; then echo "KERNEL field (-n) and search field (-s) are empty. Possible values for (-n) field are:"; ls $KERNELPATH 2>/dev/null; exit 1; fi
    if [ -z "$KERNEL" ] && [ ! -z "$SEARCH" ]; then echo "KERNEL field (-n) is empty. Possible values are:"; ls $KERNELPATH 2>/dev/null; exit 1; fi
    if [ ! -z "$KERNEL" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
# save url list
    echo "Searching for '"$SEARCH"' on KERNEL pages for '"$KERNEL"'. Please wait"
    grep -E -rc $CASE --include \*.$FILE "$SEARCH" $KERNELPATH/$KERNEL 2> /dev/null |grep -v '\:0' |sed 's/html\:/html \:/g' |sort -V > $LOGPATH/tongue-urls-match
    grep -E -rl $CASE --include \*.$FILE "$SEARCH" $KERNELPATH/$KERNEL 2> /dev/null > $LOGPATH/tongue-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls-match |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    printf "${RED}----------------- [KERNEL PAGES SEARCH RESULTS] -----------------${NC}\n" > $LOGPATH/tongue-results-$DATE
    grep -E --color=always -r $CASE --include \*.$FILE "$SEARCH" $KERNELPATH/$KERNEL 2> /dev/null |sed -e "s/<[^>]*>//g" -e "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" -e "s|\.html|.html |g" -e "s:%25:%:g" -e "s:%20: :g" -e "s:%3C:<:g" -e "s:%3E:>:g" -e "s:%23:#:g" -e "s:%7B:{:g" -e "s:%7D:}:g" -e "s:%40:@:g" -e "s:%7C:|:g" -e "s:%7E:~:g" -e "s:%5B:\[:g" -e "s:%5D:\]:g" -e "s:%3B:\;:g" -e "s:%2F:/:g" -e "s:%3F:?:g" -e "s^%3A^:^g" -e "s:%3D:=:g" -e "s:%26:&:g" -e "s:%24:\$:g" -e "s:%21:\!:g" -e "s:%2A:\*:g" -e "s:%22:\":g" -e "s:\&quot;:\":g" -e "s:\&#246;:ö:g" -e "s:\&\#252\;:ü:g" -e "s:\&\#196\;:Ä:g" -e "s:\&amp;:\&:g" -e "s:\&gt\;:>:g" -e "s:\&lt\;:<:g" -e "s:\&\#160\;: :g" -e "s:\&\#39\;:\':g" -e "s:\&\#34\;:\":g" -e "s:\&lsquo\;:\‘:g" -e "s:\&rsquo\;:\’:g" >> $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -F -X -I $(ls -t $LOGPATH/tongue-results*| head -1)
# show report
    echo " "
    printf "${RED}----------------- [KERNEL PAGES SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} page(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls-match >> $LOGPATH/tongue-reports
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n >> $(ls -t $LOGPATH/tongue-results*| head -1)
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n |less -F -X -R
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
## KERNEL SEARCH END ##

## KUBERNETES SEARCH START ##
if [ "$FILE" = "html" ] && [ "$KUBERNETESSEARCH" = "yes" ]; then
    if [ -z "$KUBERNETES" ] && [ -z "$SEARCH" ]; then echo "KUBERNETES field (-k) and search field (-s) are empty. Possible values for (-k) field are:"; ls $KUBERNETESPATH/*/ | sed -e "s|$HOME\/Documents\/kubernetes\.io\/docs\/||g" 2>/dev/null; exit 1; fi
    if [ -z "$KUBERNETES" ] && [ ! -z "$SEARCH" ]; then echo "KUBERNETES field (-k) is empty. Possible values are:"; ls $KUBERNETESPATH/*/ | sed -e "s|$HOME\/Documents\/kubernetes\.io\/docs\/||g" 2>/dev/null; exit 1; fi
    if [ ! -z "$KUBERNETES" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
# save url list
    echo "Searching for '"$SEARCH"' on KUBERNETES pages for '"$KUBERNETES"'. Please wait"
    grep -E -rc $CASE --include \*.$FILE "$SEARCH" $KUBERNETESPATH/$KUBERNETES 2> /dev/null |grep -v '\:0' |sed 's/html\:/html \:/g' |sort -V > $LOGPATH/tongue-urls-match
    grep -E -rl $CASE --include \*.$FILE "$SEARCH" $KUBERNETESPATH/$KUBERNETES 2> /dev/null > $LOGPATH/tongue-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls-match |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    printf "${RED}----------------- [KUBERNETES PAGES SEARCH RESULTS] -----------------${NC}\n" > $LOGPATH/tongue-results-$DATE
    grep -E --color=always -r $CASE --include \*.$FILE "$SEARCH" $KUBERNETESPATH/$KUBERNETES 2> /dev/null |sed -e "s/<[^>]*>//g" -e "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" -e "s|\.html|.html |g" -e "s:%25:%:g" -e "s:%20: :g" -e "s:%3C:<:g" -e "s:%3E:>:g" -e "s:%23:#:g" -e "s:%7B:{:g" -e "s:%7D:}:g" -e "s:%40:@:g" -e "s:%7C:|:g" -e "s:%7E:~:g" -e "s:%5B:\[:g" -e "s:%5D:\]:g" -e "s:%3B:\;:g" -e "s:%2F:/:g" -e "s:%3F:?:g" -e "s^%3A^:^g" -e "s:%3D:=:g" -e "s:%26:&:g" -e "s:%24:\$:g" -e "s:%21:\!:g" -e "s:%2A:\*:g" -e "s:%22:\":g" -e "s:\&quot;:\":g" -e "s:\&#246;:ö:g" -e "s:\&\#252\;:ü:g" -e "s:\&\#196\;:Ä:g" -e "s:\&amp;:\&:g" -e "s:\&gt\;:>:g" -e "s:\&lt\;:<:g" -e "s:\&\#160\;: :g" -e "s:\&\#39\;:\':g" -e "s:\&\#34\;:\":g" -e "s:\&lsquo\;:\‘:g" -e "s:\&rsquo\;:\’:g" >> $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -F -X -I $(ls -t $LOGPATH/tongue-results*| head -1)
# show report
    echo " "
    printf "${RED}----------------- [KUBERNETES PAGES SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} page(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls-match >> $LOGPATH/tongue-reports
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n >> $(ls -t $LOGPATH/tongue-results*| head -1)
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n |less -F -X -R
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
# image search
if [ "$FILE" = "image" ] && [ "$KUBERNETESSEARCH" = "yes" ]; then
  if [ -z "$KUBERNETES" ] && [ -z "$SEARCH" ]; then echo "KUBERNETES field (-k) and search field (-s) are empty. Possible values for (-k) field are:"; ls $KUBERNETESPATH 2>/dev/null; exit 1; fi
  if [ -z "$KUBERNETES" ] && [ ! -z "$SEARCH" ]; then echo "KUBERNETES field (-k) is empty. Possible values are:"; ls $KUBERNETESPATH 2>/dev/null; exit 1; fi
  if [ ! -z "$KUBERNETES" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
#if [ "$KUBERNETES" = "*" ]; then [ "$KUBERNETES" = "" ]; fi
# save url list
    find $KUBERNETESPATH/$KUBERNETES -type f \( -"$FINDCASE"name \*"$KUBERNETES"\*.svg -o -"$FINDCASE"name \*"$KUBERNETES"\*.png -o -"$FINDCASE"name \*"$KUBERNETES"\*.jpg -o -"$FINDCASE"name \*"$KUBERNETES"\*.jpeg \) > $LOGPATH/tongue-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    find $KUBERNETESPATH/$KUBERNETES -type f \( -"$FINDCASE"name \*"$KUBERNETES"\*.svg -o -"$FINDCASE"name \*"$KUBERNETES"\*.png -o -"$FINDCASE"name \*"$KUBERNETES"\*.jpg -o -"$FINDCASE"name \*"$KUBERNETES"\*.jpeg \) |sed -e "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" -e "s|\.html|.html |g" > $LOGPATH/tongue-results-$DATE
# show report
    echo " "
    printf "${RED}----------------- [KUBERNETES IMAGE SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} page(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls >> $LOGPATH/tongue-reports
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports > $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -X -F $(ls -t $LOGPATH/tongue-results*| head -1)
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
## KUBERNETES SEARCH END ##

## MAN PAGES SEARCH START ##
if [ "$FILE" = "html" ] && [ "$MANPAGESSEARCH" = "yes" ]; then
    if [ -z "$MANPAGES" ] && [ -z "$SEARCH" ]; then echo "MANPAGE field (-g) and search field (-s) are empty. Possible values for (-g) field are:"; ls -a $MANPAGESPATH |grep man 2>/dev/null; exit 1; fi
    if [ -z "$MANPAGES" ] && [ ! -z "$SEARCH" ]; then echo "MANPAGE field (-g) is empty. Possible values are:"; ls $MANPAGESPATH 2>/dev/null; exit 1; fi
    if [ ! -z "$MANPAGES" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
# save url list
    echo "Searching for '"$SEARCH"' on MANPAGES for '"$MANPAGES"'. Please wait"
    grep -E -rc $CASE --include \*.$FILE "$SEARCH" $MANPAGESPATH/$MANPAGES 2> /dev/null |grep -v '\:0' |sed 's/html\:/html \:/g' |sort -V > $LOGPATH/tongue-urls-match
    grep -E -rl $CASE --include \*.$FILE "$SEARCH" $MANPAGESPATH/$MANPAGES 2> /dev/null > $LOGPATH/tongue-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls-match |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    printf "${RED}----------------- [LINUX MAN PAGES SEARCH RESULTS] -----------------${NC}\n" > $LOGPATH/tongue-results-$DATE
    grep -E --color=always -r $CASE --include \*.$FILE "$SEARCH" $MANPAGESPATH/$MANPAGES 2> /dev/null |sed -e "s/<[^>]*>//g" -e "s|$HOME\/Documents\/tongue\/|http\:\/\/|g" -e "s|\.html|.html |g" -e "s:%25:%:g" -e "s:%20: :g" -e "s:%3C:<:g" -e "s:%3E:>:g" -e "s:%23:#:g" -e "s:%7B:{:g" -e "s:%7D:}:g" -e "s:%40:@:g" -e "s:%7C:|:g" -e "s:%7E:~:g" -e "s:%5B:\[:g" -e "s:%5D:\]:g" -e "s:%3B:\;:g" -e "s:%2F:/:g" -e "s:%3F:?:g" -e "s^%3A^:^g" -e "s:%3D:=:g" -e "s:%26:&:g" -e "s:%24:\$:g" -e "s:%21:\!:g" -e "s:%2A:\*:g" -e "s:%22:\":g" -e "s:\&quot;:\":g" -e "s:\&#246;:ö:g" -e "s:\&\#252\;:ü:g" -e "s:\&\#196\;:Ä:g" -e "s:\&amp;:\&:g" -e "s:\&gt\;:>:g" -e "s:\&lt\;:<:g" -e "s:\&\#160\;: :g" -e "s:\&\#39\;:\':g" -e "s:\&\#34\;:\":g" -e "s:\&lsquo\;:\‘:g" -e "s:\&rsquo\;:\’:g" >> $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -F -X -I $(ls -t $LOGPATH/tongue-results*| head -1)
# show report
    echo " "
    printf "${RED}----------------- [LINUX MAN PAGES SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} page(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls-match >> $LOGPATH/tongue-reports
    sed "s|$HOME\/Documents\/tongue\/|http\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n >> $(ls -t $LOGPATH/tongue-results*| head -1)
    sed "s|$HOME\/Documents\/tongue\/|http\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n |less -F -X -R
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
## MAN PAGES SEARCH END ##

## KERNEL MODULE SEARCH START ##
if [ "$FILE" = "html" ] && [ "$MODULESEARCH" = "yes" ]; then
    if [ -z "$MODULE" ] && [ -z "$SEARCH" ]; then echo "MODULE field (-o) and search field (-s) are empty. Possible values for (-n) field are:"; ls $MODULEPATH 2>/dev/null; exit 1; fi
    if [ -z "$MODULE" ] && [ ! -z "$SEARCH" ]; then echo "MODULE field (-o) is empty. Possible values are:"; ls $MODULEPATH 2>/dev/null; exit 1; fi
    if [ ! -z "$MODULE" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
# save url list
    echo "Searching for '"$SEARCH"' on MODULE pages for '"$MODULE"'. Please wait"
    grep -E -rc $CASE --include \*.$FILE "$SEARCH" $MODULEPATH/$MODULE 2> /dev/null |grep -v '\:0' |sed 's/html\:/html \:/g' |sort -V > $LOGPATH/tongue-urls-match
    grep -E -rl $CASE --include \*.$FILE "$SEARCH" $MODULEPATH/$MODULE 2> /dev/null > $LOGPATH/tongue-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls-match |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    printf "${RED}----------------- [MODULE DATABASE SEARCH RESULTS] -----------------${NC}\n" > $LOGPATH/tongue-results-$DATE
    grep -E --color=always -r $CASE --include \*.$FILE "$SEARCH" $MODULEPATH/$MODULE 2> /dev/null |sed -e "s/<[^>]*>//g" -e "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" -e "s|\.html|.html |g" -e "s:%25:%:g" -e "s:%20: :g" -e "s:%3C:<:g" -e "s:%3E:>:g" -e "s:%23:#:g" -e "s:%7B:{:g" -e "s:%7D:}:g" -e "s:%40:@:g" -e "s:%7C:|:g" -e "s:%7E:~:g" -e "s:%5B:\[:g" -e "s:%5D:\]:g" -e "s:%3B:\;:g" -e "s:%2F:/:g" -e "s:%3F:?:g" -e "s^%3A^:^g" -e "s:%3D:=:g" -e "s:%26:&:g" -e "s:%24:\$:g" -e "s:%21:\!:g" -e "s:%2A:\*:g" -e "s:%22:\":g" -e "s:\&quot;:\":g" -e "s:\&#246;:ö:g" -e "s:\&\#252\;:ü:g" -e "s:\&\#196\;:Ä:g" -e "s:\&amp;:\&:g" -e "s:\&gt\;:>:g" -e "s:\&lt\;:<:g" -e "s:\&\#160\;: :g" -e "s:\&\#39\;:\':g" -e "s:\&\#34\;:\":g" -e "s:\&lsquo\;:\‘:g" -e "s:\&rsquo\;:\’:g" >> $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -F -X -I $(ls -t $LOGPATH/tongue-results*| head -1)
# show report
    echo " "
    printf "${RED}----------------- [MODULE DATABASE SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} page(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls-match >> $LOGPATH/tongue-reports
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n >> $(ls -t $LOGPATH/tongue-results*| head -1)
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n |less -F -X -R
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
## KERNEL MODULE SEARCH END ##

## OPENSTACK SEARCH START ##
if [ "$FILE" = "html" ] && [ "$OPENSTACKSEARCH" = "yes" ]; then
    if [ -z "$OPENSTACK" ] && [ -z "$SEARCH" ]; then echo "OPENSTACK field (-e) and search field (-s) are empty. Possible values for (-e) field are:"; ls -d $OPENSTACKPATH/*/* | sed -e "s|$OPENSTACKPATH\/||g" | less -F -X -R 2>/dev/null; exit 1; fi
    if [ -z "$OPENSTACK" ] && [ ! -z "$SEARCH" ]; then echo "OPENSTACK field (-e) is empty. Possible values are:"; ls $OPENSTACKPATH 2>/dev/null; exit 1; fi
    if [ ! -z "$OPENSTACK" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
# save url list
    echo "Searching for '"$SEARCH"' on OPENSTACK for '"$OPENSTACK"'. Please wait"
    grep -E -rc $CASE --include \*.$FILE "$SEARCH" $OPENSTACKPATH/$OPENSTACK 2> /dev/null |grep -v '\:0' |sed 's/html\:/html \:/g' |sort -V > $LOGPATH/tongue-urls-match
    grep -E -rl $CASE --include \*.$FILE "$SEARCH" $OPENSTACKPATH/$OPENSTACK 2> /dev/null > $LOGPATH/tongue-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls-match |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    printf "${RED}----------------- [OPENSTACK SEARCH RESULTS] -----------------${NC}\n" > $LOGPATH/tongue-results-$DATE
    grep -E --color=always -r $CASE --include \*.$FILE "$SEARCH" $OPENSTACKPATH/$OPENSTACK 2> /dev/null |sed -e "s/<[^>]*>//g" -e "s|$HOME\/Documents\/tongue\/|http\:\/\/|g" -e "s|\.html|.html |g" -e "s:%25:%:g" -e "s:%20: :g" -e "s:%3C:<:g" -e "s:%3E:>:g" -e "s:%23:#:g" -e "s:%7B:{:g" -e "s:%7D:}:g" -e "s:%40:@:g" -e "s:%7C:|:g" -e "s:%7E:~:g" -e "s:%5B:\[:g" -e "s:%5D:\]:g" -e "s:%3B:\;:g" -e "s:%2F:/:g" -e "s:%3F:?:g" -e "s^%3A^:^g" -e "s:%3D:=:g" -e "s:%26:&:g" -e "s:%24:\$:g" -e "s:%21:\!:g" -e "s:%2A:\*:g" -e "s:%22:\":g" -e "s:\&quot;:\":g" -e "s:\&#246;:ö:g" -e "s:\&\#252\;:ü:g" -e "s:\&\#196\;:Ä:g" -e "s:\&amp;:\&:g" -e "s:\&gt\;:>:g" -e "s:\&lt\;:<:g" -e "s:\&\#160\;: :g" -e "s:\&\#39\;:\':g" -e "s:\&\#34\;:\":g" -e "s:\&lsquo\;:\‘:g" -e "s:\&rsquo\;:\’:g" >>  $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -F -X -I $(ls -t $LOGPATH/tongue-results*| head -1)
# show report
    echo " "
    printf "${RED}----------------- [OPENSTACK SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} page(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls-match >> $LOGPATH/tongue-reports
    sed "s|$HOME\/Documents\/tongue\/|http\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n >> $(ls -t $LOGPATH/tongue-results*| head -1)
    sed "s|$HOME\/Documents\/tongue\/|http\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n |less -F -X -R
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
# image search
if [ "$FILE" = "image" ] && [ "$OPENSTACKSEARCH" = "yes" ]; then
  if [ -z "$OPENSTACK" ] && [ -z "$SEARCH" ]; then echo "OPENSTACK field (-e) and search field (-s) are empty. Possible values for (-e) field are:"; ls $OPENSTACKPATH 2>/dev/null; exit 1; fi
  if [ -z "$OPENSTACK" ] && [ ! -z "$SEARCH" ]; then echo "OPENSTACK field (-e) is empty. Possible values are:"; ls $OPENSTACKPATH 2>/dev/null; exit 1; fi
  if [ ! -z "$OPENSTACK" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
#if [ "$OPENSTACK" = "*" ]; then [ "$OPENSTACK" = "" ]; fi
# save url list
    find $OPENSTACKPATH/$OPENSTACK -type f \( -"$FINDCASE"name \*"$OPENSTACK"\*.svg -o -"$FINDCASE"name \*"$OPENSTACK"\*.png -o -"$FINDCASE"name \*"$OPENSTACK"\*.jpg -o -"$FINDCASE"name \*"$OPENSTACK"\*.jpeg \) > $LOGPATH/tongue-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    find $OPENSTACKPATH/$OPENSTACK -type f \( -"$FINDCASE"name \*"$OPENSTACK"\*.svg -o -"$FINDCASE"name \*"$OPENSTACK"\*.png -o -"$FINDCASE"name \*"$OPENSTACK"\*.jpg -o -"$FINDCASE"name \*"$OPENSTACK"\*.jpeg \) |sed -e "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" -e "s|\.html|.html |g" > $LOGPATH/tongue-results-$DATE
# show report
    echo " "
    printf "${RED}----------------- [OPENSTACK IMAGE SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} page(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls >> $LOGPATH/tongue-reports
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports > $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -X -F $(ls -t $LOGPATH/tongue-results*| head -1)
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
## OPENSTACK SEARCH END ##

## SYSTEMD SEARCH START ##
if [ "$FILE" = "html" ] && [ "$SYSTEMDSEARCH" = "yes" ]; then
    if [ -z "$SYSTEMD" ] && [ -z "$SEARCH" ]; then echo "SYSTEMD field (-y) and search field (-s) are empty. Possible values for (-n) field are:"; ls $SYSTEMDPATH 2>/dev/null; exit 1; fi
    if [ -z "$SYSTEMD" ] && [ ! -z "$SEARCH" ]; then echo "SYSTEMD field (-y) is empty. Possible values are:"; ls $SYSTEMDPATH 2>/dev/null; exit 1; fi
    if [ ! -z "$SYSTEMD" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
# save url list
    echo "Searching for '"$SEARCH"' on SYSTEMD pages for '"$SYSTEMD"'. Please wait"
    grep -E -rc $CASE --include \*.$FILE "$SEARCH" $SYSTEMDPATH/$SYSTEMD 2> /dev/null |grep -v '\:0' |sed 's/html\:/html \:/g' |sort -V > $LOGPATH/tongue-urls-match
    grep -E -rl $CASE --include \*.$FILE "$SEARCH" $SYSTEMDPATH/$SYSTEMD 2> /dev/null > $LOGPATH/tongue-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls-match |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    printf "${RED}----------------- [SYSTEMD SEARCH RESULTS] -----------------${NC}\n" > $LOGPATH/tongue-results-$DATE
    grep -E --color=always -r $CASE --include \*.$FILE "$SEARCH" $SYSTEMDPATH/$SYSTEMD 2> /dev/null |sed -e "s/<[^>]*>//g" -e "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" -e "s|\.html|.html |g" -e "s:%25:%:g" -e "s:%20: :g" -e "s:%3C:<:g" -e "s:%3E:>:g" -e "s:%23:#:g" -e "s:%7B:{:g" -e "s:%7D:}:g" -e "s:%40:@:g" -e "s:%7C:|:g" -e "s:%7E:~:g" -e "s:%5B:\[:g" -e "s:%5D:\]:g" -e "s:%3B:\;:g" -e "s:%2F:/:g" -e "s:%3F:?:g" -e "s^%3A^:^g" -e "s:%3D:=:g" -e "s:%26:&:g" -e "s:%24:\$:g" -e "s:%21:\!:g" -e "s:%2A:\*:g" -e "s:%22:\":g" -e "s:\&quot;:\":g" -e "s:\&#246;:ö:g" -e "s:\&\#252\;:ü:g" -e "s:\&\#196\;:Ä:g" -e "s:\&amp;:\&:g" -e "s:\&gt\;:>:g" -e "s:\&lt\;:<:g" -e "s:\&\#160\;: :g" -e "s:\&\#39\;:\':g" -e "s:\&\#34\;:\":g" -e "s:\&lsquo\;:\‘:g" -e "s:\&rsquo\;:\’:g" >> $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -F -X -I $(ls -t $LOGPATH/tongue-results*| head -1)
# show report
    echo " "
    printf "${RED}----------------- [SYSTEMD SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} page(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls-match >> $LOGPATH/tongue-reports
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n >> $(ls -t $LOGPATH/tongue-results*| head -1)
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n |less -F -X -R
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
# image search
if [ "$FILE" = "image" ] && [ "$SYSTEMDSEARCH" = "yes" ]; then
  if [ -z "$SYSTEMD" ] && [ -z "$SEARCH" ]; then echo "SYSTEMD field (-y) and search field (-s) are empty. Possible values for (-y) field are:"; ls $SYSTEMDPATH 2>/dev/null; exit 1; fi
  if [ -z "$SYSTEMD" ] && [ ! -z "$SEARCH" ]; then echo "SYSTEMD field (-y) is empty. Possible values are:"; ls $SYSTEMDPATH 2>/dev/null; exit 1; fi
  if [ ! -z "$SYSTEMD" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
#if [ "$SYSTEMD" = "*" ]; then [ "$SYSTEMD" = "" ]; fi
# save url list
    find $SYSTEMDPATH/$SYSTEMD -type f \( -"$FINDCASE"name \*"$SYSTEMD"\*.svg -o -"$FINDCASE"name \*"$SYSTEMD"\*.png -o -"$FINDCASE"name \*"$SYSTEMD"\*.jpg -o -"$FINDCASE"name \*"$SYSTEMD"\*.jpeg \) > $LOGPATH/tongue-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    find $SYSTEMDPATH/$SYSTEMD -type f \( -"$FINDCASE"name \*"$SYSTEMD"\*.svg -o -"$FINDCASE"name \*"$SYSTEMD"\*.png -o -"$FINDCASE"name \*"$SYSTEMD"\*.jpg -o -"$FINDCASE"name \*"$SYSTEMD"\*.jpeg \) |sed -e "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" -e "s|\.html|.html |g" > $LOGPATH/tongue-results-$DATE
# show report
    echo " "
    printf "${RED}----------------- [SYSTEMD IMAGE SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} page(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls >> $LOGPATH/tongue-reports
    sed "s|$HOME\/Documents\/tongue\/|https\:\/\/|g" $LOGPATH/tongue-reports > $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -X -F $(ls -t $LOGPATH/tongue-results*| head -1)
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
## SYSTEMD SEARCH END ##

## UBUNTU SEARCH START ##
if [ "$FILE" = "pdf" ] && [ "$UBUNTUSEARCH" = "yes" ]; then
    if [ -z "$UBUNTU" ] && [ -z "$SEARCH" ]; then echo "UBUNTU field (-u) and search field (-s) are empty. Possible values for (-u) field are:"; ls $UBUNTUPATH1 |sed -e "s|UBUNTUPATH1||g"; ls $UBUNTUPATH2 |sed -e "s|UBUNTUPATH2||g"; exit 1; fi
    if [ -z "$UBUNTU" ] && [ ! -z "$SEARCH" ]; then echo "UBUNTU field (-u) is empty. Possible values are:"; ls $UBUNTUPATH1 |sed -e "s|UBUNTUPATH1||g"; ls $UBUNTUPATH2 |sed -e "s|UBUNTUPATH2||g"; exit 1; fi
    if [ ! -z "$UBUNTU" ] && [ -z "$SEARCH" ]; then echo "Search field is empty. Add -s <search> to start searching."; exit 1; fi
# save url list
    echo "Searching for '"$SEARCH"' on UBUNTU for '"$UBUNTU"'. Please wait"
    pdfgrep -rc $CASE "$SEARCH" $UBUNTUPATH1/$UBUNTU $UBUNTUPATH2/$UBUNTU 2>/dev/null |grep -v '\:0' |sed -e 's/pdf\:/pdf \:/g' > $LOGPATH/tongue-urls-match
    pdfgrep -rc $CASE "$SEARCH" $UBUNTUPATH1/$UBUNTU $UBUNTUPATH2/$UBUNTU 2>/dev/null |sed -e 's/pdf\:/pdf \:/g' > $LOGPATH/tongue-search-urls
    URLNUMBER=$(cat $LOGPATH/tongue-urls-match |wc -l)
    if [ "$URLNUMBER" = "0" ]; then echo "Search not found. Make sure the fields are correctly filled. Run 'tongue -h' for help."; exit 1; fi
# perform search and pipe it to less
    printf "${RED}----------------- [UBUNTU PDF SEARCH RESULTS] -----------------${NC}\n" > $LOGPATH/tongue-results-$DATE
    pdfgrep -rn --color=always $CASE "$SEARCH" $UBUNTUPATH1/$UBUNTU $UBUNTUPATH2/$UBUNTU 2>/dev/null |sed -e "s|$UBUNTUPATH1|file\:\/\/$UBUNTUPATH1|g" -e "s|$UBUNTUPATH2|file\:\/\/$UBUNTUPATH2|g" -e "s| (|\%20(|g" -e "s| - |\%20-\%20|g" -e "s,\.pdf\x1B\[m\x1B\[K\x1B\[36m\x1B\[K\:,\.pdf\x1B\[m\x1B\[K\x1B\[36m\x1B\[K\#page\=,g" -e "s,\x1B\[m\x1B\[K\x1B\[36m\x1B\[K\:,\x1B\[m\x1B\[K\x1B\[36m\x1B\[K \:,g" >> $(ls -t $LOGPATH/tongue-results*| head -1)
    less -R -F -X -I $(ls -t $LOGPATH/tongue-results*| head -1)
# show report
    echo " "
    printf "${RED}----------------- [UBUNTU PDF PAGES SEARCH REPORT] -----------------${NC}\n" > $LOGPATH/tongue-reports
    printf "The term '${RED}$SEARCH${NC}' was found on ${RED}$URLNUMBER${NC} PDF(s):\n" >> $LOGPATH/tongue-reports
    cat $LOGPATH/tongue-urls-match >> $LOGPATH/tongue-reports
    sed -e "s|$UBUNTUPATH1|file\:\/\/$UBUNTUPATH1|g" -e "s|$UBUNTUPATH2|file\:\/\/$UBUNTUPATH2|g" -e "s| (|\%20(|g" -e "s| - |\%20-\%20|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n >> $(ls -t $LOGPATH/tongue-results*| head -1)
    sed -e "s|$UBUNTUPATH1|file\:\/\/$UBUNTUPATH1|g" -e "s|$UBUNTUPATH2|file\:\/\/$UBUNTUPATH2|g" -e "s| (|\%20(|g" -e "s| - |\%20-\%20|g" $LOGPATH/tongue-reports |sort -n -t ':' -k3n,3n |less -F -X -R
    echo " "
    echo "The search results were saved to $(ls -t $LOGPATH/tongue-results*| head -1)";
    echo " "
fi
## UBUNTU SEARCH END ##

## HELP START ##
if [ "$HELP" = "yes" ] && [ "$FILE" = "" ]; then
    echo "Examples:"
    echo "List documentations or ask for help: tongue -h or -l"
    echo "Image search: tongue -t CLOUD-INIT -s SEARCH -I (options: -i for case-insensitive search)"
    echo "Ubuntu Documentation search: tongue -u DOCUMENTATION -s SEARCH_STRING (options: -i for case-sensitive search)"
    echo "Kubernetes documentation: tongue -k RELEASENOTE -s SEARCH_STRING (options: -i for case-sensitive search)"
    echo " "
    echo "Option list:"
    echo "-a, --calibre = Search on Calibre library"
    echo "-c, --ceph = Search on Ceph official documentation"
    echo "-e, --openstack = Search on openstack official documentation"
    echo "-g, --man-pages = Search on linux man pages"
    echo "-h, --help = Display a list of options to chose from"
    echo "-i, --case-sensitive = Searches are case sensitive."
    echo "-I, --image = Search for png files only. If you use this option, you need to specify -c, -e, -k, -t or -y"
    echo "-k, --kubernetes = Search on kubernetes official documentation"
    echo "-l, --list = Display a list of documentations that you can select"
    echo "-n, --kernel = Search on kernel official documentation"
    echo "-o, --module = Search on kernel module database"
    echo "-s, --search = Search string. If you are searching for more then one word, put all into quotes ''"
    echo "-t, --cloud-init = Search on cloud-init documentation"
    echo "-u, --ubuntu = Search on ubuntu official documentation"
    echo "-y, --systemd = Search on systemd official documentation"

    echo "Practical examples:"
    echo "Search only on multiple e-books/authors: tongue -c '*Sebastian*' -s 'system wide trusted certificate'"
    echo "Search only on ubuntu 16.x documentation pages: tongue -u '*16*' -s 'system wide trusted certificate'"
    echo "Search on all openstack documentation: tongue -e '*' -s 'nova'"
    echo "Search for 'ocfs2' or 'nfs' on systemd documentation: tongue -y '*' -s ocfs2\|nfs"
fi
## HELP END ##

## LIST START ##
if [ "$LIST" = "yes" ]; then
    printf "${RED}Here is a list of calibre library files that you can select with the option "-a" (calibre search):${NC}\n"
    echo " "
    ls -d $CALIBREPATH/*/* | sed -e "s|$HOME\/Calibre\/||g" 2>/dev/null
    echo " "
    printf "${RED}Here is a list on CEPH that you can search with the option "-c" (ceph search):${NC}\n"
    echo " "
    ls $CEPHPATH 2>/dev/null
    echo " "
    printf "${RED}Here is a list on CLOUDINIT that you can search with the option "-t" (cloud-init search):${NC}\n"
    echo " "
    ls $CLOUDINITPATH/*/ | sed -e "s|$HOME\/Documents\/tongue\/cloudinit.readthedocs.io\/en\/latest\/topics||g" 2>/dev/null
    echo " "
    printf "${RED}Here is a list on KERNEL documentation that you can search with the option "-n" (kernel search):${NC}\n"
    echo " "
    ls $KERNELPATH/*/ | sed -e "s|$HOME\/Documents\/tongue\/www\.kernel\.org\/doc\/html\/latest\/||g" 2>/dev/null
    echo " "
    printf "${RED}Here is a list on KUBERNETES documentation that you can search with the option "-k" (kubernetes search):${NC}\n"
    echo " "
    ls $KUBERNETESPATH/*/ | sed -e "s|$HOME\/Documents\/tongue\/kubernetes\.io\/docs\/||g" 2>/dev/null
    echo " "
    printf "${RED}Here is a list on MANPAGES that you can search with the option "-g" (man-pages search):${NC}\n"
    echo " "
    ls $MANPAGESPATH/*/ | sed -e "s|$HOME\/Documents\/tongue\/man7.org\/linux\/man-pages||g" 2>/dev/null
    echo " "
    printf "${RED}Here is a list on MODULES that you can search with the option "-o" (module database search):${NC}\n"
    echo " "
    ls $MODULEPATH 2>/dev/null
    echo " "
    printf "${RED}Here is a list on OPENSTACK documentation that you can search with the option "-e" (openstack search):${NC}\n"
    echo " "
    ls -d $OPENSTACKPATH/*/* | sed -e "s|$OPENSTACKPATH\/||g" 2>/dev/null
    echo " "
    printf "${RED}Here is a list on SYSTEMD documentation that you can search with the option "-y" (systemd search):${NC}\n"
    echo " "
    ls $SYSTEMDPATH 2>/dev/null
    echo " "
    printf "${RED}Here is a list on UBUNTU documentation that you can search with the option "-u" (ubuntu search):${NC}\n"
    echo " "
    ls $UBUNTUPATH1 2>/dev/null
    ls $UBUNTUPATH2 2>/dev/null
    echo " "
    printf "${RED}NOTE: You can also use "*" character as a wildcard (example: "sles*")${NC}\n"
fi
## LIST END ##
