User.destroy_all
Snack.destroy_all
UsersSnack.destroy_all

user_1 = User.create!(username: 'Roald1991', first_name: 'Roald', last_name: 'Roaldington', email: 'RoaldRules91@Gmail.Com', password: 'PenguinsRule11', password_confirmation: 'PenguinsRule11')
user_2 = User.create!(username: 'Larry2020', first_name: 'Larry', last_name: 'Larryington', email: 'LarryRules91@Gmail.Com', password: 'PolarBearsRule11', password_confirmation: 'PolarBearsRule11')

snack_1 = Snack.create!(name: 'Funyuns', description: 'DELICIOUS', savory: true, sweet: false)
snack_2 = Snack.create!(name: 'Star Crunch', description: 'AMAZING', savory: false, sweet: true)
snack_3 = Snack.create!(name: 'Fruit by the Foot', description: 'INCREDIBLE', savory: false, sweet: true)

users_snack_1 = UsersSnack.create!(user_id: user_1.id, snack_id: snack_1.id)
users_snack_1 = UsersSnack.create!(user_id: user_1.id, snack_id: snack_2.id)
users_snack_1 = UsersSnack.create!(user_id: user_2.id, snack_id: snack_3.id)
