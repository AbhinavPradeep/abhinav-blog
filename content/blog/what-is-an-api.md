---
title: 'What is an API?'
date: Mon, 10 Feb 2020 12:14:07 +0000

draft: false
comments: true
toc: true
showToc: true
TocOpen: false

tags: ['.net core', 'API', 'C#', 'MongoDB', 'NOSQL']
---

Application Programming Interfaces ( API) have been around since the early days of IT. Today, API's are almost always synonymous with server-side web development. Earlier, API'S were built using technologies such as CORBA, XML-RPC, and SOAP. The Web has radically transformed the way we produce and share information. It has democratized information sharing and has revolutionized information creation and sharing. Nowadays, we have RESTful APIs. To learn more about REST see [here](https://pradeeploganathan.com/rest/)

### Tl;DR

An API is a specification of protocols, procedures, and services. We can use these as building blocks to implement the required functionality. A RESTful API is a web service from which an app can receive data. HTTP APIs form the backbone of nearly every website. A single or multiple APIs can be used together to form micro-services.

THETA.Customers.API
-------------------

Now we will look at some code that I wrote for thetalentbot.com. I work as an intern at thetalentbot. Theta is a startup in India. One of my first tasks was to clean up some Xunit unit tests (I might post about Xunit unit testing soon). Next, I had to create a customer's API. For this, I used ASP. Net core (obvious choice IMHO) and the MVC design. I am also using MongoDb as the persistence engine. I'm a big fan of MongoDB's simplicity and the fact that you get a free starter cluster. [Link to my MongoDB. Net driver post.](http://abhinavpradeep.com/blog/c/mongodb-net-driver/)

The structure
-------------

As part of my solution design, I created three different projects representing the different concerns of my API in a single solution. My project contains an API project which depends on a Repository project and a Model project. The API project is a public contract that clients of the API use. The repository project takes care of all persistence needs and abstracts it away from the API layer. It depends on the Model project. The Model project represents the serialized format of the document stored in MongoDB. Thus the API layer is abstracted away completely from persistence concerns by the repository and the model projects.

### Customers.Models

First, we have the Customer class where I model a very simple customer type. This type has a string FirstName, a string Last name an Address type. It also has an integer \_id as an identifier.

```csharp
namespace Theta.Customers.Models
{
    public class Customer
    {
        public int _id;
        public string FirstName;
        public string LastName;
        //public bool IsPremium;
        public Address Address;
    }
}
```

Then I have defined an Address class. The Address class contains strings - Country, State, Area, Street, and integer HouseNum.

```csharp
namespace Theta.Customers.Models
{
    public class Address
    {
        public string Country;
        public string State;
        public string Area;
        public string Street;
        public int HouseNum;
    }
}
```
### Customer.Repos

Given below is my MongoDB code. This class takes care of all persistence needs for the API primarily. It has methods to add, delete and get Customer documents from the MongoDB customer collection.

```csharp
using MongoDB.Driver;
using System.Collections.Generic;
using System.Linq;
using Theta.Customers.Models;


namespace Theta.Customers.Repository
{
    public class CustomerRepos
    {
        private string ConnectionString { get; set; }
        public CustomerRepos(string ConnectionString)
        {
            this.ConnectionString = ConnectionString;
        }

        private IMongoCollection<Customer> Initialize()
        {
            var client = new MongoClient(ConnectionString);
            var database = client.GetDatabase("CustomersDB");
            var collection = database.GetCollection<Customer>("Customers");
            return collection;
        }

        public List<Customer> GetCustomer(int customerID)
        {
            IMongoCollection<Customer> collection = Initialize();
            var Dbcustomer = collection.Find<Customer>(x => x._id == customerID);
            return Dbcustomer.ToList();
        }
        public List<Customer> GetAllCustomers()
        {
            IMongoCollection<Customer> collection = Initialize();
            var Dbcustomer = collection.Find(x => true);
            return Dbcustomer.ToList();
        }

        public long DeleteCustomer(int customerID)
        {
            IMongoCollection<Customer> collection = Initialize();
            var result = collection.DeleteOne<Customer>(x => x._id == customerID);
            return result.DeletedCount;
        }
    }
}
```

### Customers.API

The API layer is responsible for defining the API contract. This is done as a REST contract using the standard HTTP Get, HTTP Put, and HTTP Post verbs. These HTTP verbs are mapped to controller actions using method attributes as below.

```csharp
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using System.Collections.Generic;
using Theta.Customers.API.Configuration;
using Theta.Customers.Models;
using Theta.Customers.Repository;




namespace Theta.Customers.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CustomersController : ControllerBase
    {
        IOptions<CustomerSettings> settings;
        public CustomersController(IOptions<CustomerSettings> settings)
        {
            this.settings = settings;
        }

        [HttpGet]
        public JsonResult ListPeople()
        {
            CustomerRepos CustomerRepo = new CustomerRepos(settings.Value.ConnectionString);
            var customers = CustomerRepo.GetAllCustomers();
            return new JsonResult(customers);
            
        }

        [HttpGet("{personID}")]
        public List<Customer> ListCustomer(int customerID)
        {
            CustomerRepos CustomerRepo = new CustomerRepos(settings.Value.ConnectionString);
            var customer = CustomerRepo.GetCustomer(customerID);
            return customer;

        }
        [HttpDelete("{personID}")]
        public long DeleteCustomer(int customerID)
        {
            CustomerRepos CustomerRepo = new CustomerRepos(settings.Value.ConnectionString);
            var DeletedCount = CustomerRepo.DeleteCustomer(customerID);
            return DeletedCount;
        }

    }
}
```

This controller class implements the get, post and put methods It delegates these to the repository layer to retrieve , add and delete customers.