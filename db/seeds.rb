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
    { department: '薩摩営業部', staff: '島津貴久' },
    { department: '沼田営業部', staff: '真田幸隆' },
    { department: '土佐営業部', staff: '長宗我部国親' }
  ]
)

Matter.create(
  user_id: 1,
  sales_staff_id: 1,
  matter_name: '島津社へPCキッティング',
  matter_explain: '島津社のPC入れ替えに伴い、100台のパソコンキッティング案件。〇〇キッティングセンターで実施予定',
  product: 'キッティングサービス',
  sale_price: 30000,
  profit_price: 2222,
  sale_time: '2021-1-1',
  priority_id: 2,
  reliability_id: 6,
  progress_id: 4,
  occasion: '担当営業からの相談',
  updated_daytime: "2020-12-1 13:00:00"
)
Matter.create(
  user_id: 1,
  sales_staff_id: 2,
  matter_name: '真田社△△提案',
  matter_explain: '',
  product: '△△',
  sale_price: nil,
  profit_price: nil,
  sale_time: '2021-2-1',
  priority_id: 1,
  reliability_id: 4,
  progress_id: 5,
  occasion: 'ホームページからの問合せ',
  updated_daytime: "2020-12-1 13:00:00"
)
Matter.create(
  user_id: 1,
  sales_staff_id: 3,
  matter_name: '長宗我部社　××提案',
  matter_explain: '働き方改革の取り組みの一貫でリモートワークを検討中で××を提案',
  product: '××',
  sale_price: 30000,
  profit_price: 10000,
  sale_time: '2021-3-1',
  priority_id: 3,
  reliability_id: 4,
  progress_id: 4,
  occasion: '担当営業からの相談',
  updated_daytime: "2020-12-1 13:00:00"
)
Matter.create(
  user_id: 2,
  sales_staff_id: 1,
  matter_name: '島津社＃＃提案',
  matter_explain: '〇〇〇〇〇〇〇〇〇〇',
  product: '＃＃',
  sale_price: 30900,
  profit_price: 2000,
  sale_time: '2021-4-1',
  priority_id: 1,
  reliability_id: 1,
  progress_id: 2,
  occasion: '担当営業からの相談',
  updated_daytime: "2020-12-1 13:00:00"
)
Matter.create(
  user_id: 2,
  sales_staff_id: 2,
  matter_name: '書類電子化 真田社',
  matter_explain: '書類電子化の取り組み提案',
  product: 'OCRソリューション、プリンター',
  sale_price: 200000,
  profit_price: 40000,
  sale_time: '2021-5-1',
  priority_id: 1,
  reliability_id: 5,
  progress_id: 2,
  occasion: '担当営業からの相談',
  updated_daytime: "2020-12-1 13:00:00"
)
Matter.create(
  user_id: 2,
  sales_staff_id: 3,
  matter_name: 'RPA　長宗我部社への提案',
  matter_explain: '',
  product: 'RPAソフト',
  sale_price: nil,
  profit_price: nil,
  sale_time: '2021-6-1',
  priority_id: 3,
  reliability_id: 6,
  progress_id: 1,
  occasion: '担当営業からの相談',
  updated_daytime: "2020-12-1 13:00:00"
)
Matter.create(
  user_id: 3,
  sales_staff_id: 1,
  matter_name: 'RPA　島津社への提案',
  matter_explain: '',
  product: 'RPAソフト',
  sale_price: nil,
  profit_price: nil,
  sale_time: '2021-7-1',
  priority_id: 3,
  reliability_id: 4,
  progress_id: 4,
  occasion: '担当営業からの相談',
  updated_daytime: "2020-12-1 13:00:00"
)
Matter.create(
  user_id: 3,
  sales_staff_id: 2,
  matter_name: 'ディスプレイ真田社への提案',
  matter_explain: 'ディスプレイ販売',
  product: 'ディスプレイ',
  sale_price: nil,
  profit_price: nil,
  sale_time: '2021-8-1',
  priority_id: 2,
  reliability_id: 5,
  progress_id: 5,
  occasion: 'ホームページからの問合せ',
  updated_daytime: "2020-12-1 13:00:00"
)
Matter.create(
  user_id: 4,
  sales_staff_id: 3,
  matter_name: '長宗我部社へのAV機器提案',
  matter_explain: '長宗我部社の移転に伴いへAV機器を提案します',
  product: 'AV機器',
  sale_price: nil,
  profit_price: nil,
  sale_time: '2021-9-1',
  priority_id: 2,
  reliability_id: 3,
  progress_id: 2,
  occasion: '担当営業からの相談',
  updated_daytime: "2020-12-1 13:00:00"
)
Matter.create(
  user_id: 4,
  sales_staff_id: 1,
  matter_name: '島津社へPCキッティング',
  matter_explain: '尾張社のPC入れ替えに伴い、100台のパソコンキッティング案件\r\n',
  product: 'キッティングサービス',
  sale_price: 30000,
  profit_price: 2222,
  sale_time: '2021-10-1',
  priority_id: 2,
  reliability_id: 3,
  progress_id: 3,
  occasion: '担当営業からの相談',
  updated_daytime: "2020-12-1 13:00:00"
)

