# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

PetApplication.destroy_all
Pet.destroy_all
Shelter.destroy_all
Application.destroy_all
User.destroy_all

shelter_1 = Shelter.create!(name: 'Eget Arcu', city: 'South Andrew', state: 'LA', rank: 1, foster_program: true)
shelter_2 = Shelter.create!(name: 'Sed Vulputate', city: 'Lake Skyefurt', state: 'TN', rank: 2, foster_program: true)
shelter_3 = Shelter.create!(name: 'Nulla Facilisi', city: 'Hilmaton', state: 'PA', rank: 3, foster_program: false)
shelter_4 = Shelter.create!(name: 'Pellentesque Nec', city: 'North Allan', state: 'UT', rank: 4, foster_program: false)

pet_1 = shelter_1.pets.create(name: 'Daisy', age: 1, breed: 'Irish Spaniel', adoptable: true)
pet_2 = shelter_1.pets.create(name: 'Rocky', age: 8, breed: 'Fox Terrier', adoptable: true)
pet_3 = shelter_1.pets.create(name: 'Missy', age: 9, breed: 'Shihtzu', adoptable: false)
pet_4 = shelter_2.pets.create(name: 'Charlie', age: 1, breed: 'Whippet', adoptable: true)
pet_5 = shelter_2.pets.create(name: 'Baby', age: 5, breed: 'Clumber', adoptable: false)
pet_6 = shelter_2.pets.create(name: 'Cocoa', age: 10, breed: 'St. Bernard', adoptable: true)
pet_8 = shelter_3.pets.create(name: 'Buddy', age: 6, breed: 'German Pointer', adoptable: true)
pet_9 = shelter_3.pets.create(name: 'Sugar', age: 9, breed: 'Australian Terrier', adoptable: true)
pet_10 = shelter_3.pets.create(name: 'Mia', age: 9, breed: 'Scottish Deerhound', adoptable: false)

user_1 = User.create!(username: 'mikejones', password: 'houston', password_confirmation: 'houston')

application_1 = user_1.applications.create(
  first_name: 'Mike',
  last_name: 'Jones',
  address: "146 Cinderella Cove",
  city: "South Micha",
  state: "LA",
  zip: "56073-1328",
  description: "Maiores quidem laudantium. Qui dicta quia. Incidunt natus similique. Veritatis quo quibusdam.",
  status: 2
)

application_2 = user_1.applications.create(
  first_name: 'Mike',
  last_name: 'Jones',
  address: "146 Cinderella Cove",
  city: "South Micha",
  state: "LA",
  zip: "56073-1328",
  description: "Similique porro tempora. In hic quia. Quasi non voluptatum. Odio culpa natus. Temporibus ipsa sit.",
  status: 1
)

application_3 = user_1.applications.create(
  first_name: 'Mike',
  last_name: 'Jones',
  address: "146 Cinderella Cove",
  city: "South Micha",
  state: "LA",
  zip: "56073-1328",
  description: "Dolores aspernatur voluptas. Sed accusamus illum. Illo eum quis. Tenetur dolores enim.",
  status: 0
)

application_4 = user_1.applications.create(
  first_name: 'Mike',
  last_name: 'Jones',
  address: "146 Cinderella Cove",
  city: "South Micha",
  state: "LA",
  zip: "56073-1328",
  description: "Dolores aspernatur voluptas. Sed accusamus illum. Illo eum quis. Tenetur dolores enim.",
  status: 3
)

PetApplication.create(pet: pet_1, application: application_1)
PetApplication.create(pet: pet_2, application: application_1)
PetApplication.create(pet: pet_1, application: application_2)
PetApplication.create(pet: pet_2, application: application_2)
PetApplication.create(pet: pet_3, application: application_2)
