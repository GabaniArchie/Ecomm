require 'faker'

# Destroy existing records (Optional, if you want a fresh start)
Product.destroy_all
User.destroy_all
Order.destroy_all
OrderItem.destroy_all
Contact.destroy_all
Home.destroy_all  # Ensures no existing Home record exists

# Create categories
5.times do
  Category.create(name: Faker::Commerce.department)
end
puts("Categories created")

# Create products
60.times do
  p = Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 50..300.0, as_string: true),
    category_id: Category.pluck(:id).sample,
    sale: [true, false].sample
  )
  puts("Created product: #{p.name}")
end

puts("Products created")

# Create users
5.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',              # Devise will automatically handle encryption
    password_confirmation: 'password'  # Confirmation matches
  )
  puts("Created user: #{user.name}")
end

puts("Users created")

# Create orders
5.times do
  user = User.all.sample  # Choose a random user
  order = user.orders.create(total_price: 0)  # Create the order for the user

  # Ensure the order is saved before adding order items
  if order.save
    3.times do
      product = Product.all.sample
      quantity = Faker::Number.between(from: 1, to: 5)
      order_item = order.order_items.create(product_id: product.id, quantity: quantity)
      order.total_price += (product.price.to_f * quantity)
    end
    order.save  # Save the order again after adding the order items
  else
    puts "Failed to save order for user: #{user.name}"
  end
  puts("Created order for user: #{user.name}")
end


# Create home record with id = 1
Home.create!(
  heading: 'Welcome to Simple Goods',
  message_one: 'We offer a wide range of handmade products.',
  message_one_heading: 'Explore our products',
  message_two: 'Our items are crafted with care.',
  message_two_heading: 'Quality you can trust',
  moto: 'Handmade with love and care'
)
puts("Home record created")

provinces = [
  'Alberta', 'British Columbia', 'Manitoba', 'New Brunswick', 
  'Newfoundland and Labrador', 'Nova Scotia', 'Ontario', 
  'Prince Edward Island', 'Quebec', 'Saskatchewan'
]

provinces.each do |province_name|
  Province.find_or_create_by!(name: province_name)
end