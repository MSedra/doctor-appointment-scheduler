# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
cities = ["Cairo","Giza","Alexandria","Dakahlia","Red Sea","Beheira","Fayoum",
		"Gharbiya","Ismailia","Menofia","Minya","Qaliubiya","New Valley","Suez","Aswan",
		"Assiut","Beni Suef","Port Said","Damietta","Sharkia","South Sinai","Kafr Al-sheikh",
		"Matrouh","Luxor","Qena","North Sinai","Sohag"]		
specialities = ["Allergist","Cardiologist","Child psychiatrist","Dermatologist",
	"Endocrinologist","Gastroenterologist","Hematologist","Immunologist","Neuropsychiatrist",
	"Neurologist","Gynaecologist","Oncologist","Ophthalmologist","Orthopedist","Urologist",
	"Otorhinolaryngologist","Paediatrician","Pathologist","Pharmacologist","Psychiatrist",
	"Radiation Oncologist","Radiologist","Rheumatologist","Stomatologist","Venereologist"]


#num = [1,2,3,4,5]
#10.times do 
#	name = Faker::Name.name 
#	city = cities.sample
#	speciality = specialities.sample
#	price_per_visit = 100 * rand(1..5)
#	Doctor.create(name: name, city: city, speciality: speciality, price_per_visit: price_per_visit)	
#end	

def rand_time(from=Time.now+2.days, to=Time.now+20.days)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
  rand * (to - from) + from
end

doctors = Doctor.all 
doctors.each do |doctor|
	15.times do
		time = rand_time
		Appointment.create(doctor_id: doctor.id, starting_time: time, ending_time: time + 30.minute)
	end
end

