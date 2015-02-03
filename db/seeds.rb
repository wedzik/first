# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SuperAdmin.create!({email: 'wedzik@mail.ru', password: '111'})

Admin.create!({email: 'wedzik@ukr.net', password: '111', first_name: 'Wedzik', last_name: 'Wedzuna', age: 23})
Admin.create!({email: 'wedzik1@ukr.net', password: '111', first_name: 'ZSDG', last_name: 'Jisud', age: 32})
Admin.create!({email: 'wedzik2@ukr.net', password: '111', first_name: 'Tbcvb', last_name: 'DFG', age: 33})
Admin.create!({email: 'wedzik3@ukr.net', password: '111', first_name: 'Ldd fg ', last_name: 'Hdfgdf', age: 34})
Admin.create!({email: 'wedzik4@ukr.net', password: '111', first_name: 'Hgdfr', last_name: 'Ikjcdjnh', age: 12})
Admin.create!({email: 'wedzik5@ukr.net', password: '111', first_name: 'Pfdh', last_name: 'Qdss>', age: 43})
Admin.create!({email: 'wedzik6@ukr.net', password: '111', first_name: 'Qwsdef', last_name: 'Ased', age: 22})
Admin.create!({email: 'wedzik7@ukr.net', password: '111', first_name: 'Jjdjfg', last_name: 'Oosdfgd', age: 40})
Admin.create!({email: 'wedzik8@ukr.net', password: '111', first_name: 'Flggjghj', last_name: 'Pspdfrnb', age: 21})
Admin.create!({email: 'wedzik9@ukr.net', password: '111', first_name: 'Zsaad', last_name: 'Vvxcvsde', age: 17})

User.create!({email: 'wedzikmail@gmail.com', password: '111', first_name: 'Wedzik', last_name: 'Wedzuna', age: 30})
User.create!({email: 'wedzik1@gmail.com', password: '111', first_name: 'ZSDG', last_name: 'Jisud', age: 32})
User.create!({email: 'wedzik2@gmail.com', password: '111', first_name: 'Tbcvb', last_name: 'DFG', age: 33})
User.create!({email: 'wedzik3@gmail.com', password: '111', first_name: 'Ldd fg ', last_name: 'Hdfgdf', age: 34})
User.create!({email: 'wedzik4@gmail.com', password: '111', first_name: 'Hgdfr', last_name: 'Ikjcdjnh', age: 12})
User.create!({email: 'wedzik5@gmail.com', password: '111', first_name: 'Pfdh', last_name: 'Qdss>', age: 43})
User.create!({email: 'wedzik6@gmail.com', password: '111', first_name: 'Qwsdef', last_name: 'Ased', age: 22})
User.create!({email: 'wedzik7@gmail.com', password: '111', first_name: 'Jjdjfg', last_name: 'Oosdfgd', age: 40})
User.create!({email: 'wedzik8@gmail.com', password: '111', first_name: 'Flggjghj', last_name: 'Pspdfrnb', age: 21})
User.create!({email: 'wedzik9@gmail.com', password: '111', first_name: 'Zsaad', last_name: 'Vvxcvsde', age: 17})
User.create!({email: 'wedzik10@gmail.com', password: '111', first_name: 'Dgcvbcvbn', last_name: 'Bcvbcvb Jisud', age: 22})
User.create!({email: 'wedzik12@gmail.com', password: '111', first_name: 'Ldsywe', last_name: 'KfkghlopDFG', age: 34})
User.create!({email: 'wedzik13@gmail.com', password: '111', first_name: 'Wsdf v', last_name: 'BvbdfgerHdfgdf', age: 34})
User.create!({email: 'wedzik14@gmail.com', password: '111', first_name: 'sdf sfsf', last_name: 'fghyIkjcdjnh', age: 20})
User.create!({email: 'wedzik15@gmail.com', password: '111', first_name: 'Fsdf svxc', last_name: 'HgdfgrbQdss>', age: 53})
User.create!({email: 'wedzik16@gmail.com', password: '111', first_name: 'KJhbjc Qwsdef', last_name: 'WdgbnAsed', age: 78})
User.create!({email: 'wedzik17@gmail.com', password: '111', first_name: 'Wsdffjdjfg', last_name: 'Lopfdg Oosdfgd', age: 45})
User.create!({email: 'wedzik18@gmail.com', password: '111', first_name: 'Dfbvnvlggjghj', last_name: 'Qe dfgPspdfrnb', age: 11})
User.create!({email: 'wedzik19@gmail.com', password: '111', first_name: 'ZsaadWdfg cvb', last_name: 'Tbcvbcvb Vvxcvsde', age: 78})
User.create!({email: 'wedzik20@gmail.com', password: '111', first_name: 'AsdZsaad', last_name: 'Iidfgj dfgVvxcvsde', age: 31})


# id, email, password_hash, password_salt, first_name, last_name, age, created_at, updated_at, type
#'11', 'wedzik@mail.ru', '$2a$10$8.y5fDN3ff9.CLL1pPO3YelLvf0Y.ZJk5b/lzAKKhhy.tdOjUloqi', '$2a$10$8.y5fDN3ff9.CLL1pPO3Ye', NULL, NULL, NULL, '2015-01-24 18:22:15', '2015-01-24 18:22:15', 'SuperAdmin'