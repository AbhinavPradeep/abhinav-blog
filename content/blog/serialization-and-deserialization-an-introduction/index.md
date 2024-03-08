---
title: 'Serialization and Deserialization – An Introduction'
date: Thu, 16 Jan 2020 13:31:15 +0000
draft: false
tags: ['C#']
---

Yesterday night was horrible. I could not get a good nights sleep at all. First, there was a lizard in the room. Then, chasing the lizard came a huntsman spider. I freaked out. I may or may not have also shrieked like a little girl – but that’s not the topic of discussion. After my dad caught the spider in a box and threw it out, I decided to go to sleep. Oh but that wasn’t even the end of my troubles. An hour or so later, I woke up again. This time, I heard a loud shriek. I got up to check on what was happening. Turns out there was another huntsman on the room wall. I freaked out (°□°）. My dad then caught it and threw it out again. It was already 5 in the morning by this point so ¯\\\_(ツ)\_/¯ no point sleeping

So, stayed up reading a book. I love comics and especially Manga. I do some amount of sketching myself and hence appreciate the artwork. An hour passed and it was around 6:30 in the morning. My dad made coffee, which I drank, and then got to work on this. Today we will be taking a look at serializing and deserializing a c# object. So what does serializing and deserializing mean?

Serializing and Deserializing an Object
---------------------------------------

JSON is a format that encodes objects in a string. Serialization means to convert an object into that string, and deserialization is its inverse operation. When transmitting data or storing them in a file, the data are required to be byte strings, but complex objects are seldom in this format.

This ties into my post yesterday about MongoDB. Data is usually stored as JSON files in a NoSQL database. So now we are going to be making an Author.cs class which should contain all the fields which are required to define an author.

<a href="https://gist.github.com/AbhinavPradeep/d9606ee17af30551503a04b52208613a">View this gist on GitHub</a>

Notice in the code above that we are not describing what an ‘Address’ or ‘Book’ is. This is because I have created different classes in which I have defined those

Given below is the Address.cs class

<a href="https://gist.github.com/AbhinavPradeep/5f65953889a547622872f17bca962a0b">View this gist on GitHub</a>

In the Address.cs class, I have defined an address to have a string called Country, a string called State, a string called Street and an integer called HouseNum(house number)

Then we have the Book.cs class

<a href="https://gist.github.com/AbhinavPradeep/d11efa0cc16a87fb921d3e3edfbd38ca">View this gist on GitHub</a>

In the Book.cs class, I define the book as having BookName, Genre, and ISBNcode all of which are strings.

I am using the Factory method design as it allows for great flexibility. Hence, I have created an AuthorFactory.cs class.

<a href="https://gist.github.com/AbhinavPradeep/3e34c15cebffb6892bcb04a0fef87873">View this gist on GitHub</a>

This class includes a method called CreateAuthor which returns an Author object. Here, however, I have hardcoded values into the method. You can always make the method accept values from the console with some simple modification

(Note that here I have named the class AuthorFactory which is a noun and not a verb. It is a good practice to name a class using a noun and avoiding verbs. Only methods that are actions are named with verbs EX. – CreateAuthor)

Finally in the Program.cs class, I have included all the methods to serialize and deserialize the author object

<a href="https://gist.github.com/AbhinavPradeep/0b80306963918d6dadc141b99ef77128">View this gist on GitHub</a>

When serialized, a new JSON file will be created with the JSON equivalent of the object. When deserialized, the object will be returned to its c# equivalent. In this case, the serialized file will be called Mashasi.json

Now you hopefully have a better understanding of serializing and deserializing a c# object. I know that I'm not the best teacher, but hey ¯\\\_(ツ)\_/¯ I did try my best. There are some wonderful courses on pluralsight that I would highly recommend that you watch.

I'm sorry that this post came out late. WordPress had some issues in embedding my gists.

(BTW this is a repost of my original article. My original had to be nuked because of SSL issues )