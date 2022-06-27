#!/bin/sh

## ensure sudoer
sudo touch /opt/install-jdk8
sudo rm /opt/install-jdk8

## go to user home directory
cd

## remove the folder tempdir
rm -rf tempdir

## create the folder tempdir
mkdir -p tempdir

## get inside the tempdir
cd tempdir

## copy the jdk8 package
cp ~/Downloads/jdk-8u281-linux-x64.tar.gz .

## begin install process
gunzip jdk-8u281-linux-x64.tar.gz
tar -xvf jdk-8u281-linux-x64.tar
mv jdk1.8.0_281 jdk8

sudo mv jdk8 /opt/

cd /opt
sudo chown -R root:root jdk8
sudo chmod +x jdk8
sudo update-alternatives --install "/usr/bin/java" "java" "$(pwd)/jdk8/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "$(pwd)/jdk8/bin/javac" 1
sudo update-alternatives --install "/usr/bin/jar" "jar" "$(pwd)/jdk8/bin/jar" 1
java -version
