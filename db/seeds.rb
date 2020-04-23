# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
rd = User.new(id: 1, email: "rd@free.fr", password: "123456")
rd.save!
emmanuel = Patient.new( id: 1, prenom:"Emmanuel", nom: "Macron", age: 42, tel: 320228890, user: rd )
patrick = Patient.new( id: 2, prenom:"Patrick", nom: "Balkani", age: 72, tel: 247599044, user: rd )
emmanuel.save!
patrick.save!
rdv1 = Rdv.new( id: 1, examen: "radio", salle: 1, date_rdv: 4.days.since , patient: emmanuel)
rdv2 = Rdv.new( id: 2, examen: "echo", salle: 2, date_rdv: 3.days.since , patient: patrick)
rdv1.save!
rdv2.save!



