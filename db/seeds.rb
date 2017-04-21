# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "HI IM SEED"

Product.delete_all

Product.create(products_data = [
  {:title => "Menorah", :description => "great gift", :price => 50, :image =>"https://cdn4.iconfinder.com/data/icons/christianity-judaism/713/religion-religious_03-128.png"},
  {:title => "Candle", :description => "lovely stuff", :price => 15, :image =>"https://cdn4.iconfinder.com/data/icons/christianity-judaism/713/religion-religious_03-128.png"},
  {:title => "Challah board", :description => "Shabbat Shalom!", :price => 25, :image =>"https://cdn4.iconfinder.com/data/icons/christianity-judaism/713/religion-religious_03-128.png"}
  ])

User.delete_all

User.create(users_data = [
  {:username => "jesse", :password => "jesse"},
  {:username => "bob", :password => "bob"},
  {:username => "user", :password => "user"},
  {:username => "lamar", :password => "lamar"},
  {:username => "jean", :password => "jean"},
  {:username => "jim", :password => "jim"}


  ])



  Order.delete_all
  Order.create(orders_data=[
    {:items => "Menorah", :amount => 25, :image => "image", :user_id => 29, :quantity => 1}
    ])
