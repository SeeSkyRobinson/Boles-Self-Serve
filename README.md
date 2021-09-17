
https://boles.herokuapp.com

About The Project
Boles Self Serve Checkout

This CRUD app was created over three days as part of a Software Engineering course. It was an intense learning experience and the project evolved throughout the process. Originally conceived the app was meant to be a list building/formatting tool. However during the design process I kept needing to use real world examples like groceries or everyday items to describe the funcationality of the list builder. Eventually I decided it would be humorous and easier to make a Coles(Australian grocery store) Self Serve Checkout (a stand alone terminal for shoppers to select their items and pay for them without a cashier) inspired app.

The user can select quantities of an item and add it to their grocery list. This list displays the total price. User's can log in to store and delete their receipts. The UI is basic and only works on screens larger than tablets.

There are three databases. 1. The user database allowing users to create and log into and out of accounts (viewing or deleting their receipts if they wish). 2. The grocery database contains an image of each item, a price and appropriate type. 3. The receipt database contains information about the quantity of which items were selected.

Built With
Ruby
PSQL
JS, CSS, HTML 

Prerequisites
sinatra
PG
bCrypt
securerandom

Future directions

I would have liked to add a mock payment system. And tabs that group the grocery items based on their department information located in the database.

Thanks to DT and Kasun - massive legends who helped get this project working.




