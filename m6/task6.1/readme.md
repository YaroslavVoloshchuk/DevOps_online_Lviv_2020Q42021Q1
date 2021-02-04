TASK 6.1

1. Network topology:

![](images/scr1.png)

Host - Ubuntu Desktop 20.04

VM1 - Ubuntu Server 20.04

VM2 - UbuntuServer1 20.04

2. VM1 has 2 interfaces (NAT and internal)

Configure netplan (VM1):

![](images/scr3.png)

![](images/scr2.png)

Configure port forwarding on VM1 (interface NAT):

![](images/scr4.png)

Configure /etc/sysctl.conf:

![](images/scr5.png)

Then configure netplan on VM2:

![](images/scr6.png)
 
Сonfigure routing on VM1 (iptables, forward, masquerade):

![](images/scr7.png)


PROFIT!!! VM2 has an access to the Internet  

Safe iptables: `sudo iptables-save -f /etc/iptables-conf/iptables_rules.ipv4`

Restore iptables: `sudo iptables-restore -vV /etc/iptables-conf/iptables_rules.ipv4` 

3. Check the route from VM2 to Host. 

![](images/scr8.png)

4.Check the access to the Internet, (just ping, for example, 8.8.8.8):

![](images/scr9.png)


5. Determine, which  resource has an IP address 8.8.8.8

8.8.8.8 is Google Public DNS

![](images/scr10.png)

6.Determine, which  IP address belongs to resource epam.com. 

![](images/scr11.png)

![](images/scr12.png)

7.Determine the default gateway for your HOST and display routing table.

192.168.0.1 - default gateway on HOST

`route -n` - display routang table


![](images/scr14.png)


8.Trace the route to google.com:

![](images/scr13.png)

