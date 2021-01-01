Task 4.3

Build a local network (one switch, 5 pc and server). Switch is connected to the router and the server is  connected to the router:

![](images/scr1.png) 

Then assign ip addresses to computers and server:

PC0 - 192.168.0.1
PC1 - 192.168.0.2
PC2 - 192.168.0.2
PC3 - 192.168.0.3
PC4 - 192.168.0.4
PC5 - 192.168.0.5
Server0 - 192.168.0.6
Server1 - 192.168.1.1

![](images/scr2.png)

![](images/scr8.png)

Then configured the router(CLI):

![](images/scr3.png)

Then configured RIP on the router:

![](images/scr4.png)

Then test the network:

![](images/scr5.png)

Ping from Server0 to Server1:

![](images/scr6.png)

Ping from Server1 to PC0:

![](images/scr7.png)

The transfer of data according to the ICMP protocol between all objects of the network is achieved
