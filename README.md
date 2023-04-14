# ON FOOT - Sales Application
Salesforce Sales Cloud application.

## General info
The reason for creating this project is to show my skills in each scope of knowledge: Apex, Triggers, Batch, LWC, Custom Metadata and Flows.

## Table of contents
- [General info](#general-info)
- [Screenshot](#screenshot)
- [Database Diagram](#database-diagram)
- [Funcionalities](#funcionalities)
- [Contact](#contact)

## Screenshot
![screenonfoot](https://user-images.githubusercontent.com/117930022/219877893-5da6425a-068c-4f97-abcf-df27f8a9b313.png)
![gigigif_AdobeExpress_AdobeExpress](https://user-images.githubusercontent.com/117930022/221020748-b2255c42-9659-4931-94e7-8352a63f96cf.gif)

## Database diagram
![image](https://user-images.githubusercontent.com/117930022/222572819-0b49aa18-f453-4f9b-944d-616dc0108601.png)

## Funcionalities
- Clickable preview of all available ON FOOT Products. After choosing a Product the component displays its Name, PriceBook, Description, Categories and Picture. (Lightning Web Component)
- Automatically assigns an appropriate Coupon to an Account which Customer Status is set to "Silver" or "Gold" while a new Product is inserted. ***Tools used: Junction Object, Test Factory, Batch***
- Automatically checks "Security Code" field while creating a Case. If the Security Code exists, the field "State" on Case is being filled with the appropriate value (assigned to Security Code) and if it does not exist, an error popps out. ***Tools used: Custom Metadata, Trigger Handler, TestFactory, Trigger***
- Automatically counts Contacts assigned to Account and writes the number in "Contact Count" field. ***Tools used: TriggerHandler, TestFactory, Trigger***
- Automatically creates a Meeting after selecting "Requires Meeting" checkbox on Contact. Meeting date is set to 7 days after this action. ***Tools used: Formula, Flow Builder, Flow Trigger***
- Possibility to create in a fast way a new product or case straight from home page of ON FOOT app. ***Tools used: Flow Builder, Screen Flow***
- Profiles: System Administrator (able to see every record and field), Junior System Administrator (cannot see contacts' phone numbers) 

## Contact
- Check out my profile on: [Trailblazer.me](https://trailblazer.me/id/akonieczny4), [LinkedIn](https://www.linkedin.com/in/adrian-konieczny-296b11265/)
- Email: adriankon@outlook.com



