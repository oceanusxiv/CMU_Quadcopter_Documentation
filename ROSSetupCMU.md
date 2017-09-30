# ROS Setup and Usage for CMU Quadcopter Group

## Simulation Setup

In this section we will install and setup the necessary packages and components needed in order to run a ROS integrated Gazebo simulation of the PX4 flight stack.

* Installing and building necessary packages

Simply download this [script](https://raw.githubusercontent.com/eric1221bday/CMU_Quadcopter_Documentation/master/scripts/ubuntu-sim-setup.sh), and run it as below

```bash
wget https://raw.githubusercontent.com/eric1221bday/CMU_Quadcopter_Documentation/master/scripts/ubuntu-sim-setup.sh
source ubuntu-sim-setup.sh
```

## Simulation Usage

There is an example launch file in the `hallway_navigator` package for launching a Gazebo ROS simulation.

```bash
cd ~/sandbox/quadcopter
source devel/setup.bash
roslaunch hallway_navigator sitl_gazebo.launch
```