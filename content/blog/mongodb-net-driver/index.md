---
title: 'MongoDB .Net driver'
date: Sat, 18 Jan 2020 05:17:16 +0000
draft: false
tags: ['C#', 'MongoDB', 'NOSQL']
---

Today was a pretty boring day. My parents and I went to the plaza. There was a lot of shopping to do and it was nearly 2 o’clock by the time we finished. We then grabbed some food and headed home. I then got to work on preparing the material for today, so yeah :/ , not much to say about the day.

In my Starting MongoDB – The basics post, I explained how to create a cluster, set up a MongoDB database and connect using the Mongo Shell. Then in my recent MongoDB-Basics(Part 2) post, I talked about how to manipulate the database using Mongo Shell. Today will be the next part of this series. We will be taking a look at how to connect to a MongoDB database using c#. For this, you need to have the MongoDB driver NuGet package installed. We will write a program using c# that performs all the CRUD operations on a MongoDB database. This program uses command line arguments to perform its functions.

(On a side note, I have tried to make my code as readable as possible by creating simple methods to perform all major functionalities. Moreover keeping code as simple and readable as possible is a good practice, so yeah.)

### Type definitions to be saved

My program is connected to a database named CustomersDB. It saves customers of type ‘Person’. This type is defined as follows

<a href="https://gist.github.com/AbhinavPradeep/8d5793928031f631086f532b1b8ab49a">View this gist on GitHub</a>

A ‘Person’ is defined as having a ‘FirstName’, a ‘LastName’ and an instance of an ‘Address’. The address type is given below.

<a href="https://gist.github.com/AbhinavPradeep/8a04bfaed81e6e58ad5938535b6e7d5f">View this gist on GitHub</a>

The ‘Address’ class contains a string called “Country”, a string called “State”, a string called “Area”, a string called “Street” and an integer called “HouseNum”.

<a href="https://gist.github.com/AbhinavPradeep/5f7bee9566d0d1a51bc3e8420c7b9b5a">View this gist on GitHub</a>

Given above, we have the PersonFactory class. This class contains a method called CreatePerson which returns an object of type ‘Person’ with values assigned by the user.

Connecting to the Database
--------------------------

<a href="https://gist.github.com/AbhinavPradeep/4a01f653db71b9335191aab318e1a4f8">View this gist on GitHub</a>

First, we have the InitializeDatabase () method. This method returns a Collection object of type IMongoCollection<Person>. In this method, I connect to the MongoDB cluster using the MongoClient provided by the MongoDB driver. We connect to the CustomersDb database and the Customers collection using the GetDatabase() and the GetCollection() methods respectively.

Adding a document
-----------------

<a href="https://gist.github.com/AbhinavPradeep/a379675060ec3effba8c2adc964a64b1">View this gist on GitHub</a>

Here we have the AddCustomer() method. This method returns a void. The method itself is a loop. In this method, we call our PersonFactory() method. The PersonFactory() method returns an object of type Person. This object is then inserted into the database using the InsertOne() method

Finding a Document
------------------

<a href="https://gist.github.com/AbhinavPradeep/ca8b44c72bf50e1204f15d74e28b8601">View this gist on GitHub</a>

Given above is the FindCustomer() method. This method lets you perform a very simple query using the customers \_id. An array called persons is created using the Find method. The Find method searches the collection for an object of type Person. It matches the entered \_id with the \_id’s present in the collection. Once the desired document found, it is stored in the persons array. Since it is an array, printing out the result becomes slightly tricky, but using the foreach loop fixes things.

<a href="https://gist.github.com/AbhinavPradeep/65bcd278275cbef084f1413d6d0d034a">View this gist on GitHub</a>

To print out our results in the console, I created a method called PrintPerson(). PrintPerson is just a whole bunch of console.writelines().

Deleting a Document
-------------------

<a href="https://gist.github.com/AbhinavPradeep/60c0793a51ae4057a4770bf46013de7f">View this gist on GitHub</a>

Above is the DeleteCustomer() method. This is a fairly simple method. This method uses the DeleteOne() method. The DeleteOne() method deletes a document of type Person from the collection. this is then verified by storing the result in a variable and having an if statement to print out ‘deleted’ if it is deleted in the console

Updating a document
-------------------

<a href="https://gist.github.com/AbhinavPradeep/c6f6f0065dac6ea73f281ae2bb5238f4">View this gist on GitHub</a>

The UpdateRename() method allows the user to update the fields present in the document. It is basically the $set command used in the Mongo Shell. First, a variable called update is created. The update variable specifies as to what kind of update is required. Then we call the UpdateOne() function. This Mongo Driver function allows you to add a filter as well as the update type. The filter is based on \_id and allows you to choose the document to be updated.

Main method
-----------

<a href="https://gist.github.com/AbhinavPradeep/ddfc9ec015ea2d753985a6daaa13f708">View this gist on GitHub</a>

Then we have our main() method. The main() method basically is a massive if statement. Depending upon the arguments different methods are called as part of our if statement.

> _“Learning is the only thing the mind never exhausts, never fears, and never regrets.”_
> 
> **Leonardo da Vici**