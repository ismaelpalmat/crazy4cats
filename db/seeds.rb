# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do
  user = User.create(
    username: Faker::Internet.username, 
    email: Faker::Internet.email, 
    password: "password"
  )

  5.times do
    post = user.posts.create(content: Faker::Lorem.paragraph)

    3.times do
      # Si el comentario es anónimo, no asignamos un usuario.
      user_for_comment = [user, nil].sample # Esto es correcto si el campo `user_id` permite `nil`
      post.comments.create(
        content: Faker::Lorem.sentence,
        user: user_for_comment,
        anonymous: [true, false].sample
      )
    end
  end
end
