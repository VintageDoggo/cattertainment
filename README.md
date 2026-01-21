# Cat-tertainment System
This repository contains the base image for the microprocessor behind the cattertainment system. 

## How it works
The Cattertainment system works based on a a Microprocessor and Microcontrollers working through the Zenoh protocol. 
The microprocessors serves several applications:
* Zenoh Router: for managing discovery and serving pub/sub systems with the microcontrollers 
* Vision application: Cat tracker movement. 

All applications are containerized and through Podman for efficient application update delivery. 

*Note:* Mender Updates (and Mneder Delta Updates) are on the roadmap, but not strictly necessary. 

The microprocessor is targeted to be a raspberry-pi 4 Model B, but the kas model implemented here aims to make it target-agnostic. 

# Working in this repository
This repository uses `kas` for metadata configuration in layers for the Yocto distribution. 
`kas build raspberrypi` will produce the image required for deploying applications in the Raspberry Pi.


