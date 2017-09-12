@normal_user = User.create!(first_name: "Sam",
                            last_name: "Holst",
                            email: "user@test.com",
                            password: "asdfasdf",
                            password_confirmation: "asdfasdf",
                            )
puts "One nomral user created"

@editor_user = EditorUser.create!(first_name: "Admin",
                          last_name: "User",
                          email: "editoruser@test.com",
                          password: "asdfasdf",
                          password_confirmation: "asdfasdf",
                          )
puts "One editor user created"

@admin_user = AdminUser.create!(first_name: "Admin",
                            last_name: "User",
                            email: "adminuser@test.com",
                            password: "asdfasdf",
                            password_confirmation: "asdfasdf",
                            )
puts "One admin user created"
