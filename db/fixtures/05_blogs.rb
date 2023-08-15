blog1 =
  Blog.create!(
    title: "にゃんじの風邪との小さな闘い",
    content:
      "愛猫にゃんじが風邪をひいてしまいました。くしゃみと鼻水が続き、心配しましたが、獣医さんの治療で数日で回復。軽い病気でも、にゃんじの健康が一番。今では元気に駆け回る姿を見ると、小さな闘いも克服したんだなと感じます。",
    disease_name: "猫風邪",
    age_range: 3,
    user_id: 1,
    cat_id: 1,
  )

blog1.images.attach(io: File.open("./db/fixtures/images/blog1.jpg"), filename: "blog1.jpg")

blog2 =
  Blog.create!(
    title: "脱水症状",
    content:
      "我が家のにゃんじが暑い夏に脱水症状になりました。食欲がなくなり、元気がない様子に驚きと心配でいっぱい。獣医さんの指示通りに水分を摂らせ、涼しい場所で休ませました。数日後、にゃんじの元気が戻り、ほっと胸をなでおろしました。小さな体験から、愛猫の健康管理の大切さを学びました。",
    disease_name: "熱中症",
    age_range: 2,
    user_id: 1,
    cat_id: 1,
  )

blog2.images.attach(io: File.open("./db/fixtures/images/blog2.jpg"), filename: "blog2.jpg")

blog3 =
  Blog.create!(
    title: "お腹のトラブル",
    content:
      "愛猫にゃんじが急にお腹を壊してしまいました。嘔吐と下痢が続き、心配で眠れない日々。獣医さんの診察で消化不良が原因と判明し、特別食と薬を処方されました。短期間で回復し、にゃんじの元気な姿を見て安堵。ちょっとしたトラブルも、早めの対処が大切だと学びました。",
    disease_name: "消化不良",
    age_range: 2,
    user_id: 1,
    cat_id: 1,
  )

blog3.images.attach(io: File.open("./db/fixtures/images/blog3.jpg"), filename: "blog3.jpg")

blog4 =
  Blog.create!(
    title: "風神のちょっとした体調不良",
    content:
      "風神、我が家の愛猫。ある日、元気がなくなり食欲も低下。心配で獣医さんへ。診察の結果、軽い胃の不調がわかりました。特別な食事と安静が必要だと言われ、愛情を込めて看病。数日後、風神の元気が戻り、ほっと胸をなでおろしました。小さな病気でも、早めの対応が大切だと再認識しました。",
    disease_name: "胃腸炎",
    age_range: 1,
    user_id: 2,
    cat_id: 3,
  )

blog4.images.attach(io: File.open("./db/fixtures/images/blog4.jpg"), filename: "blog4.jpg")

blog5 =
  Blog.create!(
    title: "風神の熱との戦い",
    content:
      "風神、元気な猫だったが、ある日急に熱を出しました。鼻水やくしゃみも。獣医さんに相談すると、軽い風邪と診断。薬と安静を指示され、優しい看病を始めました。熱が下がるまでの数日間、風神の寝顔を見守りました。にもかかわらず、風神は食欲旺盛で、熱が下がった後もますます元気に。彼の強さと我が家の絆に感謝を込めて。",
    disease_name: "猫風邪",
    age_range: 2,
    user_id: 2,
    cat_id: 3,
  )

blog5.images.attach(io: File.open("./db/fixtures/images/blog5.jpg"), filename: "blog5.jpg")

blog6 =
  Blog.create!(
    title: "食欲減退！？",
    content:
      "雷神、我が家の愛猫。ある日、元気がなくなり食欲も減退。心配で獣医さんへ。診察の結果、軽い胃の不調が判明しました。特別な食事と安静が必要だと助言され、心を込めてケア。数日後、雷神の元気が戻り、ほっと胸を撫でおろしました。小さな病気でも、早めのケアと愛情が大切だと再認識しました。",
    disease_name: "胃腸炎",
    age_range: 2,
    user_id: 2,
    cat_id: 4,
  )

blog6.images.attach(io: File.open("./db/fixtures/images/blog6.jpg"), filename: "blog6.jpg")

blog7 =
  Blog.create!(
    title: "健康診断に行ってきました。",
    content:
      "雷神、健康診断の日。キャリーケースに入れ、緊張の面持ちで動物病院へ。体重測定や耳・目のチェック、心音の確認。少し緊張している様子もありましたが、先生と看護師さんの優しい声かけで安心。血液検査も行い、結果は問題なし。健康な日々が続くように、予防接種や健康管理のアドバイスをもらいました。雷神の健康を守るために、今後も気をつけてケアしていこうと思います。",
    age_range: 3,
    user_id: 2,
    cat_id: 4,
  )

blog7.images.attach(io: File.open("./db/fixtures/images/blog7.jpg"), filename: "blog7.jpg")

