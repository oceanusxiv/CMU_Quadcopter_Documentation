# ROS Setup and Usage for CMU Quadcopter Group

## Simulation Setup

In this section we will install and setup the necessary packages and components needed in order to run a ROS integrated Gazebo simulation of the PX4 flight stack.

* Installing dependencies

Simply download this [script](https://raw.githubusercontent.com/eric1221bday/CMU_Quadcopter_Documentation/master/scripts/ubuntu-sim-setup.sh), and run it as below

```bash
wget https://raw.githubusercontent.com/eric1221bday/CMU_Quadcopter_Documentation/master/scripts/ubuntu-sim-setup.sh
source ubuntu-sim-setup.sh
```

* Setup Catkin Workspace

A catkin workspace is an isolated work area where catkin packages, including ROS source packages, can be compiled and used.

```bash
mkdir -p ~/sandbox/quadcopter/src
cd ~/sandbox/quadcopter
catkin init
```

* Clone necessary packages to be built from source

```bash
cd ~/sandbox/quadcopter/src
git clone https://github.com/PX4/Firmware.git --recursive
git clone https://github.com/eric1221bday/sitl_gazebo.git --recursive
git clone https://github.com/eric1221bday/hallway_navigator.git
git clone https://github.com/cmu-quadcopter/mavros_excercise.git
cd ..
catkin build
```

## Simulation Usage

There is an example launch file in the `hallway_navigator` package for launching a Gazebo ROS simulation.

```bash
cd ~/sandbox/quadcopter
source devel/setup.bash
roslaunch hallway_navigator sitl_gazebo.launch
```