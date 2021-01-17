TASK 5.2

1. Analyze the structure of the /etc/passwd and /etc/group file, what fields are present in it, what users exist on the system? Specify several pseudo-users, how to define them.

Linux stores most account features in the /etc/passwd file. It is a text-based file with with seven fields for each entry. Each entry begins with a username and continues with a set of fields separated by colons (:). Here is the syntax of an entry in the /etc/passwd file:

username:password:UID:GID:comment:home directory:default shell

![](images/scr5.png)

In the picture above we can see the following information:

    username – voloshchuk 
    password – stored in the /etc/shadow file
    UID – 1000
    GID – 1000
    comment – full name of the user is Yaroslav Voloshchuk, phone numbers
    home directory – /home/voloshchuk
    default shell – /bin/bash

The group membership in Linux is controlled through the /etc/group file. This is a simple text file that contains a list of groups and the members belonging to each group. Just like the /etc/passwd file, the /etc/group file consists of a series of colon-delimited lines, each of which defines a single group. The file is readable by all users.

Here is how an entry in the /etc/group file looks like:

group name:password:GID:list of users

![](images/scr6.png)

In the example above you can see that the group `adm` has a GID of 4 and two users: syslog and voloshchuk.
 
Linux distributions contains pseudo-user description lines in the `passwd` file. These descriptions are never edited. Users of these names are not registered in the system and are only needed to confirm owner ship of the processes.

The most used are: daemon (used by system service processes), bin (gives ownership of executables command), adm (own sregistration files), nobody (used by many services), sshd (used by the secure shell server).


2. What are the uid ranges? What is UID? How to define it?

A UID (user identifier) is a number assigned by Linux to each user on the system. This number is used to identify the user to the system and to determine which system resources the user can access. UIDs are stored in the `/etc/passwd` file:

`cat /etc/passwd`

![](images/scr1.png)

The third field represents the UID. Notice how the root user has the UID of 0. Most Linux distributions reserve the first 100 UIDs for system use. New users are assigned UIDs starting from 500 or 1000. For example, new users in Ubuntu start from 1000.

When you create a new account, it will usually be give the next-highest unused number. If we create a new user on our Ubuntu system, it will be given the UID of 1001.

3. What is GID? How to define it?

Groups in Linux are defined by GIDs (group IDs). Just like with UIDs, the first 100 GIDs are usually reserved for system use. The GID of 0 corresponds to the root group and the GID of 100 usually represents the users group. GIDs are stored in the `/etc/group` file:

`cat /etc/group`

![](images/scr2.png)

The third field represents the GID. New groups are usually assigned GIDs starting from 1000.

![](images/scr3.png)

4. How to determine belonging of user to the specific group?

`id username` or `cat /etc/group | grep username`

![](images/scr4.png)
