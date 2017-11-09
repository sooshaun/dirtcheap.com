# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Profile.create!(first_name: 'Kelvin', last_name: 'Rudd', bsb: '012515',account_number:'08880888',mobile_number:'0400880880',privacy:true, user_id: 2)
barack = Profile.create!(first_name: 'Barack', last_name: 'Obama', bsb: '214400',account_number:'08880888',mobile_number:'0400880880',privacy:true, user_id: 3)
arnold = Profile.create!(first_name: 'Arnold ', last_name: 'Schwarzeneggers', bsb: '062903',account_number:'08880888',mobile_number:'0400880880',privacy:true, user_id: 4)
elise = Profile.create!(first_name: 'Elise', last_name: 'Worthington', bsb: '18222',account_number:'08880888',mobile_number:'0400880880',privacy:true, user_id: 5)
julia = Profile.create!(first_name: 'Julia', last_name: 'Gillard', bsb: '032712',account_number:'08880888',mobile_number:'0400880880',privacy:true, user_id: 6)
angelina = Profile.create!(first_name: 'Angelina', last_name: 'Jolie', bsb: '082580',account_number:'08880888',mobile_number:'0400880880',privacy:true, user_id: 7)

# User.create!(username: 'Kelvin#123', email: 'kelvin@testing.com',password:'passWord&123')
# User.create!(username: 'Barack#123', email: 'obama@testing.com', password:'passWord&123')
# User.create!(username: 'Arnold#123', email: 'schwarzeneggers@testing.com', password:'passWord&123')
# User.create!(username: 'Elise#123', email: 'worthington@testing.com', password:'passWord&123')
# User.create!(username: 'Julia#123', email: 'gillard@testing.com', password:'passWord&123')
# User.create!(username: 'Angelina#123', email: 'jolie@testing.com', password:'passWord&123')
Jack#123   jack@testing.com
Wills#123 smith@testing.com
