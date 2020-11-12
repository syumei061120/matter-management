# matter-management

# アプリケーション概要: 
  本アプリケーションは案件管理アプリケーションです。
  一般ユーザーは自身が登録した案件のみ編集が可能で、管理者ユーザーは全ての案件の編集と削除をすることができます。
  前職（フロントSE）では案件管理をエクセルで行っていたので、その時に欲しかったものというコンセプトでアプリケーションを作成しました。

# 機能一覧：

- ユーザー管理
  - ユーザー登録
  - ユーザー情報編集
  - ログイン
  - ログアウト
- 案件関連
  - 案件一覧表示機能
  - 案件登録機能
  - 案件詳細表示機能
  - 案件編集機能
  - 案件削除機能
  - 案件検索機能
- 案件に紐づく情報
  - 担当営業の登録/編集機能
  - 顧客の一覧表示/登録/編集/削除機能
  - 商談記録の一覧表示/登録/編集/削除機能

# 開発環境:
  Ruby / Ruby on Rails / MySQL / GitHub / Visual Studio Code / Trello

# 利用方法:
  - WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
    - ※ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
  - 接続先およびログイン情報については、上記の通りです
  - 同時に複数の方がログインしている場合に、ログインできない可能性があります。	
  - 案件登録方法
    - テスト用アカウント（管理者）でログイン→トップページから「案件登録」を押下→案件情報入力→顧客情報入力→担当営業情報入力→案件登録
  - ・案件検索
    - テストアカウント（管理者）でログイン→トップページから「案件検索」を押下→案件検索
  - 案件編集
	  - テストアカウント（管理者）でログイン→トップページから案件を選択→「案件編集」を押下→確認用モーダルウィンドウでOKを押下

# 目指した課題解決:
前職では案件をエクセルで管理しており、その中で感じていた以下の課題の解決を目指しました
  - 操作ミスによるデータの上書きや削除が発生し、誤ったデータのまま管理されてしまう
  - 入力が必須の項目が空欄になっているなど不整合があり、都度担当者に確認をとっていた
  - 商談など更新が重なるとシートが縦に長くなってしまい視認性が悪い

# 洗い出した要件:

| 機能           | 詳細                                              | ユースケース                                | 
| ------------- | ------------------------------------------------- | ----------------------------------------- |
| ユーザ管理機能 | ・deviseの機能を用いて実装する<br>・ユーザー登録/ログインログアウトができるようにする<br>・ユーザーアイコンを登録する| ・新規利用者はユーザー登録を行うことでTOPページにアクセスできる<br>・ログインはメールアドレスとパスワードで行う |
| ユーザ情報編集機能 | ・ユーザー自身の情報に変更が発生した場合に編集できる | ・マイページからユーザー情報の編集ができる |
| 案件一覧表示機能 | ・Topページに直近の更新案件10件表示できる | ・ページにアクセスすると直近の案件状況が把握できる  |
| 案件登録機能 | ・アプリケーションの画面に沿って情報を入力すると案件の登録ができる<br>・必須項目を全て入力していないと登録ができない | ・登録情報を入力すると案件テーブル、顧客テーブル、案件&顧客の中間テーブル、担当営業テーブルに登録<br>・新規顧客であれば中間テーブル、顧客テーブルに登録<br>・既存顧客であれば中間テーブルにのみ登録し、顧客テーブルには登録されない | 
| 案件詳細表示機能 | ・案件情報と紐づく担当営業情報や顧客情報、商談履歴が表示される | ・案件の一覧表示や検索結果から詳細ページにアクセスすることで登録された案件情報が参照できる | 
| 案件編集機能 | ・登録済みの案件情報を編集できる<br>・案件の登録者か管理者のみ編集可能<br>・登録済み案件の情報を編集できる | ・案件情報に変更が発生した場合、登録者か管理者のみ編集ができる | 
| 案件削除機能 | ・登録済みの案件を削除できる<br>・管理者のみ削除可能 | ・失注案件を削除できる | 
| 案件検索機能 | ・登録済みの案件を検索できる<br>・データの型に合わせて「キーワードとの部分一致」「チェックボックス」「プルダウン」で検索できる | ・案件テーブル、顧客テーブル、担当営業テーブルのカラムから検索が可能 |  
| 担当営業登録機能 | ・案件を新規登録する際にウィザード形式で登録画面に遷移して登録<br>別案件で登録済みであれば新規登録せずidを取得して案件に紐付ける | ・案件に紐づく担当営業情報を登録ができる |
| 担当営業編集機能 | ・登録済みの案件に紐づく担当営業情報を編集できる<br>・案件の登録者か管理者のみ編集可能<br>・編集前の担当営業情報は他の案件と紐づいていなければ削除し、編集後の情報を新規登録 | ・担当営業が変更になった際に、案件詳細ページから担当営業を変更できる |
| 顧客一覧表示機能 | ・案件に紐づく顧客情報の一覧を表示できる | ・案件詳細ページから紐づく顧客情報を全て参照できる|
| 顧客登録機能 | ・案件を新規登録する際にウィザード形式で登録画面に遷移して登録<br>・追加は案件詳細ページから登録可能<br>別案件で登録済みであれば新規登録せずidを取得して案件に紐付ける | ・案件に紐づく顧客情報を登録/追加できる|
| 顧客編集機能 | ・登録済みの案件に紐づく顧客情報を編集できる<br>・案件の登録者か管理者のみ編集可能<br>・編集前の顧客情報は他の案件と紐づいていなければカラムを削除し、編集後の情報を新規登録 | ・組織変更等で顧客情報が変更になった際に、案件詳細ページから顧客情報を編集できる |
| 顧客削除機能 | ・登録済みの案件に紐づく顧客情報を削除できる<br>・案件の登録者か管理者のみ削除可能<br>・顧客情報は他の案件と紐づいていなければカラムを削除<br>・紐づく顧客情報が0名になる場合は削除できない | ・顧客の担当者変更などで案件に紐づける必要がない情報を削除できる |
| 商談一覧表示機能 | ・案件に紐づく商談情報の一覧を表示できる | ・案件詳細ページから紐づく客商談情報を全て参照できる|
| 商談記録登録機能 | ・登録済みの案件に紐づく商談情報（日時・商談内容・資料）を登録できる<br>・案件の登録者か管理者のみ登録可能 | ・商談実施後に商談の内容や使用した資料を登録することで組織で進捗を共有できる |
| 商談記録編集機能 | ・登録済みの案件に紐づく商談情報（日時・商談内容・資料）を編集できる<br>・案件の登録者か管理者のみ編集可能 | ・登録済みの商談履歴の情報を修正できる |
| 商談記録削除機能 | ・登録済みの案件に紐づく商談を削除できる<br>・案件の登録者か管理者のみ削除可能 | ・登録済みの商談履歴を削除できる |

