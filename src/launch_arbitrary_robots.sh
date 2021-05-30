#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "Usage : bash launch_arbitrary_robots.sh 2"
    exit
fi

trap ctrl_c INT

function ctrl_c() {
        echo "** Trapped CTRL-C"
}

# assign first received argument to variable PKG_NAME
N_ROBOTS=${1}
echo $N_ROBOTS
for ROBOT in `seq 1 $N_ROBOTS`;
  do
    let R_INDEX=ROBOT-1
    NAMESPACE="robot_$R_INDEX"
    echo $NAMESPACE
    roslaunch multi_robot_home_clean launch_dummy_robot.launch ns:=$NAMESPACE &
  done

wait
