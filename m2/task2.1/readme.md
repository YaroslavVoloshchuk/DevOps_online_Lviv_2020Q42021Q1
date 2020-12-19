
Q: What are the most popular hypervisors for infrastructure virtualization?
A: They are Oracle VM Virtual box, VMWare vSphere, MS Hyper-V

Q: Briefly describe the main differences of the most popular hypervisors

A: There are 2 types of hypervisors:

![](images/scr8.png)

  Type 1: hypervisor runs directly on the host machine's physical hardware:
        Xen (XENSERVER, Citrix Hypervisor)
        VM Server for SPARC (Oracle)
        VM Server for x86 (Oracle)
        Hyper-V (Microsoft)
        VMware’s ESX/ESXi

    Type 2: hypervisor is typically installed on top of an existing OS:
        VMware Workstation
        VMware Player
        VirtualBox (Oracle)
        Parallels Desktop (Mac) 

 Part 2. Work with Virtual box

I installed  Virtual box on Ubuntu Desktop (main host) and downloaded latest stable version  UbuntuServer (20.04). Then created VM1 and installed Ubuntu

![](images/scr1.png)
![](images/scr2.png)

Then cloned VM1, created a group of two VM and took snapshots, exported VM1

![](images/scr3.png)
![](images/scr4.png)

Imported VM from *.ova file
![](images/scr5.png)

Configured USB and shared folder:

![](images/scr6.png)
![](images/scr7.png)
