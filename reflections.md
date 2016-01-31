#### Project Reflections :memo:
###### How long did you spend working on this project?
  I would say I spent about 6 hours spread out over two days.
###### What was the most rewarding challenge you conquered?
  I found the purchase feature interesting because it causes objects from different classes to interact, by triggering each other’s methods. It seems like a lot could be accomplished using this tactic. 
###### What two additional features did you build? Why?
  I added instance variables ‘sales’ and ‘revenue’ to Products. For each type of toy, the variables store the toy’s individual number of sales and revenue. I also expanded the purchase method to take an optional discount as an argument, which is then stored in the Transaction. Finally, I added to_s methods for Products, Customers, and Transactions, so that a puts call to any object displays its most relevant information. 
###### Where do you still have room to grow?
  I wanted to make one of my Product methods private, which decreases the stock, and is used when there is a purchase. However, I needed to call it in a Transaction method, so it couldn’t be private. I was considering ways to get around this limitation that I could use in the future, like requiring a password to be submitted as an argument before you can change the stock amount. 
