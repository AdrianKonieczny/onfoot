# ON FOOT - Sales Application
Sales platform.

## General info
The reason for creating this project is to show my skills in each scope of knowledge: Apex, Triggers, Batch, LWC, Custom Metadata and Flows.

## Screenshot
![screenonfoot](https://user-images.githubusercontent.com/117930022/219877893-5da6425a-068c-4f97-abcf-df27f8a9b313.png)
## Database diagram

## Funcionalities
- Clickable preview of all available ON FOOT Products. After choosing a Product the component displays its Name, PriceBook, Description, Categories and Picture. (Lightning Web Component)
- Automatically assigns an appropriate Coupon to an Account which Customer Status is set to "Silver" or "Gold" while a new Product is inserted. ***Tools used: Junction Object, Test Factory.*** (Batch)
- Automatically checks "Security Code" field while creating a Case. If the Security Code exists, the field "State" on Case is being filled with the appropriate value (assigned to Security Code) and if it does not exist, an error popps out. ***Tools used: Custom Metadata, Trigger Handler, Test Factory.*** (Trigger and Custom Metadata)
- Automatically counts Contacts assigned to Account and writes the number in "Contact Count" field. ***Tools used: Trigger Handler, Test Factory.*** (Trigger)
- Automatically creates a Meeting after selecting "Requires Meeting" checkbox on Contact. Meeting date is set to 7 days after this action. ***Tools used: Formula, Flow Builder.*** (Flow Trigger)
- Possibility to create in a fast way a new product or case straight from home page of ON FOOT. ***Tools used: Flow Builder.*** (Screen Flows)


