#!/bin/bash
set -e

cd ..
if docker ps -q -f name=ocp4test; then
    echo "Stopping ocp4test container"
    docker stop ocp4test
    echo "Removing old ocp4test container"
    docker rm ocp4test
else
    echo "No ocp4test running"
fi;
echo "Building ocp4-release-tool"
docker build -t ocp4-release-tool .
echo "Starting container ocp4test"
docker run --name ocp4test -d -p 5000:5000 ocp4-release-tool
echo "Wait 3sec for container to start"
sleep 3
echo "Checking if container is running"
if curl -L -X GET http://localhost:5000; then 
    echo "Test pass"
else 
    echo "Test fail"
fi;

exit 0