# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "destroy db"
Hero.destroy_all
Power.destroy_all
HeroPower.destroy_all

puts "seeding in progress..."

heroes = Hero.create([{name: "Clark Kent", super_name: "Superman"},
                        {name: "Tate Adam", super_name: "Black Adam"}, 
                        {name: "Peter Parker", super_name: "Spiderman"}
                    ])

powers = Power.create([{name: "Flight", description: "Ability to fly"},
                    {name: "Web shooter", description: "Ability to shoot webs from your wrists"}, 
                    {name: "Super strength", description: "Ability to lift heavy objects"},
                    {name: "Super speed", description: "Ability to cover surreal distance in a second"},
                    {name: "Super hearing", description: "Ability to hear sounds from long distance"}
                ])

HeroPower.create(strength: "Average", hero: heroes.second, power: powers.third)
HeroPower.create(strength: "Strong", hero: heroes.first, power: powers.third)
HeroPower.create(strength: "Strong", hero: heroes.first, power: powers.first)
HeroPower.create(strength: "Weak", hero: heroes.third, power: powers.first)
HeroPower.create(strength: "Strong", hero: heroes.third, power: powers.second)
HeroPower.create(strength: "Average", hero: heroes.third, power: powers.fourth)
HeroPower.create(strength: "Weak", hero: heroes.second, power: powers.fifth)

puts "seeding complete"
