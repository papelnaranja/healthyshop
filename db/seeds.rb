# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





array_of_shop = [{
    name: 'Tienda 1',
    address:'Eliodoro Yañez 1081, Providencia, Región Metropolitana' ,
    description:Faker::Lorem.paragraph,
    latitude: -33.433812, 
    longitude: -70.620125,
    state:'published'

    },
    {
    name: 'Tienda 2',
    address:'Av. Manuel Montt 24, Providencia, Santiago, Región Metropolitana' ,
    description: Faker::Lorem.paragraph,
    latitude: -33.429014, 
    longitude: -70.619991,   
    state:'published'

    },
    {
    name: Faker::Company.name,
    address:'Av. Pedro de Valdivia 1638, Providencia, Región Metropolitana' ,
    description: Faker::Lorem.paragraph,
    latitude: -33.437412, 
    longitude: -70.607503,
    state:'published'

    },     
    {
    name: Faker::Company.name,
    address:'Av. Providencia 1220, Providencia, Región Metropolitana' ,
    description: Faker::Lorem.paragraph,
    latitude: -33.428898, 
    longitude: -70.621258,
    state:'published', 

    },
     {
    name: Faker::Company.name,
    address:'Almirante Pastene 92, Providencia, Región Metropolitana' ,
    description: Faker::Lorem.paragraph,
    latitude:-33.427678, 
    longitude: -70.619935,   
    state:'published'
    },
    {
    name: Faker::Company.name,
    address:'La Concepción 8, Providencia, Región Metropolitana' ,
    description: Faker::Lorem.paragraph,
    state:'published', 
    latitude:-33.425446,
    longitude: -70.614903,
    }     
    ]
    Shop.destroy_all
    array_of_shop.each do |shop|
        Shop.create(name: shop[:name],state:shop[:state], address: shop[:address], description:shop[:description], latitude: shop[:latitude], longitude: shop[:longitude] )
    end
    
    
    User.destroy_all
    User.create(name:'admin', lastname:'super', email:'admin@example.com',password:'12345678',role:'admin')
    10.times do |user| 
        User.create(name: Faker::Name.first_name , lastname:Faker::Name.last_name , password: 'Pass1010', email: "user-#{user}@example.com", role: 'client')
    end



