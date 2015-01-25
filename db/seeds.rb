# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SuperAdmin.create!({email: 'wedzik@mail.ru', password: '111'})

# id, email, password_hash, password_salt, first_name, last_name, age, created_at, updated_at, type
#'11', 'wedzik@mail.ru', '$2a$10$8.y5fDN3ff9.CLL1pPO3YelLvf0Y.ZJk5b/lzAKKhhy.tdOjUloqi', '$2a$10$8.y5fDN3ff9.CLL1pPO3Ye', NULL, NULL, NULL, '2015-01-24 18:22:15', '2015-01-24 18:22:15', 'SuperAdmin'