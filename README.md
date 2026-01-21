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

# Zenoh-based architecture
Zenoh offers different flavors for different languages. By staying at the pure Zenoh level, rather than going ROS + rmw_zenoh, we ensure interoperability between the microcontroller (running zenoh-pico), the Rust control application (running Zenoh), the Rust zenohd + storage, and the Python movement tracking application.

Microcontroller application: Publisher + subscriber 
The Publisher describes the state of a specific node, alerting if the attachment of the node is no longer present. 
The Subscriber receives values for the servo motor driven by the microcontroller and other configuration needed by the node. 

Control application: Publisher + subscriber
The Publisher activates or deactivates a node, and sends specific values to alter the movement of an attachment in a node. General node configuration. 
The Subscriber receives status values for all nodes and reports them back to the user.

Rust zenohd + storage: Router + subscriber + queryable
Router for network discovery between peers. A storage backend is created to create persistance of the values received and hot-load configuration (perchance).

Movement tracking application: OpenCV + Publisher
The Publisher relays the control signal to drive the dynamic node according to the tracking algorthm results.


