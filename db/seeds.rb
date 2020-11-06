takeda = User.create(family_name: '武田', first_name: '信玄', family_name_kana: 'タケダ', first_name_kana: 'シンゲン', administrator_id: 2, email: 'takeda@takeda.com', password: 'takeda1234', password_confirmation: 'takeda1234')
oda = User.create(family_name: '織田', first_name: '信長', family_name_kana: 'オダ', first_name_kana: 'ノブナガ', administrator_id: 2, email: 'oda@oda.com', password: 'oda1234', password_confirmation: 'oda1234')
toyotomi = User.create(family_name: '豊臣', first_name: '秀吉', family_name_kana: 'トヨトミ', first_name_kana: 'ヒデヨシ', administrator_id: 1, email: 'toyotomi@toyotomi.com', password: 'toyotomi1234', password_confirmation: 'toyotomi1234')
tokugawa = User.create(family_name: '徳川', first_name: '家康', family_name_kana: 'トクガワ', first_name_kana: 'イエヤス', administrator_id: 1, email: 'tokugawa@tokugawa.com', password: 'tokugawa1234', password_confirmation: 'tokugawa1234')

[takeda, oda, toyotomi, tokugawa].each do |user|
  user.user_image.attach(io: File.open('app/assets/images/sample1.png'), filename: 'sample1.png', content_type:'image/png')
  user.save
end


SalesStaff.create!(
  [
    { department: '美濃営業部', staff: '明智光秀' },
    { department: '近江営業部', staff: '石田三成' },
    { department: '出羽営業部', staff: '伊達政宗' },
    { department: '近江営業部', staff: '浅井長政' },
    { department: '近江営業部', staff: '石田三成' },
    { department: '薩摩営業部', staff: '島津義弘' },
    { department: '越前営業部', staff: '朝倉孝景' },
    { department: '近江営業部', staff: '蒲生氏郷' },
    { department: '安芸営業部', staff: '毛利元就' },
    { department: '近江営業部', staff: '滝川一益' }
  ]
)

Matter.create(
  user_id: 1,
  sales_staff_id: 1,
  matter_name: '土佐社へPCキッティング',
  matter_explain: '土佐社のPC入れ替えに伴い、100台のパソコンキッティング案件\r\n',
  product: 'キッティングサービス',
  sale_price: 30000,
  profit_price: 2222,
  sale_time: '2021-1-1',
  priority_id: 2,
  reliability_id: 6,
  progress_id: 4,
  occasion: '担当営業からの相談',
)
Matter.create(
  user_id: 1,
  sales_staff_id: 2,
  matter_name: '近江社△△提案',
  matter_explain: '',
  product: '△△',
  sale_price: nil,
  profit_price: nil,
  sale_time: '2021-2-1',
  priority_id: 1,
  reliability_id: 3,
  progress_id: 2,
  occasion: 'ホームページからの問合せ',
)
Matter.create(
  user_id: 1,
  sales_staff_id: 3,
  matter_name: '近江社　××提案',
  matter_explain: '働き方改革の取り組みの一貫でリモートワークを検討中で××を提案',
  product: '××',
  sale_price: 30000,
  profit_price: 10000,
  sale_time: '2021-3-1',
  priority_id: 3,
  reliability_id: 1,
  progress_id: 1,
  occasion: '担当営業からの相談',
)
Matter.create(
  user_id: 2,
  sales_staff_id: 4,
  matter_name: '蝦夷　＃＃提案',
  matter_explain: '〇〇〇〇〇〇〇〇〇〇',
  product: '＃＃',
  sale_price: 30900,
  profit_price: 2000,
  sale_time: '2021-4-1',
  priority_id: 2,
  reliability_id: 1,
  progress_id: 2,
  occasion: '担当営業からの相談',
)
Matter.create(
  user_id: 2,
  sales_staff_id: 5,
  matter_name: '書類電子化 尾張社',
  matter_explain: '書類電子化の取り組み提案',
  product: 'OCRソリューション、プリンター',
  sale_price: 200000,
  profit_price: 40000,
  sale_time: '2021-5-1',
  priority_id: 2,
  reliability_id: 3,
  progress_id: 2,
  occasion: '担当営業からの相談',
)
Matter.create(
  user_id: 2,
  sales_staff_id: 6,
  matter_name: 'RPA　尾張社への提案',
  matter_explain: 'RPA便利です',
  product: 'RPAソフト',
  sale_price: nil,
  profit_price: nil,
  sale_time: '2021-6-1',
  priority_id: 3,
  reliability_id: 2,
  progress_id: 2,
  occasion: '担当営業からの相談',
)
Matter.create(
  user_id: 3,
  sales_staff_id: 7,
  matter_name: 'RPA　尾張社への提案',
  matter_explain: 'RPA便利です',
  product: 'RPAソフト',
  sale_price: nil,
  profit_price: nil,
  sale_time: '2021-7-1',
  priority_id: 3,
  reliability_id: 2,
  progress_id: 2,
  occasion: '担当営業からの相談',
)
Matter.create(
  user_id: 3,
  sales_staff_id: 8,
  matter_name: 'ディスプレイ　三河社への提案',
  matter_explain: 'ディスプレイ販売',
  product: 'ディスプレイ',
  sale_price: nil,
  profit_price: nil,
  sale_time: '2021-8-1',
  priority_id: 2,
  reliability_id: 5,
  progress_id: 2,
  occasion: 'ホームページからの問合せ',
)
Matter.create(
  user_id: 4,
  sales_staff_id: 9,
  matter_name: '筑前社へのAV機器提案',
  matter_explain:
   '筑前社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案しますH社へAV機器を提案します',
  product: 'AV機器',
  sale_price: nil,
  profit_price: nil,
  sale_time: '2021-9-1',
  priority_id: 2,
  reliability_id: 3,
  progress_id: 2,
  occasion: '担当営業からの相談',
)
Matter.create(
  user_id: 4,
  sales_staff_id: 10,
  matter_name: '尾張社へPCキッティング',
  matter_explain: '尾張社のPC入れ替えに伴い、100台のパソコンキッティング案件\r\n',
  product: 'キッティングサービス',
  sale_price: 30000,
  profit_price: 2222,
  sale_time: '2021-10-1',
  priority_id: 2,
  reliability_id: 6,
  progress_id: 4,
  occasion: '担当営業からの相談',
)

Client.create!(
  [
    { company: '土佐株式会社', department: '土佐部', name: '長宗我部元親' },
    { company: '近江株式会社', department: '近江部', name: '藤堂高虎' },
    { company: '近江株式会社', department: '近江部', name: '大谷吉継' },
    { company: '蝦夷株式会社', department: '蝦夷部', name: '北条早雲' },
    { company: '尾張株式会社', department: '尾張部', name: '加藤清正' },
    { company: '尾張株式会社', department: '尾張部', name: '前田利家' },
    { company: '尾張株式会社', department: '尾張部', name: '柴田勝家' },
    { company: '三河株式会社', department: '三河部', name: '本多忠勝' },
    { company: '筑前株式会社', department: '筑前部', name: '立花宗茂' },
    { company: '尾張株式会社', department: '尾張部', name: '福島正則' }
  ]
)

10.times do |num1|
  10.times do |num2|
    MatterClient.create(matter_id: "#{num1+1}", client_id: "#{num2+1}" )
  end
end
