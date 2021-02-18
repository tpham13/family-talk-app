# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# widstrom = Group.create(name: "widstrom")
# ko = Group.create(name: "ko")

# thanh = User.create(name: "thanh", username: "thanhp", password: "1234", group_id: 1)
# ngan = User.create(name: "ngan", username: "ngank", password: "1234", group_id: 2)

# post1 = Post.create(content: "got a cat", user_id: 1)
# post2 = Post.create(content: "got a dog", user_id: 2)

comment1 = Comment.create(content: "cute cat!", post_id: 1, user_id: 2)
comment2 = Comment.create(content: "cute dog!", post_id: 2, user_id: 1)

