# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

OrderItem.destroy_all
User.destroy_all
Order.destroy_all
Item.destroy_all

baby_food = "https://images-na.ssl-images-amazon.com/images/I/81HvMBTlnwL._SL1500_.jpg"
baby_crib = "https://cdn.shopify.com/s/files/1/0522/6912/1736/products/hcyi2jpkttetp3jek76u_f0b32709-d428-427e-9689-5880aca07c98_1512x.jpg?v=1611804458"
baby_toy = "https://www.mothermag.com/wp-content/uploads/2014/10/daruma.jpg"
baby_plush = "https://n.nordstrommedia.com/ImageGallery/store/product/Zoom/19/_107755159.jpg?h=365&w=240&dpr=2"
baby_diaper = "https://ae01.alicdn.com/kf/Ha57d94235d6b4783b9f7f9d45dfb24556/New-Arrival-Baby-Diaper-Ananbaby-Double-Row-Snaps-Pocket-Cloth-Nappies-Modern-Fashion-Diaper-With-Insert.jpg_640x640.jpg"
baby_formula = "https://pics.drugstore.com/prodimg/143866/900.jpg"

baby_collection = [baby_food, baby_crib, baby_toy, baby_plush, baby_diaper, baby_formula]

35.times do
    Item.create(name:Faker::Commerce.product_name, image:baby_collection.sample, description:Faker::Quote.most_interesting_man_in_the_world, price:Faker::Commerce.price(range: 0..10.0, as_string: true))
end

35.times do
    user = User.create(name:Faker::Name.name, email:Faker::Internet.email, password:Faker::Internet.password)

    1.times do
        Order.create(order_number:Faker::Number.leading_zero_number(digits: 10), purchased: false, user_id:user.id)
    end
    
    5.times do
        Order.create(order_number:Faker::Number.leading_zero_number(digits: 10), purchased: true, user_id:user.id)
    end

end

puts "Semillas Loaded"