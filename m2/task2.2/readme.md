I registered with AWS

![](images/scr1.png)

Then I created own Linux VM with Amazon Lightsail and connected to it.

![](images/scr2.png)

![](images/scr3.png)

Launched Linux VM with EC2 (t2 micro instance, CentOS):

![](images/scr4.png)

Connected ssh:

![](images/scr6.png)


Created a snapshot my instance:

![](images/scr5.png)

Created EBS/Volume and attached Disk_D to my instance:

![](images/scr7.png)
![](images/scr8.png)

Mounted DiskD and created and saved some file on DiskD:
![](images/scr9.png)

Then created from a snapshot AMIs and launched third instance from it

![](images/scr10.png)

And dettached disk_D from the 2nd instance and attached Disk_D to the new instance:

![](images/scr11.png)

Then launched and configured a Wordpress instance with Amazon Lightsail:

![](images/scr12.png)
![](images/scr13.png)

Then I created bucket in Amazon S3 and uploaded some files and folder. Then I deleted file:

![](images/scr14.png)

Then I created IAM User, installed and configured AWS-CLI and uploaded/downloaded some files

![](images/scr15.png)
![](images/scr16.png)

I explored possibilities of creating my own domain and domain name
in Route 53 console (Route 53 is AWS’s DNS service).

![](images/scr17.png)

Then I created a cluster (Amazon ESC) and ran the online demo aplication

![](images/scr18.png)

Created a static website on Amazon S3:

http://websitevoloshchuk.s3-website.eu-central-1.amazonaws.com
