# This is a bash shell script for running on a Raspberry Pi with a newly
# installed Raspbian OS. It prepares the device for use as a web server by
# deleting a lot of unused software, updating the OS, and installing Docker.

# Purge unneeded software
sudo apt-get --purge -y remove libreoffice libreoffice-avmedia-backend-gstreamer \
libreoffice-base libreoffice-base-core libreoffice-base-drivers libreoffice-calc \
libreoffice-common libreoffice-core libreoffice-draw libreoffice-gtk \
libreoffice-impress libreoffice-java-common libreoffice-math \
libreoffice-report-builder-bin libreoffice-sdbc-hsqldb libreoffice-style-galaxy \
libreoffice-writer bluej wolfram-engine scratch geany geany-common greenfoot \
sonic-pi minecraft-pi chromium-browser
sudo apt-get -y autoremove

# Install Node.js v10
sudo apt remove --purge -y nodejs
sudo apt-get -y update
sudo apt-get -y remove nodejs
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs build-essential
sudo apt-get -y upgrade

# Install Docker
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi
