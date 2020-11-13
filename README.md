# matter-management

# アプリケーション概要
  本アプリケーションは案件管理アプリケーションです。<br>
  ユーザー登録したユーザーがログインすることで案件登録や編集などの案件管理が行えます。<br>
  前職（フロントSE）では案件管理をエクセルで行っており、その時に感じていた課題を解決するために時に欲しいものというコンセプトでアプリケーションを作成しました。

# 本番環境
## URL
http://54.238.110.156/

## Basic認証
	ID: admin   パスワード: admin1234

## テスト用アカウント
	管理者) メールアドレス: takeda@takeda.com      パスワード: takeda1234
	利用者) メールアドレス: tokugawa@tokugawa.com  パスワード: tokugawa1234

# 機能一覧
- ユーザー管理
  - ユーザー登録
  - ユーザー情報編集
  - ログイン/ログアウト
- 案件関連
  - 一覧表示機能
  - 登録機能
  - 詳細表示機能
  - 編集機能
  - 削除機能
  - 検索機能
- 案件に紐づく情報の管理
  - 担当営業
    - 登録機能
    - 編集機能
  - 顧客
    - 一覧表示
    - 登録機能
    - 編集機能
    - 削除機能
  - 商談記録の一覧表示/登録/編集/削除機能

# 利用方法
  - WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
    - ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
  - 接続先およびログイン情報については、上記の通りです。
  - 同時に複数の方がログインしている場合に、ログインできない可能性があります。	
  - 案件登録方法
    - テスト用アカウント（管理者）でログイン→トップページから「案件登録」を押下→案件情報入力→顧客情報入力→担当営業情報入力→案件登録
  - 案件検索方法
    - テストアカウント（管理者）でログイン→トップページから「案件検索」を押下→サイドバーに検索条件を入力／選択し、検索
  - 案件編集
	  - テストアカウント（管理者）でログイン→トップページから案件を選択→「案件情報編集」を押下→案件情報を編集
  - 案件削除
    - テストアカウント（管理者）でログイン→トップページから案件を選択→サイドバーの「案件削除」を押下→確認用モーダルウィンドウでOKを押下

# 目指した課題解決
前職では案件をエクセルで管理しており、その中で感じていた以下の課題の解決を目指しました
  - 操作ミスにより意図しないセルでデータの上書きや削除が発生し、誤ったデータのまま管理されてしまう
  - 入力が必須の項目が空欄になっているなど不整合があり、都度担当者に確認をとっていた
  - 商談など更新が重なるとシートが縦に長くなってしまい視認性が悪い

# 機能詳細
## 案件登録機能
<img src="https://github.com/syumei061120/matter-management/wiki/gif/matter-registration.gif" width="600">
Topページから「案件登録」を押下し、登録ページにアクセスできます。<br>
このページでは、案件情報→顧客情報→担当営業情報を入力することで新規案件を登録できます。<br>
必須項目となっている項目は未入力状態では次のページにアクセスできません。<br><br>
工夫した点は、登録情報の種類によってウィザード形式で登録できる点です。<br>
ページ毎に入力する情報が纏まることによる使いやすさと、1つのページが長くなら無いことで見やすいページになるようにしました。

## 案件編集機能
<img src="https://github.com/syumei061120/matter-management/wiki/gif/matter-edit.giff" width="600">
Topページor検索ページで案件を選択し、案件詳細ページのサイドバーにある「案件情報編集」を押下することで編集ページにアクセスできます。<br>
このページでは、登録済み案件の情報を編集できます。<br><br>

工夫した点は、編集権限を登録者と管理者（責任者）に限定したことと、入力フォームを登録画面と共通化したことです。<br>
前者の編集権限については、他ユーザーの案件を誤って編集しないための制限として設けました。<br>
後者は、メンテナンス性を向上させるために共通にしました。

## 案件検索機能
<img src="https://github.com/syumei061120/matter-management/wiki/gif/matter-search.gif" width="600">
Topページからヘッダーのにある「案件検索」を押下し、検索ページにアクセスできます。<br>
複数条件を指定して、編集したい案件や状況を確認したい案件を簡単に探すことができます。<br><br>

