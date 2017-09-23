FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name 'Jon'
    last_name 'Snow'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end

  factory :editor_user, class: "EditorUser" do
    first_name 'Editor'
    last_name 'User'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    roles 'editor'
  end

  factory :editor_user_2, class: "EditorUser" do
    first_name 'Editor_2'
    last_name 'User_2'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    roles 'editor'
  end
end
