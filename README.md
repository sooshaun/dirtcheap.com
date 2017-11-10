# PROJECT NAME : DIRTCHEAP.COM
## Current Challenge : Property market is now expensive. Young family is facing lack of fund left to purchase household items to maintain a good lifestyle. While on the other side of the market, family's household income has increased over the time and want to purchase new household item.
## Solution : To recycle at a relatively low price of good condition household item (aged not more than 6 years) within 3 days

#### Model : User 
email: string
password: string
username: string

*making sure no duplicate records are detected for username and email*

*set up password complexity requirements*

has_one :profile

#### Model : Profile

- first_name: string            
- last_name: string
- bsb: string                   ==> as string as some number starts with 0
- account_number: string        ==> as string as some number starts with 0
- mobile_number: string         ==> as string as some number starts with 0
- privacy: boolean
- avatar: text                  ==> gem Shrine works well with text rather than string
- user: references

*making sure only one user_id / avatar_id is tagged to the User table / Photo table*

*making sure only one mobile number per user*

*making sure the privacy statement is acknowledged and agreed*

*making sure only one profile can be created*

*making sure no one can access my profile*

belongs_to :user

#### Model : House Item

- year_purchase: integer           
- description: text
- street_name: string
- postcode: string                  ==> as string as some number starts with 0
- state: string                     ==> 
- country: string                   ==> gem country_select to display country name and stored as country code
- transport_cost_cents: integer     ==> multiply by 100 and then convert the variable to integer in the model
- price_cents: integer              ==> multiply by 100 and then convert the variable to integer in the model
- item_image: references
- seller: references
- buyer: references

belongs_to :item_image, class_name: 'Photo'
belongs_to :seller, class_name: 'User'
belongs_to :buyer, class_name: 'User'To flag the incoming message and read message


#### Model : Photo
- image: string

has_many: house_items, dependent: :destroy
has_many: avatars, dependent: :destroy


#### Model : Review
- rating: integer               max of 5 thumb up
- comment: text
- user: references
- house_item: references

belongs_to :user
belongs_to :house_item


### **Internal Messaging**
#### Model : Message
- content: text
- sender: references

belongs_to :sender, class_name: 'User'


#### Model : Conversation
- house_item: references      <== the key is communicating about the item and not the user
- user1: references


#### Model : Support
- user: references

belongs_to :user

---

## Work Flow

![](app/assets/images/3.1-wireframe-sketch-work-flow.png)

## Database Diagram

![](app/assets/images/5-entity-relationship-diagram.png)

## Wireframes

![](app/assets/images/4-wireframe-low-fidelity.png)

---

## Trello Project Management Tool
source : https://trello.com/b/fp4LahXo/good-second-hand-household

---

## Deployment website
https://dirtcheap.herokuapp.com/


## Github



---

## Future Development
- Have the email function for payment confirmation
- Multiple images upload
- Algolia search function
- Two ways tokenisation
- Twilio email
- Flag item sold
- Flag incoming email and read remail
- CK editor

---