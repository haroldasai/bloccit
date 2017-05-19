require 'random_data'

# Create Posts
50.times do
# #1
  Post.create!(
# #2
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end

puts "There are #{Post.count} posts in total before creating a unique post."
#Create a unique post
Post.find_or_create_by(
  title:  "Unique post",
  body:   "Unique body"
)

puts "There are #{Post.count} posts in total after creating a unique post."

posts = Post.all
 
# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "There are #{Comment.count} comments in total before creating a unique comment."
#Create a unique comment
upost = posts.find 51 
Comment.find_or_create_by(
  post:   upost,
  body:   "Unique body"
)

puts "There are #{Comment.count} comments in total after creating a unique comment."

#puts "Seed finished"

