TASK 4.2

4.2.1 Topology of the corporate network, which includes two buildings with 2 floors in each. The horizontal subsystem of the floor has one group of 5 computers

![](images/scr1.png)

First building, first floor:

PC0 192.168.0.1
PC1 192.168.0.2
PC2 192.168.0.3
PC3 192.168.0.4
PC4 192.168.0.5
Gateway 192.168.0.10

First building, second floor:

PC5 192.168.1.1
PC6 192.168.1.2
PC7 192.168.1.3
PC8 192.168.1.4
PC9 192.168.1.5
Gateway 192.168.1.10

Second building, first floor:

PC10 192.168.2.1
PC11 192.168.2.2
PC12 192.168.2.3
PC13 192.168.2.4
PC14 192.168.2.5
Gateway 192.168.2.10

Second building, second floor:

PC15 192.168.3.1
PC16 192.168.3.2
PC17 192.168.3.3
PC18 192.168.3.4
PC19 192.168.3.5
Gateway 192.168.3.10

Static routes on Router0 and Router1:

![](images/scr2.png)
![](images/scr3.png)

Ping between two buildings:

![](images/scr5.png)


The network is working.

TASK 4.2.2

Corporate network, which contains 1 house with four floors. The horizontal subsystem of the floor consists of two working groups of 3 and 5 computers, respectively. I made a logical structuring of the network into 8 subnets (according to the number of working groups).

![](images/scr6.png)

Router configure (CLI):

Router>show ip rip database
192.168.0.0/24    auto-summary
192.168.0.0/24    directly connected, FastEthernet1/0
192.168.1.0/24    auto-summary
192.168.1.0/24    directly connected, FastEthernet0/0
192.168.2.0/24    auto-summary
192.168.2.0/24    directly connected, FastEthernet2/0
192.168.3.0/24    auto-summary
192.168.3.0/24    directly connected, FastEthernet3/0
192.168.4.0/24    auto-summary
192.168.4.0/24    directly connected, FastEthernet4/0
192.168.5.0/24    auto-summary
192.168.5.0/24    directly connected, FastEthernet5/0
192.168.6.0/24    auto-summary
192.168.6.0/24    directly connected, FastEthernet7/0
192.168.7.0/24    auto-summary
192.168.7.0/24    directly connected, FastEthernet6/0
Router>

Router>show interfaces
FastEthernet0/0 is up, line protocol is up (connected)
  Hardware is Lance, address is 0030.f2c0.4d37 (bia 0030.f2c0.4d37)
  Internet address is 192.168.1.10/24

FastEthernet1/0 is up, line protocol is up (connected)
  Hardware is Lance, address is 0001.9762.2751 (bia 0001.9762.2751)
  Internet address is 192.168.0.10/24

FastEthernet2/0 is up, line protocol is up (connected)
  Hardware is Lance, address is 0004.9a39.3b2c (bia 0004.9a39.3b2c)
  Internet address is 192.168.2.10/24

FastEthernet3/0 is up, line protocol is up (connected)
  Hardware is Lance, address is 00d0.bc72.4b0c (bia 00d0.bc72.4b0c)
  Internet address is 192.168.3.10/24

FastEthernet4/0 is up, line protocol is up (connected)
  Hardware is Lance, address is 0006.2ad1.cba6 (bia 0006.2ad1.cba6)
  Internet address is 192.168.4.10/24

FastEthernet5/0 is up, line protocol is up (connected)
  Hardware is Lance, address is 00d0.ff73.2780 (bia 00d0.ff73.2780)
  Internet address is 192.168.5.10/24

FastEthernet6/0 is up, line protocol is up (connected)
  Hardware is Lance, address is 0060.47bd.72ae (bia 0060.47bd.72ae)
  Internet address is 192.168.7.10/24

FastEthernet7/0 is up, line protocol is up (connected)
  Hardware is Lance, address is 0001.c99c.7356 (bia 0001.c99c.7356)
  Internet address is 192.168.6.10/24

Also, each PC in its subnet was assigned its own IP. Check if the network is working:

![](images/scr7.png)

Some ping:

From PC24 (192.168.6.1) - fourth floor to PC12 (192.168.3.2) and PC10 (192.168.2.3)- second floor:

![](images/scr8.png)

