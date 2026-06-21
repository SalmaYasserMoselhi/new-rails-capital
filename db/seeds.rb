# Clear existing data so the seeds can be run again without duplicating records
PostEditor.destroy_all
Post.destroy_all
Editor.destroy_all
User.destroy_all

# Users (each user is the creator of their posts)
alice = User.create!(name: "Alice Hassan", dob: "1995-04-10", email: "alice@example.com", phone_number: "01000000001")
bob   = User.create!(name: "Bob Samir", dob: "1992-08-22", email: "bob@example.com", phone_number: "01000000002")

# Editors
mark = Editor.create!(name: "Mark")
sara = Editor.create!(name: "Sara")

# Posts created by users (User 1:M Post)
post1 = alice.posts.create!(title: "Getting Started with Rails", content: "My first post")
post2 = bob.posts.create!(title: "Working with Associations", content: "My second post")

# Editors assigned to posts (Post M:M Editor)
post1.editors << [mark, sara]
post2.editors << mark
