F1 = Food.create(name: "Spagetti bolognese",
                 description: "Yummy spagetti to increase your life span!",
                 price: 15)
                 
F2 = Food.create(name: "Steaks",
                 description: "Nice mix of african special barbecue sauce",
                 price: 7.5)

F3 = Food.create(name: "Lobsters",
                 description: "Crispy sea food delicacy to make your holiday",
                 price: 12)

F4 = Food.create(name: "Akara",
                 description: "Home made akara",
                 price: 5)

C1 = Category.create(title: "Entree",
                     description: "Home made food ready to eat")

C2 = Category.create(title: "Desserts",
                     description: "Finger-licking desserts")

U1 = User.create(first_name: "test1",
                 last_name: "test1",
                 email: "test1@test.com",
                 password: "parola1234",
                 password_confirmation: "parola1234")

U2 = User.create(first_name: "test2",
                 last_name: "test2",
                 email: "test2@test.com",
                 password: "parola1234",
                 password_confirmation: "parola1234")

A1 = User.create(first_name: "admin",
                 last_name: "test",
                 email: "admin@test.com",
                 password: "parola1234",
                 password_confirmation: "parola1234",
                 role: "admin")

O1 = Order.create(payment_status: "Completed", txn_id: "123ss1", user_id: U1.id)
O2 = Order.create(payment_status: "Cancelled", txn_id: "123ss2", user_id: U1.id)
O3 = Order.create(payment_status: "Processing", txn_id: "123ss3", user_id: U1.id)
O4 = Order.create(payment_status: "Processing", txn_id: "123ss4", user_id: U1.id)

Order_Item1 = OrderItem.create(quantity: 3, food_id: F1.id, order_id: 1)
Order_Item2 = OrderItem.create(quantity: 2, food_id: F2.id, order_id: 1)
Order_Item3 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 1)
Order_Item4 = OrderItem.create(quantity: 4, food_id: F3.id, order_id: 2)
Order_Item5 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 2)
Order_Item6 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 3)
Order_Item7 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 3)
Order_Item8 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 3)
Order_Item9 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 4)
Order_Item10 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 4)
Order_Item11 = OrderItem.create(quantity: 5, food_id: F3.id, order_id: 4)

C1.foods << F1
C1.foods << F2
C2.foods << F3

