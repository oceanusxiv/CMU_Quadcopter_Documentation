#!/bin/bash

## Bash script for setting up a ROS/Gazebo development environment for PX4 on Ubuntu LTS (16.04). 
##
## It installs the common dependencies for all targets (including Qt Creator) and the ROS Kinetic/Gazebo 7 (the default).
##
## Installs:
## - Common dependencies and tools for all targets (including: Ninja build system, Qt Creator, pyulog)
## - FastRTPS and FastCDR
## - ROS Kinetic (including Gazebo7)
## - MAVROS
## - PX4/Firmware source (to ~/src/Firmware/)

# Ubuntu Config
sudo apt-get remove modemmanager -y

# Ninja build system
ninja_dir=$HOME/ninja
echo "Installing Ninja to: $ninja_dir."
if [ -d "$ninja_dir" ]
then
    echo " Ninja already installed."
else
    pushd .
    mkdir -p $ninja_dir
    cd $ninja_dir
    wget https://github.com/martine/ninja/releases/download/v1.6.0/ninja-linux.zip
    unzip ninja-linux.zip
    rm ninja-linux.zip
    exportline="export PATH=$ninja_dir:\$PATH"
    if grep -Fxq "$exportline" ~/.profile; then echo " Ninja already in path" ; else echo $exportline >> ~/.profile; fi
    . ~/.profile
    popd
fi

# Common dependencies
echo "Installing common dependencies"
sudo add-apt-repository ppa:george-edison55/cmake-3.x -y
sudo apt-get update
sudo apt-get install python-argparse git git-core wget zip python-empy qtcreator cmake build-essential genromfs -y
# Required python packages
sudo apt-get install python-dev -y
sudo apt-get install python-pip -y
sudo -H pip install pandas jinja2
pip install pyserial
# optional python tools
pip install pyulog

sudo apt-get install ant openjdk-8-jdk openjdk-8-jre -y


# Install FastRTPS 1.5.0 and FastCDR-1.0.7
fastrtps_dir=$HOME/eProsima_FastRTPS-1.5.0-Linux
echo "Installing FastRTPS to: $fastrtps_dir"
if [ -d "$fastrtps_dir" ]
then
    echo " FastRTPS already installed."
else
    pushd .
    cd ~
    wget http://www.eprosima.com/index.php/component/ars/repository/eprosima-fast-rtps/eprosima-fast-rtps-1-5-0/eprosima_fastrtps-1-5-0-linux-tar-gz
    mv eprosima_fastrtps-1-5-0-linux-tar-gz eprosima_fastrtps-1-5-0-linux.tar.gz
    tar -xzf eprosima_fastrtps-1-5-0-linux.tar.gz eProsima_FastRTPS-1.5.0-Linux/
    tar -xzf eprosima_fastrtps-1-5-0-linux.tar.gz requiredcomponents
    tar -xzf requiredcomponents/eProsima_FastCDR-1.0.7-Linux.tar.gz
    cd eProsima_FastCDR-1.0.7-Linux; ./configure --libdir=/usr/lib; make; sudo make install
    cd ..
    cd eProsima_FastRTPS-1.5.0-Linux; ./configure --libdir=/usr/lib; make; sudo make install
    popd
fi

