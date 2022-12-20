FactoryBot.define do
  factory :user do
    email { 'adminuser@example.com' }
    password { 'adminpass' }
    password_confirmation { 'adminpass' }
    admin {'true'}   
  end

  factory :second_user do
    email { 'user@example.com' }
    password { 'user1pass' }
    password_confirmation { 'user1pass' }
    admin {'false'}   
  end
end
