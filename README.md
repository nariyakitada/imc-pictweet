# アプリケーション名
 Pchiphoto

# アプリケーション概要
画像をシェアし、ユーザー同士でコミュニケーションをとることができる

# URL
https://imc-pictweet.herokuapp.com/

# テスト用アカウント
- Basic認証パスワード：admin
- Basic認証ID：2222
- メールアドレス：test@com
- パスワード：111111q

# 利用方法

## 画像投稿
- 1.トップページのヘッダーからユーザー新規登録を行う
- 2.New Protoボタンから画像内容(タイトル、演者名、写真)を入力し、投稿する

## 演者ごとの来店スケジュール確認
トップページから好きな演者の写真をクリックして、スケジュール画面へ遷移する

# アプリケーションを作成した背景
「いむちゃんねる」というパチンコ・パチスロ系YouTuberが好きで演者に会いにいくことが多かった。来店スケジュールが公式サイトでは見ずらかった為一目でスケジュールを確認する事ができるツールを開発しようと思った。また、ファン同士で写真を共有することでコミュニケーションの場になればいいと思い開発に取り組んだ。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1uQ0kj6LyqW6AXqOezEnFrASEMCtaultto0bwqAwUr88/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明

## 演者の写真をクリックすると演者の来店スケジュールページへ遷移します
https://gyazo.com/ee2703795fb2a79c2df68931f039aac5

## 必要項目を入力し写真を投稿する事ができます
- https://gyazo.com/3badc519b4c0e493b39801cb1a32b931
- https://gyazo.com/dbaf8f08d0340e249ac607923d9b3e34

# 実装予定の機能
今後はチャット機能を実装しファン同士でさらにコミュニケーションを取る事ができるようにしたい。

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| title      | string       | null: false                    |
| presenter  | string       | null: false                    |
| user       | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

##　comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| prototype | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prototype