工夫した点は、関連モデルの情報からも案件を検索できる点です。顧客軸の検索や、担当営業軸の検索もできます。<br>
その他、検索項目が多くありますが、使いやすさと見やすさを意識してチェックボックスやプルダウン、アコーディオンメニュー組み合わせた点も工夫しました。

## 担当営業編集機能
<img src="https://github.com/syumei061120/matter-management/wiki/gif/sales.gif" width="600">
Topページor検索ページで案件を選択し、案件詳細ページでサイドバーにある「担当営業情報情報編集」を押下することで編集ページにアクセスできます。<br>
このページでは、選択肢た案件の担当営業情報を編集できます。<br><br>

工夫した点は、入力フォームを登録画面と共通化したことによるメンテナンス性の向上です。<br>
その他、営業は1人だけ登録できるようにして、営業担当とフロントSEの担当者（自身）を明確にしました。

## 顧客の一覧表示/登録/編集/削除機能
<img src="https://github.com/syumei061120/matter-management/wiki/gif/client.gif" width="600">
Topページor検索ページで案件を選択し、案件詳細ページでサイドバーにある「顧客情報一覧」を押下することで一覧ページにアクセスできます。<br>
同様にサイドバーにある「顧客情報追記」を押下することで新しい顧客情報の追加が可能です。<br>
編集/削除機能は登録済みの顧客情報の右上のアイコンを押下することで編集や削除が可能です。<br><br>

工夫した点は、顧客テーブル内で情報が重複しない点です。<br>
案件テーブルと顧客テーブルの間に中間テーブルを設け、登録/編集された顧客情報が顧客テーブルに存在している場合、中間テーブルにidを保存して案件と顧客情報を紐付けます。<br>
また、案件を削除する際は、顧客が紐づく案件が削除対象の案件のみであれば顧客テーブルと中間テーブルの両方から削除します。もし他の案件と紐づいている場合は中間テーブルのみ削除します。

## 商談記録の一覧表示/登録/編集/削除機能
<img src="https://github.com/syumei061120/matter-management/wiki/gif/client.gif" width="600">
Topページor検索ページで案件を選択し、案件詳細ページでサイドバーにある「商談記録一覧」を押下することで一覧ページにアクセスできます。<br>
同様にサイドバーにある「商談記録登録」を押下することで新しい商談記録の追加が可能です。<br>
編集/削除機能は登録済みの商談記録の右上のアイコンを押下することで編集や削除が可能です。<br><br>

工夫した点は、商談記録の一覧ページを設けた点です。<br>
案件詳細ページには直近の商談記録のみ表示し、過去の商談記録は一覧ページで確認できます。<br>
このことにより、案件詳細ページの視認性を上げることができました。

# 使用技術
## バックエンド
Ruby, Ruby on Rails
## フロントエンド
JavaScript
## データベース
MySQL, SequelPro
## インフラ
AWS（EC2）, Capistrano
## Webサーバ（本番環境）
nginx
## アプリケーションサーバ（本番環境）
unicorn
## ソース管理
GitHub, GitHubDesktop
## テスト
RSpec
## エディタ
VSCode

# 実装予定の機能
- 案件集計機能
→ 検索結果該当する案件の集計ができる機能を実装したい
- 案件引継ぎ機能
→ 案件登録をしたユーザーと紐づくようにしているので、担当者が変更になった場合に引継ぎ先のユーザに紐付け直せるようにしたい
- ユーザー削除機能
→ ユーザーモデルが他のモデルとアソシエーションの組んでいる為、外部キーの制約でユーザーが削除ができないので実装したい
- パスワード変更機能
→ パスワードを忘れた場合に対応する方法が無いので、実装が必要
- ユーザー管理機能の向上
→ 権限は利用者・管理者を登録画面で選択するようになっているので、ユーザー管理画面を設けて管理者が権限設定（利用者・責任者・管理者など）を行うようにしたい

# 開発にあたり洗い出した要件

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
