echo "Attempting to install necessary components"
sudo chmod +x ydns.sh
sudo apt-get update --allow-releaseinfo-change #This prevents issues with Raspbian
sudo apt-get --yes install curl
sudo apt-get --yes install dnsutils
echo "Done."
