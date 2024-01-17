#!/bin/bash

# Download and Install Go Version 1.17.7 removing any previous versions of Go that may be installed
wget https://go.dev/dl/go1.17.7.linux-amd64.tar.gz -O ${HOME}/Downloads/go1.17.7.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzvf ${HOME}/Downloads/go1.17.7.linux-amd64.tar.gz

# Update the bashrc file with the necessary configuration settings for Go

echo "" >> ${HOME}/.bashrc
echo "# Setup golang env" >> ${HOME}/.bashrc
echo "export GOPATH=${HOME}/gopath:/usr/local/go" >> ${HOME}/.bashrc
echo "export PATH=${PATH}:${HOME}/gopath/bin:/usr/local/go/bin" >> ${HOME}/.bashrc

# Export the Go environments for use in script

echo -n "export GOPATH=${HOME}/gopath:/usr/local/go" > go_variables
echo -n "export PATH=${PATH}:${HOME}/gopath/bin:/usr/local/go/bin" >> go_variables
source go_variables

# Install the required dependencies

go get github.com/HouzuoGuo/tiedot
go get golang.org/x/crypto/openpgp
go get golang.org/x/net/proxy
go get golang.org/x/net/html
go get github.com/rwcarlsen/goexif/exif
go get github.com/rwcarlsen/goexif/tiff

# Installation of Docker and add user to Docker group

sudo apt update && sudo apt install docker.io -y
sudo usermod -aG docker $USER

# Installation of Onionscan

go install gitlab.com/n3ph0s/onionscan@latest
cd gopath
cp -r `find ~+ -type d -name "templates"` $HOME
cd -

# Clean up and Reboot system to complete the installation

rm go_variables
echo "Installation complete.  The system will now reboot."
shutdown -r -t 1