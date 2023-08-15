User.create!(
  [
    {
      name: "ねこうち",
      email: "exam1@example.com",
      introduction: "こんにちは！これから色々と投稿していきたいと思います！よろしくお願いします。",
      password: "password1",
      image: File.open("./db/fixtures/images/test_user1.jpg"),
      role: 1,
    },
    {
      name: "サンシャイン",
      email: "exam2@example.com",
      introduction: "保護猫ボランティアをやっています。よろしくお願いします！！",
      password: "password2",
      image: File.open("./db/fixtures/images/test_user2.jpg"),
      role: 0,
    },
    {
      name: "コウ",
      email: "exam3@example.com",
      introduction: "猫を2匹飼ってます。よろしくお願いします。",
      password: "password3",
      image: File.open("./db/fixtures/images/test_user3.jpg"),
      role: 0,
    },
    {
      name: "もりたしゃちょー",
      email: "exam4@example.com",
      introduction: "猫の「会長」と「専務」が在籍しています。よろしくお願いします。",
      password: "password4",
      image: File.open("./db/fixtures/images/test_user4.jpg"),
      role: 0,
    },
    {
      name: "しょーこたん",
      email: "exam5@example.com",
      introduction: "No cat No lifeです！よろしくお願いします。",
      password: "password5",
      image: File.open("./db/fixtures/images/test_user5.jpg"),
      role: 0,
    },
  ],
)
