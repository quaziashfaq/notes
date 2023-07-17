[TOP](./readme.md)
# Definitions:

## What is SAN?
- Fabric: A single storage nework, consisting of one or more FC switches and/or directors.
- SAN: A SAN consists of ore or more fabrics

## Port Types:
- N_Port: Node port -- A port on an HBA or storage controller that connects to a switch or director port
- F_Port: Fabric Port - A switch or director port tat is attached to an N_Port.
- E_Port: Expansion Port -- A port used for inter-switch links (ISLs)

## World Wide Name
- A World Wide Name (WWN) is a globally unique addres used to identify each FC node and node port
- A node is a switch, HBA or storage controller
- A storage can have one or more controllers and a server can have one or more HBAs.


# Some Training Modules to Cover
- FCSAN 120
- Virutal Fabric (VF-220)
- Fibre Channel Routing (FCR-220)
- Flow Vision (FLVIS-220) 
- Fibre Channel Over IP (FCIP) (FCIP-220)
- 
=======
# Fleeting Notes
A director is a chassis based modular networking device. 

Dual Fabric SAN has 2 separate fabrics. These fabrics work as redundant. A dual fabric design provides the highest level of redundancy.

The device that generates the storage commands are called initiator. For example, servers.

The devices that recieve the storage commands are called targets. For example, they are storage devices, backup devices.

A FC node can be a switch, an HBA or a storage controller. Each node may have one or more ports.

WWN is 8 byte address.

2 ways to zoning.
WWN based zoning: Port WWN and Node WWN are supported.

Domain/Port based zoning: It could be the port number or the port index.
Domain ID is a number from 1 to 239. It is assigned to each of the switch in a fabric. It's unique in the fabric. However, maximum number of domains within a fabric is 56 meaning there could be 56 directors/switches in a fabric.

Access Gateway: Used as a gateway. Not participate in the fabric. I think in this case, only WWN based zoning is possible. The port based zoning not possible.

Fabric Extension:
  - Long Distance ISLs
  - Fibre Channel over IP

FCR (Fibre Channel Routing)
 - Just want to share resources
 - But don't want to merge 2 fabrics.

Merge a number of ISL links into a logical link with greater bandwidth: Trunking.

Topologies:
  - Single Switch
  - Cascade
  - Ring: Like cascahd
  - Mesh: full or partial
  - Core/Edge:

Each node port in the fabric is assigned a 24-bit port id. It's to identify a node port in the fabric. PID consists of 3 parts:
  - Domain ID : Domain ID of the switch
  - Area ID   : Port index number in the switch
  - Node ID   : A number assigned to identify each node attached to the port



