TASK 5.3

1. How many states could has a process in Linux?

The following are the process states:

1) `Running`: This is a state where a process is either in running or ready to run.
2) `Interruptible`: This state is a blocked state of a process which awaits for an event or a signal from another process
3) `Uninterruptible`: It is also a blocked state. The process is forced to halt for certain condition that a hardware status is waited and a signal could not be handled.
4) `Stopped`: Once the process is completed, this state occurs. This process can be restarted
5) `Zombie`: In this state, the process will be terminated and the information will still be available in the process table.


2. Examine the pstree command. Make output (highlight) the chain (ancestors) of the current process.

`Pstree` command in Linux that shows the running processes as a tree which is a more convenient way to display the processes hierarchy and makes the output more visually appealing. The root of the tree is either init or the process with the given PID.

![](images/scr1.png)


3. What is a proc file system?

Proc file system (procfs) is virtual file system created on fly when system boots and is dissolved at time of system shut down.

It contains the useful information about the processes that are currently running, it is regarded as control and information centre for kernel.

The proc file system also provides communication medium between kernel space and user space.

`ls -l /proc`

4. Print information about the processor (its type, supported technologies, etc.)

`cat /proc/cpuinfo` or `lscpu`

![](images/scr2.png)

5. Use the `ps` command to get information about the process. The information should be as follows: the owner of the process, the arguments with which the process was launched for execution, the group owner of this process, etc.

`ps -aux` or `ps -axfo user,group,pid,%cpu,%mem,vsz,rss,tty,start,time,command`

![](images/scr3.png)


6. How to define kernel processes and user processes?

A system process is initiated (or owned) by the operating system. These are critical processes that are required by the system for its functioning.

User process is something that you initiate, eg. any custom application that you would create.

The linux kernel processes are started by the kernel itself, and the kthread process with PID = 2 is assigned to the parent process that allegedly spawned them. Thus, the processes of the kernel should be considered the process itself with PID = 2, as well as processes whose PPID (i.e. the pid of the parent) is 2.

`ps --ppid=2 --pid=2`

User processes - all others:

`ps -N --ppid=2 --pid=2`

Also, by default `pstree` without parameters shows only the tree of processes spawned by init, i.e. user processes. Kernel processes will show  `pstree 2`  

![](images/scr4.png)


7. Print the list of processes to the terminal. Briefly describe the statuses of the processes. What condition are they in, or can they be arriving in?

![](images/scr5.png)


Column STAT displayed to describe the state of a process:

       D    uninterruptible sleep (usually IO)
       R    running or runnable (on run queue)
       S    interruptible sleep (waiting for an event to complete)
       T    stopped, either by a job control signal or because it is being traced.
       W    paging (not valid since the 2.6.xx kernel)
       X    dead (should never be seen)
       Z    defunct ("zombie") process, terminated but not reaped by its parent.

       When the stat keyword is used, additional characters may be displayed:

       <    high-priority (not nice to other users)
       N    low-priority (nice to other users)
       L    has pages locked into memory (for real-time and custom IO)
       s    is a session leader
       l    is multi-threaded (using CLONE_THREAD, like NPTL pthreads do)
       +    is in the foreground process group.


8. Display only the processes of a specific user.


`ps -u username`

![](images/scr6.png)

9. What utilities can be used to analyze existing running tasks (by analyzing the help for the ps command)?

`pgrep, pstree, top, proc`

`pgrep` is a command-line utility that allows you to find the process IDs of a running program based on given criteria. It can be a full or partial process name, a user running the process, or other attributes.

`top` command is used to show the Linux processes. It provides a dynamic real-time view of the running system. Usually, this command shows the summary information of the system and the list of processes or threads which are currently managed by the Linux Kernel.

About `pstree` and `proc`  described above. 


10. What information does `top` command display?

`top` command displays processor activity of your Linux box and also displays tasks managed by kernel in real-time. It'll show processor and memory are being used and other information like running processes. This may help you to take correct action.

11. Display the processes of the specific user using the top command.

`top -u username` 

For example: `top -u voloshchuk`

![](images/scr7.png)

12. What interactive commands can be used to control the top command? Give a couple of examples.

In running `top` command press: 

`Shift + f` - to enter the interactive menu

`Shift + p` - to sort processes as per CPU utilization

`Shift + m` - to sort by memory usage
    
`Shift + n` - to sort by process ID

`Shift + t` - to sort by the running time

`c` - display absolute path of running process.

`z` - display running process in color which may help you to identified running process easily

For example switching to multi-window mode press `Shift + a`:

![](images/scr8.png)
 
13. Sort the contents of the processes window using various parameters (for example, the amount of processor time taken up, etc.)

The command line option -o (o standing for "Override-sort-field"):

`top -O %CPU` - sorts by the column %CPU

`top -O %MEM` - sorts by the column %MEM

Also I can use VIRT, RES or SHR too. 


14. Concept of priority, what commands are used to set priority?

In Linux system priorities are 0 to 139 in which 0 to 99 for real-time and 100 to 139 for users. Nice value — Nice values are user-space values that we can use to control the priority of a process. The nice value range is -20 to +19 where -20 is highest, 0 default and +19 is lowest.

Instead of launching the program with the default priority, you can use `nice command` to launch the process with a specific priority.

You can change the scheduling priority of a running process to a value lower or higher than the base scheduling priority by using the `renice command` from the command line.

For example:

`nice -n -5 bash`

`renice value PID`

15. Can I change the priority of a process using the top command? If so, how?

In running top command press `r` (use ‘r‘ option to change the priority of the process also called Renice.)

![](images/scr9.png)

Enter PID and renice to new value. Profit!


