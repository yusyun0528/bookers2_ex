# Bookers2_phase2_Debug
phase2の応用課題について実装したアプリケーションです。
以下の機能について、バグを仕込んでいるので、デバッグしてください。

# デバッグ内容
- 非同期いいね
- 非同期コメント
- 非同期フォロー
- jpostal, jp_prefecture
- action_cable
- メール送信
- wheneverによるバッジ処理
- action_cableによるチャット機能

# 事前準備
## Google MapとGeocoder用のAPIを取得する
- アプリケーション内で、Google MapsとGoogle geocodingのAPIを利用しています。
  - [Qiita::Google Maps APIを使ってみた](https://qiita.com/Haruka-Ogawa/items/997401a2edcd20e61037)
  - 上記のQiitaの記事を参考にAPI KEYの取得をしてください。
    - 記事はGoogle Maps用の記事ですが、一つのAPI KEYでGoogle MapとGoogle geocodingを兼用できます。
    - Google Cloudを初めて利用する方は、無料利用枠内で、API_KEYを取得できるかと思います。
  - 取得したAPI KEYは、アプリケーション直下に`.env`ファイルを作成して下記のように記述して下さい。

```txt:.env
GOOGLE_API_KEY = "your_api_key"
```

## Gmailでアプリケーションパスワードを生成する。
- デバッグ内容にAction Mailerが含まれます。
- Action MailerでGmailのSMTPサーバを前提にした箇所があるので、その準備を行います。
- まずは、Gmailアカウントについて2段階認証を有効にしてください。
  - 次のドキュメントを参考にしてください
  - [Google::2段階認証プロセスを有効にする](https://support.google.com/accounts/answer/185839?co=GENIE.Platform%3DDesktop&hl=ja)
- 次に、Gmailのアプリケーションパスワードを生成してください。
  - 次のドキュメントを参考にしてください
  - [Google::アプリパスワードでログイン](https://support.google.com/accounts/answer/185833?hl=ja)
  - パスワードは一度しか表示されないので、注意してください。
- アプリパスワードまで生成できたら、`.env`ファイルにメールアドレスとアプリパスワードを追記してください。

```txt:.env
GOOGLE_API_KEY = "your_api_key"
GMAIL_USERNAME = "xxxxxxx@gmail.com"
GMAIL_PASSWORD = "your_app_password"
```


# 各機能詳細

