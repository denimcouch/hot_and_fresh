# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Bakery.destroy_all
Customer.destroy_all
Item.destroy_all
Recipe.destroy_all
Order.destroy_all

kraftsmen = Bakery.create(name: "Kraftsmen Baking", location: "Houston, TX")
wf = Bakery.create(name: "Whole Foods", location: "Austin, TX")
bm = Bakery.create(name: "Bread Man", location: "Houston, TX")
la_guad = Bakery.create(name: "La Guadalupana", location: "Houston, TX")

donut = Item.create(name: "glazed donut", price: 1)
croissant = Item.create(name: "croissant", price: 2)
cake = Item.create(name: "Tres Leches", price: 25)
concha = Item.create(name: "concha", price: 3)

alex = Customer.create(first_name: "Alex", last_name: "Mata", email: "alexmata@gmail.com", password: "Password1")
felipe = Customer.create(first_name: "Felipe", last_name: "Dolago", email: "felipe@gmail.com", password: "Password1")
joe = Customer.create(first_name: "Joe", last_name: "Burks", email: "joeburks@hotmail.com", password: "Password1")

5.times do 
    Recipe.create(item_id: Item.all.sample.id, bakery_id: Bakery.all.sample.id, ingredients: "sugar, flour, water, milk, yeast", cook_time: 60)
end

10.times do
    Order.create(customer_id: Customer.all.sample.id, item_id: Item.all.sample.id, bakery_id: Bakery.all.sample.id)
end


Recipe.create(item_id: concha.id, bakery_id: la_guad.id, ingredients: "sugar, flour, egg, water", cook_time: 30)

puts "Let's go get some donuts."