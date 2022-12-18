# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  [
    {name: "ikeda", email:"ikeda@example.com"},
    {name: "john", email:"john@example.com"},
    {name: "satou", email:"satou@example.com"},
    {name: "ueda", email:"ueda@example.com"},
    {name: "nakatani", email:"nakatani@example.com"},
    {name: "kawamura", email:"kawamura@example.com"},
  ]
)

Team.create!(
  [
    {name: "ikedaチーム", owner_id: 1},
    {name: "johnチーム", owner_id: 2},
    {name: "satouチーム", owner_id: 3},
    {name: "uedaチーム", owner_id: 4},
    {name: "nakataniチーム", owner_id: 5},
    {name: "kawamuraチーム", owner_id: 6}
  ]
)

Song.create!(
  [
    {title: "tecno", team_id: 1},
    {title: "bossa", team_id: 2},
    {title: "hiphop", team_id: 3},
    {title: "house", team_id: 4},
    {title: "pops", team_id: 5},
    {title: "jazz", team_id: 6}
    }
  ]
)

Comment.create!(
  [
    {content: "ドラム追加求む",
    
      
    } 
  ]
)