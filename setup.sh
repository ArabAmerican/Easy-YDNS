echo "Attempting to install necessary components"
sudo chmod +x ydns.sh
sudo apt-get update
sudo apt-get --yes install curl
sudo apt-get --yes install dnsutils
echo Done.