Client.create!(
  [
    { company: '島津株式会社', department: '薩摩部', name: '島津義久' },
    { company: '島津株式会社', department: '薩摩部', name: '島津義弘' },
    { company: '島津株式会社', department: '薩摩部', name: '島津歳久' },
    { company: '島津株式会社', department: '薩摩部', name: '島津家久' },
    { company: '島津株式会社', department: '薩摩部', name: '島津家久' },
    { company: '真田株式会社', department: '沼田部', name: '真田昌幸' },
    { company: '真田株式会社', department: '沼田部', name: '真田信之' },
    { company: '真田株式会社', department: '沼田部', name: '真田信繁' },
    { company: '真田株式会社', department: '沼田部', name: '真田昌幸' },
    { company: '長宗我部株式会社', department: '土佐部', name: '長宗我部元親' },
    { company: '長宗我部株式会社', department: '土佐部', name: '長宗我部信親' },
    { company: '長宗我部株式会社', department: '土佐部', name: '長宗我部盛親' }
  ]
)

10.times do |num|
  if (num + 1) % 3 == 1
    MatterClient.create(matter_id: "#{num+1}", client_id: 1)
    MatterClient.create(matter_id: "#{num+1}", client_id: 2)
    MatterClient.create(matter_id: "#{num+1}", client_id: 3)
    MatterClient.create(matter_id: "#{num+1}", client_id: 4)
  elsif (num + 1) % 3 == 2
    MatterClient.create(matter_id: "#{num+1}", client_id: 5)
    MatterClient.create(matter_id: "#{num+1}", client_id: 6)
    MatterClient.create(matter_id: "#{num+1}", client_id: 7)
    MatterClient.create(matter_id: "#{num+1}", client_id: 8)
  else
    MatterClient.create(matter_id: "#{num+1}", client_id: 9)
    MatterClient.create(matter_id: "#{num+1}", client_id: 10)
    MatterClient.create(matter_id: "#{num+1}", client_id: 11)
  end
end

3.times do |num|
  user_id = 1
  record1 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2020-12-1 13:00:00",
    end_time: "2020-12-1 14:00",
    explain: "担当営業と訪問し、先方の担当者（〇〇様）にご提案
              大きな課題は金額面で営業と調整が必要
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record2 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2020-12-8 13:00",
    end_time: "2020-12-8 13:00",
    explain: "担当営業と訪問し、先方の責任者（△△様）と先週お会いした（〇〇様）にご提案
              先週の持ち帰った事項をご説明
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record3 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2020-12-15 13:00",
    end_time: "2020-12-15 14:00",
    explain: "担当営業と訪問し、△△様、〇〇様に先週の持ち帰った事項のご説明と
              概算見積もりを提示
              その後、詳細な要件を打ち合わせ
              次回訪問時に正式見積もり、トライアル詳細を提示
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record4 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2020-12-22 13:00",
    end_time: "2020-12-22 14:00",
    explain: "担当営業と訪問し、△△様、〇〇様に正式見積もり提示
              金額は概ね問題が無いとのこと
              来週からトライアル開始
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record5 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2021-1-12 13:00",
    end_time: "2021-1-12 14:00",
    explain: "担当営業と訪問し、△△様、〇〇様に正式見積もり提示
              金額は概ね問題が無いとのことで社内で稟議にかけていただく
              来週からトライアル開始
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record6 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2021-1-26 13:00",
    end_time: "2021-1-26 14:00",
    explain: "担当営業と訪問し、△△様、〇〇様にトライアルのヒアリング
              トライアルの結果は良好で、社内稟議待ち
              トライアルは来週で終了を案内
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record7 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2021-2-2 13:00",
    end_time: "2021-2-2 14:00",
    explain: "担当営業から受注確定と連絡あり",
  )
  
  records = [record1,record2,record3,record4,record5,record6,record7]
  records.each do |record|
    file_num = rand(5)
    file_num.times do |i|
      record.files.attach(io: File.open('app/assets/files/sample1.rtf'), filename: 'sample1.rtf', content_type:'text/rtf')
    end
    record.save
  end
end