# 実装予定の機能
・案件集計機能
・案件引継ぎ機能
・ユーザー削除機能
・パスワード変更機能
・管理者向けユーザー管理機能

# データベース設計

## usersテーブル

| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| family_name           | string     | null: false                     |
| first_name            | string     | null: false                     |
| family_name_kana      | string     | null: false                     |
| first_name_kana       | string     | null: false                     |
| email                 | string     | null: false                     |
| password              | string     | null: false                     |
| administrator_id      | int        |                                 |

### Association

- has_many :matters
- has_many :business_talk_records

## mattersテーブル

| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| user                  | references | null: false, foreign_key: true  |
| sales_staff           | references | null: false, foreign_key: true  |
| matter_name           | string     | null: false                     |
| matter_explain        | text       |                                 |
| product               | string     | null: false                     |
| sale_price            | int        |                                 |
| profit_price          | int        |                                 |
| sale_time             | date       |                                 |
| priority_id           | int        | null: false                     |
| reliability_id        | int        | null: false                     |
| progress_id           | int        | null: false                     |
| occasion              | string     | null: false                     |
| updated_daytime       | datetime   | null: false                     |


### Association

- belongs_to  :user
- has_many    :clients, through: matter_clients
- has_many    :business_talks_records
- belongs_to  :sales_staff

## business_talk_recordsテーブル

| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| user                  | references | null: false, foreign_key: true  |
| matter                | references | null: false, foreign_key: true  |
| start_time            | datetime   | null: false                     |
| end_time              | datetime   | null: false                     |
| explain               | text       | null: false                     |

### Association

- belongs_to  :user
- belongs_to  :matter

## sales_staffsテーブル

| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| department            | string     | null: false                     |
| staff                 | string     | null: false                     |

### Association

- has_many    :matters

## matter_clientsテーブル

| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| matter_id             | int        | null: false, foreign_key: true  |
| client_id             | int        | null: false, foreign_key: true  |

### Association

- belongs_to  :matter
- belongs_to  :client

## clients

| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| company               | string     | null: false                     |
| department            | string     | null: false                     |
| name                  | string     | null: false                     |

### Association

- has_many    :matter_clients
- has_many    :matters, through: matter_clients