16. Examine the kill command. How to send with the kill commandprocess control signal? Give an example of commonly used signals.

`kill` command in Linux (located in /bin/kill), is a built-in command which is used to terminate processes manually. kill command sends a signal to a process which terminates the process. If the user doesn’t specify any signal which is to be sent along with kill command then default TERM signal is sent that terminates the process.

`kill -l` - to display all the available signals you can use below command option

![](images/scr10.png)

The structure for this command would be:

`kill SIGNAL PID` or `kill SIGNAL Process by name` For examlpe `kill -9 firefox`

In running `top` command press `k`

After you enter the PID, press enter. Now it will ask which signal you want to use to kill the process. If you want to use SIGTERM(15), then simply press enter as it is the default signal. If you want to use SIGKILL(9), then type 9 and press enter.

![](images/scr11.png)

The most common kill signals are:

1 - SIGHUP - Hangup

2 - SIGINT - Interrupt from keyboard

9 - SIGKILL - Kill signal

15 - SIGTERM - Termination signal

17, 19, 23 - SIGSTOP - Stop the process


17. Commands jobs, fg, bg, nohup. What are they for? Use the sleep, yes command to demonstrate the process control mechanism with fg, bg.


The `fg` command switches a job running in the background into the foreground. The `bg` command restarts a suspended job, and runs it in the background. If no job number is specified, then the fg or bg command acts upon the currently running job.
If you know when starting the process that you will want to close the terminal before the process completes, you can start it using the `nohup` command. 


    Ctrl-C: Kill the process running in the foreground by sending the signal SIGINT
    Ctrl-Z: Suspend the process running in the foreground by sending the signal SIGTSTP
    jobs: Display a list of the jobs with their status
    fg: Move a background job into the foreground
    bg: Resume suspended jobs by running them as background jobs


![](images/scr12.png)


Part 2


1. Check the implementability of the most frequently used OPENSSH commands in the MS Windows operating system. (Description of the expected result of the commands + screenshots: command – result should be presented)

Connect to Linux machine (192.168.0.101) using ssh:

![](images/scr13.png)

For example used command `scp`- copy file using ssh   

![](images/scr14.png)

Then I created a new key pair, sent the public key to the server and inserted the contents of the key into `authirized_keys` file. Thus it was possible to enter the server on ssh without confirmation of the password:

![](images/scr15.png)
 
Connect to Linux machine (192.168.0.101) without password:

![](images/scr16.png)

2. Implement basic SSH settings to increase the security of the client-server connection 

We can configure file /etc/ssh/sshd_config  

1) Change standart port 22. If you use a different port, it adds a little bit of security through obscurity to your system.

2) Reject Connection Requests With No Passwords. The default settings for SSH accept connection requests without passwords.  We can change that very easily, and ensure all connections are authenticated `PermitEmptyPasswords no`

3) Use SSH Keys Instead of Passwords. Described above with snapshots.

4) Allow Only Specific Clients. If you want your server to be reachable from only a specific IP address on port 22, then you should consider filtering connections at your firewall by adding a firewall rule on your router or update your iptables. 

5) Disable Root Logins `PermitRootLogin no`

Then restart your SSHD service by entering one of the following commands to apply the changes:

`service sshd restart`


3. List the options for choosing keys for encryption in SSH. Implement 3 of them.

SSH supports several public key algorithms for authentication keys. These include:

    rsa - an old algorithm based on the difficulty of factoring large numbers. A key size of at least 2048 bits is recommended for RSA; 4096 bits is better. RSA is getting old and significant advances are being made in factoring. Choosing a different algorithm may be advisable. It is quite possible the RSA algorithm will become practically breakable in the foreseeable future. All SSH clients support this algorithm.

    dsa - an old US government Digital Signature Algorithm. It is based on the difficulty of computing discrete logarithms. A key size of 1024 would normally be used with it. DSA in its original form is no longer recommended.

    ecdsa - a new Digital Signature Algorithm standarized by the US government, using elliptic curves. This is probably a good algorithm for current applications. Only three key sizes are supported: 256, 384, and 521 (sic!) bits. We would recommend always using it with 521 bits, since the keys are still small and probably more secure than the smaller keys (even though they should be safe as well). Most SSH clients now support this algorithm.

    ed25519 - this is a new algorithm added in OpenSSH. Support for it in clients is not yet universal. Thus its use in general purpose applications may not yet be


The generation of rsa keys is implemented above.

The generation of dsa keys:

![](images/scr17.png)

The generation of ed25519 keys:

![](images/scr18.png)

 
4. Implement port forwarding for the SSH client from the host machine to the guest Linux virtual machine behind NAT.

Configure NAT on VM:

![](images/scr19.png)

Connect to a virtual machine located behind NAT:

![](images/scr20.png)
 
Also in port forwarding instead of ip 127.0.0.1 we can specify real ip (192.168.0.101) and we will try to be connected from Windows for example:

![](images/scr21.png)

![](images/scr22.png)

`netstat -an | grep 2222`

![](images/scr23.png)


5*. Intercept (capture) traffic (tcpdump, wireshark) while authorizing the remote client on the server using ssh, telnet, rlogin. Analyze the result.

SSH output: `sudo tcpdump -i enp1s0 port 22`

![](images/scr24.png)

![](images/scr25.png)

Telnet: `sudo tcpdump -i enp1s0 port 23`

Rlogin: `sudo tcpdump -i enp1s0 port 513`

SSH is a recently designed, high-security protocol. It uses strong cryptography to protect your connection against eavesdropping, hijacking and other attacks. Telnet and Rlogin are both older protocols offering minimal security. 

