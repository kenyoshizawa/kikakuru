# Kikakuru（キカクル）
https:/<hoge>/kikakuru.jp
（2024.4.30に公開終了したため、アクセスできません）



## サービス概要
企画倒れになりにくい「日程候補から都合が悪い日を削除するタイプ」の企画作成ツールです  



### 誰のためのサービス？
まだ関係が浅い友人を、遊びに誘いたいと考えている人

【具体例】  
ボードゲームカフェで知り合った人とSNSを交換した（Aさん、BさんとSNS交換）  
2人を飲み会に誘いたいけど、参加してくれるか分からない  

【条件】  
・ユーザー全員（具体例では、自分、Aさん、Bさん）とリアルで会っている  
・ユーザー同士、相手の連絡先を知っている  
・グループチャットはできない  



### どんな課題？
1. 企画を立てる心理的ハードルが高い  
➡︎お店、集合場所、日程候補などを考える必要がある

2. 企画がまとまらない  
➡︎3人（自分、Aさん、Bさん）で話し合うと、どこのお店に行くか、実施日はいつにするかなど、決定に時間がかかる

3. 企画倒れになる可能性  
➡︎3人（自分、Aさん、Bさん）の都合が合わないかもしれない



### 解決方法
1. 企画を立てる心理的ハードルが高い    
➡︎~~お店、集合場所、日程候補などを考える必要がある~~  
➡︎**あらかじめ決められた入力欄のみ考える**

2. 企画がまとまらない  
➡︎~~3人（自分、Aさん、Bさん）で話し合うと、どこのお店に行くか、実施日はいつにするかなど、決定に時間がかかる~~  
➡︎**企画内容は幹事1人が全て決める。幹事は自分の都合が良い日程候補を全てあげる**

3. 企画倒れになる可能性  
➡︎~~3人（自分、Aさん、Bさん）の都合が合わないかもしれない~~  
➡︎**友人は企画内容を確認し、幹事が提示する日程候補から都合が悪い日を削除する**



## システム構成
![kikakuru_インフラ構成図-ページ3 drawio](https://user-images.githubusercontent.com/59391263/195965858-7bc32140-fd20-4d11-81c9-6d8c8d5ea529.png)



## 使用技術
### フロントエンド
- HTML
  - slim (4.1.0)：可読性の向上

- CSS、JavaScript
  - bootstrap (4.5.3)：グリッドシステムの使用により実装コスト削減
  - jquery-rails (4.4.0)：Rails5.1以上でjquery(Ajax)を使用可能にする

  - アセットパイプライン
    - sprockets-rails (3.2.2)：Rails4以降のアセットパイプラインに Sprockets の機能を提供
    - sprockets (3.7.2)：アセットパイプラインの機能を提供
    - uglifier (4.2.0)：jsファイルの圧縮
    - sass-rails (5.1.0)：sassファイルコンパイル、cssファイルの圧縮
  
  - bootsnap (1.8.1)：Railsアプリケーションの高速化



### バックエンド
- rails (5.2.6)

  - ActiveModel (5.2.6)：FormObjectの使用
  - ActionCable (5.2.6)：WebSocket通信の機能を提供
  - ActiveJob (5.2.6)：非同期にCRUD処理を実行
  - ActiveRecord (5.2.6)：RubyとSQLの翻訳機能



### インフラストラクチャー
- Amazon EC2：仮想サーバー
  - Amazon Linux 2：OS
  - nginx(1.20.0)：Webサーバー
  - puma(3.12.6)：Applicationサーバー

- Amazon RDS：データベース
  - MySQL(5.7.33)：DBサーバー
  
- Amazon Route53：DNSサーバー

- Let's Encrypt：SSLサーバ証明書（公開鍵）、秘密鍵


### ツール
- Github：Git Flowによるコード管理



## ERD

![kikakuru_ERD-ERD -就活用- drawio](https://user-images.githubusercontent.com/59391263/207506953-15cf4ca2-ce2e-4e94-9ce1-35e3b8c23aa6.png)


## 機能
### ユーザー認証
- cookie store



### 日程候補選択（カレンダー）
- fullcalendar-rails (3.9.0.0)：カレンダーを表示させることができるJavaScriptプラグイン
- momentjs-rails (2.29.1.1)：JavaScriptで日付オブジェクトを扱う
- FormObject：複数の日付を選択



### 回答期限入力フォーム
- flatpickr (4.6.11.0)：日時入力フォームを提供するJavaScriptライブラリ  
（datetime_fieldヘルパーメソッドがFirefoxに対応していない問題を解消）



### 出欠確認
- Ajax：ステータスを「既読」から「出席」or「欠席」に更新
  - Deferredオブジェクト
  - Promiseオブジェクト



### 日程候補削除
- Ajax：日程候補を削除
  - JavaScript用埋め込みRubyファイル(.js.slim)



### グループチャット
- ActionCable：WebSocket通信を使用したリアルタイムチャット

