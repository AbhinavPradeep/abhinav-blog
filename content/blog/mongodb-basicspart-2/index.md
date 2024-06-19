---
title: 'MongoDB-Basics(Part 2)'
date: Thu, 16 Jan 2020 14:23:05 +0000
draft: false
tags: ['MongoDB', 'NOSQL']
---

Yesterday was a pretty busy day for me. I wanted to get this blog up yesterday itself but hey ¯\\\_(ツ)\_/¯, what can you do? Yesterday I had to go with my parents to the Plaza. We had to get some shopping done and I didn’t get much time to do what I wanted to. However, the one thing I was able to do yesterday was to keep all the research and material to do this today.

This blog is a continuation of my Introduction to [MongoDB – The Basics ](http://www.abhinavpradeep.com/nosql/starting-mongodb-the-basics/)post. Last time we took a look at how to set up MongoDB Atlas and how to create a cluster. We also took a look at how a database is organized. We then looked at what NoSQL means and its benefits and drawbacks. Today, we will look at some Command line tools and play around with our collection. An essential prerequisite to this is that you need to whitelist your IP address. It’s an issue that I ran into while trying to connect to my database from my system. First, you need to open your clusters page in MongoDB Atlas. Click on the connect button. It will give you the following options.

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb1.jpg)

After copying the collection string, paste it in the command prompt, like so

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb2.jpg)

It will now ask for your password. After entering it, your system will be connected to your cluster.

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb3.jpg)

Now, we will add a create a collection and add a document into it. In order to do so, we will use the insert command, the syntax is as follows

```
db.*Name of your collection*.insert({*Name of field*:*Data to be stored in feild*})
```

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb4.jpg)

Given above is the result of entering this command in the command prompt. Now a collection called collection has been created containing a document of \_id 1. While entering the data to be stored in the document, it is very important to enter the \_id of the document. The \_id key is the primary key and must be entered for every document

Now, in order to see the data stored in the collection, enter the find() command. The syntax is as follows

```
db.*Name of collection*.find()
```

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb5.jpg)

In the image above, you can see that all the data I entered in my collection is displayed in the command prompt. The .pretty() command formats the data before displaying it.

Now, I am going to create a collection called users. Within this collection, the names and addresses of people are saved. Addresses are saved as subdocuments within the documents of their respective owners. Each user also has an array of strings called things(hey that rhymed ^\_^ ). There is also some random information stored in some of the entries. This is to give them something unique which will help demonstrate certain commands later.

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb6.jpg)

We now have three entries which seem to be more than enough for this demonstration. So, in this post, we will talk about all the update commands and how to use them

Increment update
----------------

The increment update lets you increase the values of integer values. It’s a pretty basic update and lets you add any specified value to a pre-existing value.

```
db.*Name of the collection*.update({*_id of the document*},{$inc:{*Value to be incermented*:*Value of the icrement*}})
```

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb7.jpg)

As you can see from the above image, The salary field has a value of 12,355,678. If someone wanted to increment the field, they would have to use the $inc update

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb8.jpg)

Given above is the update that I passed. According to this update, I have incremented the value of the Salary field by 10,000.

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb9.jpg)

Given above is the result. Notice that the Salary field has increased to 12,365,678(Exactly 10,000 more).

Set update
----------

The $set update lets you essentially create and set the value of a field of an already existing document through an update. The syntax is as follows.

```
db.*Name of the collection*.update({*_id of document*},{$set:{*Name of field*:*Value*}})
```

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb10.jpg)

As you can see there is no Salary field above

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb11.jpg)

Using the $set command, I have now created a field called Salary and assigned it a value of 12345678

The results are as follows

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb12.jpg)

Rename update
-------------

The rename update can be used to update the names of fields. If a field is named wrong or misspelled, its name can be changed using the rename update. Its syntax is as follows.

```
db.*Name of the collection*.update({*_id of document*},{$rename:{*Old name of field*:*New name of the field*}}
```

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb13.jpg)

Given above are the values stored in the \_id:1 document. Now if I wanted to change the ‘Street’ field to ‘Colony’, I would have to use the $rename update

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb14.jpg)

As a result of this, My Street field will be changed to Colony.

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb15.jpg)

Push, Pull and Pop – The array updates
--------------------------------------

### Push :-

Let’s say you wanted to add an item to an array. In that case, you need to use the $push update. The syntax of the push update is as follows.

```
db.*Name of the collection*.update({*_id of document*},{$push:{*Name of array*:*Item within array*}}
```

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb16.jpg)

As you can see the ‘Things’ array contains the values ‘Three’,’Two’ and ‘One’. If we wanted to add ‘Four’ to the array, we need to use the push update.

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb17.jpg)

The result:-

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb18.jpg)

### Pull :-

The pull command lets you remove all instances of an item from an array. The syntax is as follows

```
db.*Name of *.update({*_id of the document*},{$push:{*Name of array*:*Name of item to delete*}})
```

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb18-1.jpg)

As you can see in the above image the things array contains items ‘One’,’Two’,’Three’, and ‘Four’. Now let’s say that we want to delete the item ‘Four’. We would use the following command.

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb19.jpg)

This would now delete the item ‘Four’ from the Things array. If there were multiple items called ‘Four’, all of them would be deleted

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/Mgdb16-1.jpg)