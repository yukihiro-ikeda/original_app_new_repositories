FactoryBot.define do
  factory :user do
    email { 'adminuser@example.com' }
    password { 'adminpass' }
    password_confirmation { 'adminpass' }
    admin {'true'}
    # after(:create) do |user|
    #   create_list(:assign, 1, user: user, team: create(:team))
    # end   
  end

  factory :second_user, class: User do
    email { 'user@example.com' }
    password { 'user1pass' }
    password_confirmation { 'user1pass' }
    admin {'false'} 
    # after(:create) do |user|
    #   create_list(:assign, 1, user: user, team: create(:team))
    # end   
  end
end
