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
![video_do_gifa_final_AdobeExpress](https://user-images.githubusercontent.com/117930022/221018192-86813267-2ba0-48b9-bc1b-03b13e7d853e.gif)

## Database diagram


## Funcionalities
- Clickable preview of all available ON FOOT Products. After choosing a Product the component displays its Name, PriceBook, Description, Categories and Picture. (Lightning Web Component)
- Automatically assigns an appropriate Coupon to an Account which Customer Status is set to "Silver" or "Gold" while a new Product is inserted. ${\color{green}Tools\  used: Junction\ Object,\ Test\ Factory,\ Batch}$
- Automatically checks "Security Code" field while creating a Case. If the Security Code exists, the field "State" on Case is being filled with the appropriate value (assigned to Security Code) and if it does not exist, an error popps out. ${\color{green}Tools\ used: Custom\ Metadata,\ Trigger\ Handler,\ Test\ Factory,\ Trigger}$ 
- Automatically counts Contacts assigned to Account and writes the number in "Contact Count" field. ${\color{green}Tools\ used:\ Trigger\ Handler,\ Test\ Factory,\ Trigger}$
- Automatically creates a Meeting after selecting "Requires Meeting" checkbox on Contact. Meeting date is set to 7 days after this action. ${\color{green}Tools\ used:\ Formula,\ Flow\ Builder,\ Flow\ Trigger}$
- Possibility to create in a fast way a new product or case straight from home page of ON FOOT. ${\color{green}Tools\ used:\ Flow\ Builder,\ Screen\ Flow}$

## Contact
- Check out my profile on: [Trailblazer.me](https://trailblazer.me/id/akonieczny4), [LinkedIn](https://www.linkedin.com/in/adrian-konieczny-296b11265/)
- Email: adriankon@outlook.com

${\color{green}}$