From PC2 (192.168.1.3) - first floor to PC31 (192.168.7.4) - fourth floor and PC21(192.168.5.1) -third floor:

![](images/scr9.png)

The network is working.


TASK 4.2.3

Corporate network of five one-storey buildings. One building - one working group of 6 computers. The network is based on a router with one port

![](images/scr10.png)

Step 1: create vlan 10,20,30,40,50 on each switch. Between the switches trunk mode, between pc and switch access mode.
VLAN10 - fisrt building, 192.168.10.0
VLAN20 - second building, 192.168.20.0
VLAN30 - third building, 192.168.30.0
VLAN20 - fourth building, 192.168.40.0
VLAN20 - fivth building, 192.168.50.0

Step 2: Сonfigured the router:

```
Router#ena
Router#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
Router(config)#int fa0/0
Router(config-if)#no sh
Router(config-if)#int fa0/0.10
Router(config-subif)#
%LINK-5-CHANGED: Interface FastEthernet0/0.10, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface FastEthernet0/0.10, changed state to up

Router(config-subif)#enc
% Incomplete command.
Router(config-subif)#
Router(config-subif)#enc
Router(config-subif)#encapsulation dot1Q 10
Router(config-subif)#ip address 192.168.10.1 255.255.255.0
Router(config-subif)#ex
Router(config)#int fa0/0.20
Router(config-subif)#
%LINK-5-CHANGED: Interface FastEthernet0/0.20, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface FastEthernet0/0.20, changed state to up

Router(config-subif)#encapsulation dot1Q 20
Router(config-subif)#ip address 192.168.20.1 255.255.255.0
Router(config-subif)#ex
Router(config)#int fa0/0.30
Router(config-subif)#
%LINK-5-CHANGED: Interface FastEthernet0/0.30, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface FastEthernet0/0.30, changed state to up

Router(config-subif)#encapsulation dot1Q 30
Router(config-subif)#ip address 192.168.30.1 255.255.255.0
Router(config-subif)#ex
Router(config)#int fa0/0.40
Router(config-subif)#
%LINK-5-CHANGED: Interface FastEthernet0/0.40, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface FastEthernet0/0.40, changed state to up

Router(config-subif)#encapsulation dot1Q 40
Router(config-subif)#ip address 192.168.0.1 255.255.255.0
Router(config-subif)#ip address 192.168.40.1 255.255.255.0
Router(config-subif)#ex
Router(config)#int fa0/0.50
Router(config-subif)#
%LINK-5-CHANGED: Interface FastEthernet0/0.50, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface FastEthernet0/0.50, changed state to up

Router(config-subif)#encapsulation dot1Q 50
Router(config-subif)#ip address 192.168.50.1 255.255.255.0
Router(config-subif)#ex
```
![](images/scr11.png)

Then configured DHCP router:

```
Router(config)#ip dhcp pool 10
Router(dhcp-config)#defa
% Incomplete command.
Router(dhcp-config)#def
Router(dhcp-config)#default-router 192.168.10.1
Router(dhcp-config)#network 192.168.10.0 255.255.255.0
Router(dhcp-config)#ex
Router(config)#ip dhcp pool 20
Router(dhcp-config)#default-router 192.168.20.1
Router(dhcp-config)#network 192.168.20.0 255.255.255.0
Router(dhcp-config)#ex
Router(config)#ip dhcp pool 30
Router(dhcp-config)#default-router 192.168.30.1
Router(dhcp-config)#network 192.168.30.0 255.255.255.0
Router(dhcp-config)#ex
Router(config)#ip dhcp pool 40
Router(dhcp-config)#default-router 192.168.40.1
Router(dhcp-config)#network 192.168.40.0 255.255.255.0
Router(dhcp-config)#ex
Router(config)#ip dhcp pool 50
Router(dhcp-config)#default-router 192.168.50.1
Router(dhcp-config)#network 192.168.50.0 255.255.255.0
Router(dhcp-config)#ex
Router(config)#ex
```
![](images/scr12.png)

Then configured IP each PC (DHCP):

![](images/scr13.png)


Test the network:

![](images/scr14.png)
![](images/scr15.png)

Some ping:

From PC9 (second buiding, 192.168.20.5) to PC25 (fivth building, 192.168.50.3) and PC19 (fourth building, 192.168.40.3)

![](images/scr16.png)

The network is working.
