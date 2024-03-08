---
title: 'PHP - A Scholastic Endeavor'
date: Fri, 10 Apr 2020 13:30:19 +0000
draft: false
tags: ['Getting Started', 'PHP', 'PHP', 'Windows']
---

PHP is a popular serverside scripting language. You've probably heard that at least a hundred times. When I was told that we were doing PHP in school, I was rather skeptical. I had fallen into the misleading belief that PHP was a 'Dead language'. Don't get me wrong, PHP as a tool still does lack the finesse of something like ASP .NET. Its installation process on my Mac was very finicky ( probably because it was a Mac, but you got to work with what you got to work with ). The addition of extensions(pdo\_mysql in my case) through the .ini file was unusual. But, to consider PHP a dead language is highly misleading. My experience with PHP so far has been a rather tumultuous one with loads of highs and lows. However, it is very easy to get into and you can build useful dynamics websites without having to spend a lot of time learning the syntax.

Installing PHP on Windows -
---------------------------

Installing PHP onto a Mac is a finicky process. The following details the installation of PHP onto a Windows system.

#### Downloading The .zip file (Step 1) -

1.  Hit [PHP's Download For Windows website](https://windows.php.net/download#php-7.4)
2.  Download the latest thread-safe versions .zip file

![](http://abhinavpradeep.com/wp-content/uploads/2020/04/PHP-1.png)

#### Extracting the .zip file into a new folder (Step 2) -

1.  Wait for the .zip to download
2.  Extract the .zip into any folder of your choosing as shown below

![](http://abhinavpradeep.com/wp-content/uploads/2020/04/PHP-3.png)

Your Folder should look something like this.

![](http://abhinavpradeep.com/wp-content/uploads/2020/04/PHP-4.png)

#### Setting up Environment Variables (Step 3) -

This may sound daunting (It did for me anyways), but its actually pretty simple. Follow along

1.  Hit the windows key and search up Environment Variables (Example below)

![](http://abhinavpradeep.com/wp-content/uploads/2020/04/PHP-5.png)

2\. Doing so should open up something like this

![](http://abhinavpradeep.com/wp-content/uploads/2020/04/PHP-6.png)

3\. Click on the Environment Variables... button

4\. This should open up the edit Environment variables window as shown below -

![](http://abhinavpradeep.com/wp-content/uploads/2020/04/PHP-12.png)

5\. Within the System variables pane, look for the Path option as highlighted in the Image above

6\. Click Edit

7\. This should open a window as show below -

![](http://abhinavpradeep.com/wp-content/uploads/2020/04/PHP-7.png)

8\. Click the new option

9\. Mention the path to the folder where you extracted the .zip file that you had download from the PHP website.(Basically where PHP resides)

10\. Open the terminal and type in php -v

11\. If the command is recognised and executed, then php has been downloaded onto your system successfully.

![](https://i0.wp.com/abhinavpradeep.com/wp-content/uploads/2020/04/PHP-8.png?fit=1024%2C405)

### PHP's Hello World (SPOILER ALERT: It's not a hello world)

As your first piece of php code, it only fitting to write a hello world program. Well php's hello world is not straight forward.

1.  First, create a HelloWorld.php file
2.  Type in the code in the image below

![](https://i1.wp.com/abhinavpradeep.com/wp-content/uploads/2020/04/PHP-9.png?fit=1024%2C394)

If the image is not visible or clear, here is the code to execute.

```
<?php
    phpinfo();
?>
```

Now, the last step is to create a server to run your code on. Open the VS Code terminal(assuming you are using VS Code. Else, open terminal and navigate to the folder in which your file is stored). Type in

```
php -S localhost:PortOfYourChoice
```

The result should look something like this -

![](http://abhinavpradeep.com/wp-content/uploads/2020/04/PHP-10.png)

Go to any browser of your choice and run http://localhost:(your path here, WITHOUT BRACKETS)/(your files name, WITHOUT BRACKETS).php .The result should look like this -

![](https://i2.wp.com/abhinavpradeep.com/wp-content/uploads/2020/04/PHP-11.png?fit=1024%2C618)

Now we have php up running on our systems. Next, we will take a look at some of the syntax and truly appreciate the languages simplistic versatility. Until next time :-)

> May the force be with you, always