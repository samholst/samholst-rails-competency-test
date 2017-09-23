@normal_user = User.create!(first_name: "Sam",
                            last_name: "Holst",
                            email: "user@test.com",
                            password: "asdfasdf",
                            password_confirmation: "asdfasdf",
                            )
puts "One normal user created"

@editor_user = EditorUser.create!(first_name: "Editor",
                          last_name: "User",
                          email: "editoruser@test.com",
                          password: "asdfasdf",
                          password_confirmation: "asdfasdf",
                          roles: "editor"
                          )
puts "One editor user created"

@editor_user_2 = EditorUser.create!(first_name: "Editor_2",
                          last_name: "User_2",
                          email: "editoruser2@test.com",
                          password: "asdfasdf",
                          password_confirmation: "asdfasdf",
                          roles: "editor"
                          )
puts "Second editor user created"

@admin_user = AdminUser.create!(first_name: "Admin",
                            last_name: "User",
                            email: "adminuser@test.com",
                            password: "asdfasdf",
                            password_confirmation: "asdfasdf",
                            roles: "admin"
                            )
puts "One admin user created"


3.times do |games|
  Article.create!(title: "Games My test #{games}",
                  content: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                  category: "Games",
                  user_id: @editor_user.id
                  )
end
puts "3 editor user game articles created"

3.times do |cars|
  Article.create!(title: "Cars My test #{cars}",
                  content: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
                  category: "Cars",
                  user_id: @editor_user.id
                  )
end
puts "3 editor user car articles created"

3.times do |ruby|
  Article.create!(title: "Ruby My test #{ruby}",
                  content: "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish.",
                  category: "Ruby",
                  user_id: @editor_user.id
                  )
end
puts "3 editor user ruby articles created"

3.times do |hackers|
  Article.create!(title: "Ruby My test #{hackers}",
                  content: "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish.",
                  category: "Hackers",
                  user_id: @editor_user_2.id
                  )
end
puts "3 editor user hacker articles created"

# AdminUser.create!(first_name: "Admin",last_name: "User",email: "adminuser@test.com",password: "asdfasdf",password_confirmation: "asdfasdf",roles: "admin_user")
