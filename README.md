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
- アプリケーション内で、Google MapsとGeocoderのAPIを利用しています。
  - [Qiita::Google Maps APIを使ってみた](https://qiita.com/Haruka-Ogawa/items/997401a2edcd20e61037)
  - 上記のQiitaの記事を参考にAPI KEYの取得をしてください。
    - Google Cloudを初めて利用する方は、無料利用枠内で、API_KEYを取得できるかと思います。
  - 取得したAPI KEYは、アプリケーション直下に`.env`ファイルを作成して下記のように記述して下さい。

```txt:.env
GOOGLE_API_KEY = "your_api_key"
```

# 各機能詳細

