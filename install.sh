echo 
echo "Starting Installation ..."
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir /Library/.netkiller
cd $DIR
cd Dsniff
mv arpspoof /usr/local/bin/
mv dsniff /usr/local/bin/
mv filesnarf /usr/local/bin/
mv macof /usr/local/bin/
mv mailsnarf /usr/local/bin/
mv msgsnarf /usr/local/bin/
mv dnsspoof /usr/local/bin/
alias arpspoof="/usr/local/bin/arpspoof"
alias dsniff="/usr/local/bin/dsniff"
alias filesnarf="/usr/local/bin/filesnarf"
alias macof="/usr/local/bin/macof"
alias mailsnarf="/usr/local/bin/mailsnarf"
alias msgsnarf="/usr/local/bin/msgsnarf"
alias dnsspoof="/usr/local/bin/dnsspoof"
echo
echo '\033[0mInstallation done '
echo '\033[0;34m"sudo netkiller" to start'
echo 
