---
title: 'Starting MongoDB – The basics'
date: Thu, 09 Jan 2020 14:52:55 +0000
draft: false
tags: ['MongoDB', 'NOSQL']
---

Today I started out early. I woke up to the breath taking sight of the ocean from my window. I’m a pretty lazy guy. It’s impossibly hard for me to get out of bed. I felt DRAINED today morning. I’m pretty nocturnal. I usually have more energy at night than in the morning. I persevered and got out of bed with renewed energy. Either that or my dad practically pulled me out of bed and dumped me in the shower (probably the latter over the former but let’s choose to ignore that fact)

So, I have a bath, get dressed and have my daily dose of coffee. I have a cup of coffee every day in the morning. I have this serious coffee addiction. Every time I see a cup of coffee, I be like༼ つ ◕\_◕ ༽つ. Anyway, after I had my coffee, I got to my daily grind. It might blow your mind but I am an avid coder. It didn’t? what gave it away. It’s not like I’ve mentioned in nearly every page of this website. I did huh ;-P . Anyway today I was going to have a look at [MongoDB](https://www.mongodb.com/) . So, if you know anything about me (which you probably don’t) you would know that I’ve been learning to code since I was ten . I am most familiar with C#. I did dabble in HTML and CSS but that didn’t lead anywhere so… ¯\\\_(ツ)\_/¯. Anywho today I was going to start off with a database management service called MongoDB. So MongoDB is a pretty good asset for most developers. It is a NoSQL-Document database. documents have key-value pairs that form the basic units of data. It follows no pre-defined schema. Unlike tables and rows, the document can hold any set of values based on any key. This reduces the hassles of using tables and SQL databases.

I decided not to go through the hassle of installing MongoDB locally as I felt that it is not something that I wanted to start with. I decided to use Atlas which provisions MongoDB as a service. The steps to create a MongoDB instance on Atlas are below

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/MongoDb-Atlas-1.png)

Step 1 - Select the Cluster Type

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/MongoDb-Atlas-2.png)

Step 2 - Select the cloud provider

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/MongoDb-Atlas-3.png)

Step 3 - Start Cluster creation

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/MongoDb-Atlas-4.png)

Step 4 - Complete Cluster creation

If you are trying to use MongoDB for the first time, I would suggest that you use the starter cluster. I don’t have an opinion on what cloud provider to use, personally, I used AWS as it had servers in Sydney. You should browse through all cloud providers and find the most convenient one for you. After [setting](https://docs.atlas.mongodb.com/getting-started/) up my account on Atlas, I started to figure my way around it.

The recap of what I learnt is below

*   MongoDb has a concept of Databases and Collections.
*   A database has many collections.
*   Each collection is a collection of documents.
*   Each document has an associated document id.

I would suggest that you take a look at [this](https://docs.mongodb.com/manual/reference/command/) link it lists all the command line tools. I strongly suggest that you play around with these and add or delete items from your database along with learning to update, query and replace them. I also suggest that you have a basic understanding of JSON. You should also know how to serialize and deserialize a c# object. Also, I suggest that you take a look at [this ](https://www.youtube.com/watch?v=VELru-FCWDM&t=35s)video to gain a better understanding of MongoDb.

I also suggest that you have a basic understanding of JSON. You should also know how to serialize and deserialize a c# object

_“Learning is the only thing the mind never exhausts, never fears, and never regrets.”_ - Leonardo Da Vinci