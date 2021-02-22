Module CI/CD.

 The host with GIT is taken as a basis from where changes on Github are pushed. And two instances AWS, the first with Jenkins, the second with the Apache web server. Automatic deployment is set up. 


 Created new repo on GitHub and cloned to local host:

![](images/scr1.png)

Github project:

![](images/scr2.png)

Created new job on Jenkins:

![](images/scr3.png)

![](images/scr4.png)

Configured SSH and post-build action:

![](images/scr5.png)

![](images/scr6.png)

Started job:

![](images/scr7.png)

Console output:

![](images/scr8.png)

![](images/scr9.png)


Deployed to WebServer:

![](images/scr10.png)

AWS:

![](images/scr11.png)

Then congirured autobuild and autodeploy to webserver. Add webhook on GitHub:

![](images/scr12.png)

Changed permissions for folder /var/www on WebServer (apache2):

![](images/scr13.png)

Everything, check if it works. Push new commit to GitHub (changed the file index.html):

![](images/scr14.png)

We are browsing the web server:

![](images/scr15.png)

PROFIT! It works!