blog8 =
  Blog.create!(
    title: "体調不良",
    content:
      "我が家の猫、のえる。ある日、元気がなくなり食欲も減退。心配で獣医さんへ。診察の結果、軽い胃の不調がわかりました。特別な食事と薬を処方され、愛情をこめて看病。数日後、のえるの元気が戻り、ほっと胸をなでおろしました。小さな病気でも、早めの対応と愛情が大切だと再認識しました。のえるの笑顔が戻り、安心しました。",
    age_range: 4,
    user_id: 3,
    cat_id: 5,
  )

blog8.images.attach(io: File.open("./db/fixtures/images/blog8.jpg"), filename: "blog8.jpg")

blog9 =
  Blog.create!(
    title: "軽い結膜炎になってしまいました。",
    content:
      "愛猫クレア、ある日急に片目をこすり始め、充血している様子に心配。獣医さんに診てもらうと、軽い結膜炎と判明。目薬の処方と、目の清潔を保つことをアドバイスされました。クレアの協力のもと、毎日目薬を差してあげました。数日後、目の赤みが薄れ、クレアの元気な姿が戻りました。ちょっとした目のトラブルでも、早めの対応で元気を取り戻せることを学びました。",
    disease_name: "結膜炎",
    age_range: 2,
    user_id: 3,
    cat_id: 6,
  )

blog9.images.attach(io: File.open("./db/fixtures/images/blog9.jpg"), filename: "blog9.jpg")

blog10 =
  Blog.create!(
    title: "猫風邪",
    content:
      "我が家の猫、会長。ある寒い冬の日、くしゃみと鼻水が出て元気がなくなりました。心配し、獣医さんに連れて行くと、猫風邪と診断されました。薬と温かい場所で看病し、毎日優しく触れてあげました。数日後、くしゃみも鼻水も減り、会長の食欲と元気が戻ってきました。愛情とケアが重要であることを実感しました。会長の猫風邪は、家族みんなで協力して乗り越えました。",
    disease_name: "猫風邪",
    age_range: 1,
    user_id: 4,
    cat_id: 7,
  )

blog10.images.attach(io: File.open("./db/fixtures/images/blog10.jpg"), filename: "blog10.jpg")

blog11 =
  Blog.create!(
    title: "怪我からの回復",
    content:
      "ある日庭で遊んでいる最中に足を怪我しました。跛行と痛がる姿に心が痛みましたが、すぐに獣医さんへ。レントゲンで骨折はないとわかり、軽い捻挫とのこと。安静と痛み止めで看病。時間をかけて少しずつ回復し、会長の元気な走りが戻ってきました。怪我を通じて、愛猫の健康とケアの大切さを改めて感じました。会長の頑張りに敬意を。",
    disease_name: "捻挫",
    age_range: 2,
    user_id: 4,
    cat_id: 7,
  )

blog11.images.attach(io: File.open("./db/fixtures/images/blog11.jpg"), filename: "blog11.jpg")

blog12 =
  Blog.create!(
    title: "耳のトラブル",
    content:
      "我が家の猫、専務。ある日、片耳をひっかいていて痛そうでした。心配し、獣医さんに診てもらうと、耳の中に軽い感染症があると判明。薬と耳掃除の指導を受け、専務の耳を丁寧に清潔にしました。数日後、耳のかゆみが和らぎ、専務の機嫌も戻りました。耳の健康も大切なんだと再認識し、専務の小さな耳のトラブルを乗り越えました。",
    disease_name: "感染症",
    age_range: 1,
    user_id: 4,
    cat_id: 8,
  )

blog12.images.attach(io: File.open("./db/fixtures/images/blog12.jpg"), filename: "blog12.jpg")

blog13 =
  Blog.create!(
    title: "病院に行ってきました。",
    content:
      "愛猫ミルク、ある日お尻周りの皮膚がかゆそうになり、毛づくろいが増えました。心配し、獣医さんに相談。診察の結果、軽い皮膚炎と判明。薬の塗布とシャンプーで治療開始。優しいケアを通じて、ミルクも協力してくれました。数週間後、かゆみが軽減し、皮膚も良くなりました。ミルクとの絆を深めながら、小さな皮膚トラブルを乗り越えました。",
    disease_name: "皮膚炎",
    age_range: 1,
    user_id: 5,
    cat_id: 9,
  )

blog13.images.attach(io: File.open("./db/fixtures/images/blog13.jpg"), filename: "blog13.jpg")

blog14 =
  Blog.create!(
    title: "ミルクの毛艶",
    content:
      "愛猫ミルク、最近毛艶が悪くフケが出るように。心配し、獣医さんに相談。診察の結果、軽い皮膚の乾燥が原因とわかりました。専用のシャンプーやサプリメントを使ってケアを始めました。ミルクの協力のもと、毛艶が良くなりフケも減少。愛情とケアで、小さな悩みを解決してミルクの健康と美しい毛並みを保ちました。",
    age_range: 2,
    user_id: 5,
    cat_id: 9,
  )

blog14.images.attach(io: File.open("./db/fixtures/images/blog14.jpg"), filename: "blog14.jpg")
