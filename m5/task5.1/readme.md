TASK 5.1 Part 1.

1. Connected via ssh to UbuntuServer (VM on VirtualBox) from Ubuntu Desktop (main host) and login to the system as root:

![](images/scr1.png)

2. Executed the command `info passwd` and examined the basic parameters of the command and changed the password. System file /etc/shadow has changed.

![](images/scr2.png)

3. Users registered in the system:

`cat /etc/passwd`

![](images/scr3.png)

Display only the username: `cut -d: -f1 /etc/passwd`

The /etc/passwd file is a colon-separated file that contains the following information:

    User name.
    Encrypted password.
    User ID number (UID)
    User's group ID number (GID)
    Full name of the user (GECOS)
    User home directory.
    Login shell.

List Connected Users (command `w` or `who`):
 
![](images/scr4.png)

4. Changed personal information (`chfn`):

![](images/scr5.png)

5. Then I read the Linux help system (command `man man` and `man info`) Example: `man passwd`

Example of a command with two keys: `passwd -S -a`

![](images/scr6.png)

6. Then I read about `more` and `less` commands using the help system. Search .bash* files in the home directory (`ls -la`) View the content of files .bash:

`less .bashrc`

![](images/scr7.png)

7. Then I installed Finger - command is a user information lookup command which gives details of all the users logged in. (`sudo apt install finger`) and read the documentation for the finger command and created file `.plan`.  Example: `finger voloshchuk`

8. And list the contents of the home directory using the ls command (`ls -la`)

![](images/scr8.png)


TASK5.1 Part 2

1. Installed tree (`sudo apt install tree`)

Then display all files that contain a character `c` in the directory /var/log

`tree --prune --matchdirs -aP '*c*'`

![](images/scr9.png)

Display all files that contain  `traceroute` in `/` – The Root Directory.

`tree --prune --matchdirs -aP '*traceroute*'`

![](images/scr10.png)

2. To determine the file type of a file passed the name of a file to the `file` command. The file name along with the file type will be printed to standard output.

`file *` in the directory /var/log:

![](images/scr11.png)

3. An absolute path is defined as the specifying the location of a file or directory from the root directory(/). In other words we can say absolute path is a complete path from start of actual filesystem from / directory.
Some examples of absolute path:

`/var/log/kernel`

`/boot/grub/grub.cfg`

Relative path is defined as path related to the present working directory(pwd). Suppose I am located in /home/voloshchuk and I want to change directory to /home/voloshchuk/labs. I can use relative path concept to change directory to labs.

`$ pwd`

`/home/voloshchuk`

`$cd labs/`

`$pwd`

`/home/voloshchuk/labs`


Navigate to the home directory from anywhere in the filesystem is to use command `cd` with the tilde (~) character, as shown below:

`cd ~`

4. I got acquainted with various parameters of the `ls` command

`ls -l` - list files in long format. Here, `ls -l` shows file or directory, size, modified date and time, file or folder name and owner of file and its permission.

`ls -la` - list files in long format including hidden files

![](images/scr12.png)

5. Performed the following sequence of operations:

Created a subdirectory in the home directory

`mkdir labs`

Create a file containing information about directories
located in the root directory (using I/O redirection operations)

`ls -la / > inforootdir`

View the created file:

`cat inforootdir`

![](images/scr13.png)

Copy the created file to your home directory using relative and absolute addressing:

`cp inforootdir /home/voloshchuk/inforootdir` - absolute addressing;

`cp inforootdir ~/inforootdir` - relative addressing.

Delete the previously created subdirectory with the file: 

`rm -r labs`

Delete the file copied to the home directory:

`rm inforootdir`

![](images/scr14.png)
