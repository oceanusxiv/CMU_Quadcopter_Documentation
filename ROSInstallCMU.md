# ROS Setup for CMU Quadcopter Group

for original documentation, consult:
* [Official ROS Installation Guide](http://wiki.ros.org/kinetic/Installation/Ubuntu)
* [ROS Documentation](http://wiki.ros.org)
* [Ubuntu Installation on VMWare Workstation](https://betanews.com/2012/08/29/how-to-install-ubuntu-on-vmware-workstation/)
* [Ubuntu Installation on VMWare Fusion](http://hplgit.github.io/teamods/ubuntu/vmware/mac.html)
* [Official Ubuntu 16.04 Desktop Guide](https://help.ubuntu.com/lts/ubuntu-help/index.html)
* [Unix Terminal Quickstart](http://www.stat.rice.edu/~bhatticr/tutorials/UnixQuickStart.pdf)

Since most people would not have Linux as primary OS or dualboot, we will first cover how to install Ubuntu on a Virtual Machine.

## Installing the Ubuntu on a VM

First, head to [Ubuntu Desktop Download](https://www.ubuntu.com/download/desktop) page, and download Ubuntu 16.04.2 LTS, or whichever is the most recent LTS release. The downloaded file should be an iso.

Second, go to [CMU Computing Services for VMWare](https://www.cmu.edu/computing/software/all/vmware/index.html). Then click on the quick links on the right to access the VMWare Campus Webstore.

### For Windows

After login, add **VMWare Workstation 12** to cart, and "buy" it. After which you should be given a download link and a license key. Install the program as normal and enter the license key. After installation, follow below steps:

1. Open VMware Workstation and click on "New Virtual Machine".
2. Select "Typical (recommended)" and click "Next".
3. Select "Installer disc image (ISO)", click "Browse" to select the Ubuntu ISO file, click "Open" then "Next".
4. You have to type in "Full name", "User name" that must only consist of lowercase and numbers then you must enter a password. After you finished, click "Next".
5. You can type in a different name in "Virtual machine name" or leave as is and select an appropriate location to store the virtual machine by clicking on "Browse" that is next to "Location" -- you should place it in a drive/partition that has at least 20GB of free space. After you selected the location click "OK" then "Next".
6. In "Maximum disk size" you should allocate at least 20GB for ROS and it's attendant libraries.
7. Select "Store virtual disk as a single file" for optimum performance and click "Next".
8. Click on "Customize" and go to "Memory" to allocate more RAM -- 2GB is the minimum, if possible allocate half your available RAM.
9. Go to "Processors" and select the "Number of processors" that for a normal computer is 1 and "Number of cores per processor" that is 1 for single core, 2 for dual core, 4 for quad core and so on -- this is to insure optimum performance of the virtual machine.
10. Click "Close" then "Finish" to start the Ubuntu install process.

## For Mac

After login, add **VMWare Fusion 8 (for Mac OS X)** to cart, and "buy" it. After which you should be given a download link and a license key. Install the program as normal and enter the license key. After installation, follow below steps:

1. Launch VMWare Fusion
2. Click on File - New and choose to Install from disc or image.
3. Click on Use another disc or disc image and choose your .iso file with the Ubuntu image.
4. Choose Easy Install, fill in password, and check the box for sharing files with the host operating system.
5. Choose Customize Settings and make the following settings (these settings can be changed later, if desired).
6. Processors and Memory: Set a minimum of 2 GB, preferably half of your total RAM. Also give it half of your processors
7. Hard Disk: Choose how much disk space you want to use inside the virtual machine (20 GB is considered a minimum).
8. Choose where you want to store virtual machine files on the hard disk. The default location is usually fine. The directory with the virtual machine files needs to be frequently backed up so make sure you know where it is.
9. Ubuntu will now install itself without further dialog, but it will take some time.
10. After installation, if you are on a Mac with retina display, go to Virtual Machines -> Settings -> Display, and check "Use full resolution for Retina Display". Now you may adjust window size at will and resolution wil compensate.

## Getting Started with Ubuntu and Terminal

In the following sections, and in the future, almost all development work will be done within the Ubuntu environment with substantial usage of the unix terminal. If you are not familiar with either of those, I encourage you to check out the Ubuntu and Terminal guides listed above. For now, here are a few tips, tricks, and notes:

### Ubuntu
* (From Mac) All <kbd>CMD</kbd> based keyboard shortcuts in Ubuntu uses <kbd>CTRL</kbd> instead. e.g. <kbd>CMD</kbd>+<kbd>C</kbd> -> <kbd>CTRL</kbd>+<kbd>C</kbd>
* The Dashboard on the top left can be openned to search for applications and files similar to Windows Menu SearchBar or Mac Spotlight Search.
* The terminal can be openned by the keyboard shortcut: <kbd>CTRL</kbd>+<kbd>ALT</kbd>+<kbd>T</kbd>
* Applications can be locked to the Launchbar in a similar fashion as both other OS's.

### Terminal
* man [whatever] -> brings you to the documentation on any command
* ls [-a] -> lists out all elements in the current directory, -a reveals hidden files.
* cd [..]/[~/Downloads] -> changes directory, .. denotes one directory upwards, and ~ denotes the home directory, typically /home/username/
* rm [-rf] -> deletes files, -rf deletes directories
* sudo -> run with root permission, use with caution and only when needed
* mkdir [-p] -> make directors(folders), -p allows for creating of nested directories
* [sudo] apt install [package] -> As of 16.04 the command to install packages and programs in Ubuntu, may require sudo
* pressing the up and down arrow keys shows all previous commands, helpful with repeating long commands
* copying and pasting in terminal uses <kbd>CTRL</kbd>+<kbd>SHIFT</kbd>+<kbd>C</kbd> and <kbd>CTRL</kbd>+<kbd>SHIFT</kbd>+<kbd>V</kbd>
* <kbd>CTRL</kbd>+<kbd>C</kbd> in terminal stops any program running on the current terminal
* <kbd>CTRL</kbd>+<kbd>SHIFT</kbd>+<kbd>T</kbd> opens a new tab on the terminal
* ~/.bashrc -> the bashrc file is a bash script that executes everytime a new terminal instance is openned, useful for storing environmental variables or commonly run setup scripts

## Installing ROS

Installing ROS is a relatively streamlined procress involving just a few terminal commands, feel free to copy the commands below one by one into terminal. However, do take a look at the full installation guide listed above to get some context on what's going on.

```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt update
sudo apt install ros-kinetic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

Done!

## Installing Catkin Tools

Without getting into too much detail, catkin is the build system commonly used with ROS packages, and is necessary and useful to manage multiple ROS packages built from source.

```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt update
sudo apt install python-catkin-tools
```

## Installing Additional ROS packages

The following ROS packages are necessary for us to run our quadcopter programs and our iRobot programs.

```
sudo apt install ros-kinetic-mavros-extras ros-kinetic-turtlebot ros-kinetic-turtlebot-apps ros-kinetic-turtlebot-interactions
```

## Next Steps

You are highly encouraged to read up on the official tutorial series on the ROS website [here](http://wiki.ros.org/ROS/Tutorials).

We will cover setting up your ROS workspace and using ROS next time.

