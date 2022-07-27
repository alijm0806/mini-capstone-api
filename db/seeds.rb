# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

product = Product.new(name: "desk", price: 200, description: "something to put a computer on", image_url: "https://www.ikea.com/us/en/images/products/arkelstorp-desk-black__0735967_pe740301_s5.jpg?f=s")

product.save

product = Product.new(name: "chair", price: 50, description: "you sit on it", image_url: "https://m.media-amazon.com/images/I/81J5r9dANGL._SL1500_.jpg")

product.save

product = Product.new(name: "microphone", price: 10, description: "you speak into it", image_url: "https://cdn.dpamicrophones.com/media/images/microphones/dfacto/large/2028-vocal-microphone-1-lightgrey-bg.jpg?ext=.jpg")

product.save