3.upto(5) do |num|
  user_id = 2
  record1 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2020-12-1 13:00:00",
    end_time: "2020-12-1 14:00",
    explain: "担当営業と訪問し、先方の担当者（〇〇様）にご提案
              大きな課題は金額面で営業と調整が必要
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record2 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2020-12-8 13:00",
    end_time: "2020-12-8 13:00",
    explain: "担当営業と訪問し、先方の責任者（△△様）と先週お会いした（〇〇様）にご提案
              先週の持ち帰った事項をご説明
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record3 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2020-12-15 13:00",
    end_time: "2020-12-15 14:00",
    explain: "担当営業と訪問し、△△様、〇〇様に先週の持ち帰った事項のご説明と
              概算見積もりを提示
              その後、詳細な要件を打ち合わせ
              次回訪問時に正式見積もり、トライアル詳細を提示
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  records = [record1,record2,record3]
  records.each do |record|
    file_num = rand(3)
    file_num.times do |i|
      record.files.attach(io: File.open('app/assets/files/sample1.rtf'), filename: 'sample1.rtf', content_type:'text/rtf')
    end
    record.save
  end
end

6.upto(7) do |num|
  user_id = 3
  record1 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2020-12-1 13:00:00",
    end_time: "2020-12-1 14:00",
    explain: "担当営業と訪問し、先方の担当者（〇〇様）にご提案
              大きな課題は金額面で営業と調整が必要
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record2 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2020-12-8 13:00",
    end_time: "2020-12-8 13:00",
    explain: "担当営業と訪問し、先方の責任者（△△様）と先週お会いした（〇〇様）にご提案
              先週の持ち帰った事項をご説明
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record3 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2020-12-15 13:00",
    end_time: "2020-12-15 14:00",
    explain: "担当営業と訪問し、△△様、〇〇様に先週の持ち帰った事項のご説明と
              概算見積もりを提示
              その後、詳細な要件を打ち合わせ
              次回訪問時に正式見積もり、トライアル詳細を提示
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record4 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2020-12-22 13:00",
    end_time: "2020-12-22 14:00",
    explain: "担当営業と訪問し、△△様、〇〇様に正式見積もり提示
              金額は概ね問題が無いとのこと
              来週からトライアル開始
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record5 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2021-1-12 13:00",
    end_time: "2021-1-12 14:00",
    explain: "担当営業と訪問し、△△様、〇〇様に正式見積もり提示
              金額は概ね問題が無いとのことで社内で稟議にかけていただく
              来週からトライアル開始
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record6 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2021-1-26 13:00",
    end_time: "2021-1-26 14:00",
    explain: "担当営業と訪問し、△△様、〇〇様にトライアルのヒアリング
              トライアルの結果は良好で、社内稟議待ち
              トライアルは来週で終了を案内
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record7 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2021-2-2 13:00",
    end_time: "2021-2-2 14:00",
    explain: "担当営業から受注確定と連絡あり",
  )
  
  records = [record1,record2,record3,record4,record5,record6,record7]
  records.each do |record|
    file_num = rand(5)
    file_num.times do |i|
      record.files.attach(io: File.open('app/assets/files/sample1.rtf'), filename: 'sample1.rtf', content_type:'text/rtf')
    end
    record.save
  end
end
8.upto(9) do |num|
  user_id = 4
  record1 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2020-12-1 13:00:00",
    end_time: "2020-12-1 14:00",
    explain: "担当営業と訪問し、先方の担当者（〇〇様）にご提案
              大きな課題は金額面で営業と調整が必要
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record2 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2020-12-8 13:00",
    end_time: "2020-12-8 13:00",
    explain: "担当営業と訪問し、先方の責任者（△△様）と先週お会いした（〇〇様）にご提案
              先週の持ち帰った事項をご説明
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  record3 = BusinessTalkRecord.create(
    user_id: user_id ,
    matter_id: "#{num+1}",
    start_time: "2020-12-15 13:00",
    end_time: "2020-12-15 14:00",
    explain: "担当営業と訪問し、△△様、〇〇様に先週の持ち帰った事項のご説明と
              概算見積もりを提示
              その後、詳細な要件を打ち合わせ
              次回訪問時に正式見積もり、トライアル詳細を提示
              以下、議事メモ
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇〇〇
              ・〇〇〇〇〇〇
              ・〇〇〇〇〇〇〇〇〇〇〇〇",
  )
  records = [record1,record2,record3]
  records.each do |record|
    file_num = rand(3)
    file_num.times do |i|
      record.files.attach(io: File.open('app/assets/files/sample1.rtf'), filename: 'sample1.rtf', content_type:'text/rtf')
    end
    record.save
  end
end