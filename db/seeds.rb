User.create!(
  [
    {name: "ikeda", email:"ikeda@example.com",password:"ikedaikeda"},
    {name: "john", email:"john@example.com",password:"johnjohn"},
    {name: "satou", email:"satou@example.com",password:"satousatou"},
    {name: "ueda", email:"ueda@example.com",password:"uedaueda"},
    {name: "nakatani", email:"nakatani@example.com",password:"nakatani"},
    {name: "kawamura", email:"kawamura@example.com",password:"kawamura"}
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
  ]
)

Comment.create!(
  [
    {content: "ドラム追加求む",  song_id: 1, user_id:1},
    {content: "ギター追加求む",  song_id: 2, user_id:2},
    {content: "ベース追加求む",  song_id: 3, user_id:3},
    {content: "シンセ追加求む",  song_id: 4, user_id:4},
    {content: "シンガー追加求む",  song_id: 5, user_id:5},
    {content: "歌詞追加求む",  song_id: 6, user_id:6}
  ]
)

Assign.create!(
  [
    {user_id: 1,  team_id: 1},
    {user_id: 2,  team_id: 2},
    {user_id: 3,  team_id: 3},
    {user_id: 4,  team_id: 4},
    {user_id: 5,  team_id: 5},
    {user_id: 6,  team_id: 6}
  ]
)