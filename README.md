# アルバイト人員管理お助けアプリ
アルバイト管理に置いて特に管理者の負担が大きいのは、シフトへの人員配置とシフトに空きがでた時の人員調整です。それぞれの希望や労働時間などを調整・考慮しながら人員配置をしなければならないため、
管理人数やシフト枠が多いほど、その作業は煩雑で労力がかかります。このアプリでは、その作業の一部を自動化することによって、管理者の負担を軽減し、人的コストの削減を目指します。


カタログ設計
https://docs.google.com/spreadsheets/d/1SmiFTpaC-eawKYDSYCKy3VDE74d7RkjSf2yPUNT9MQw/edit?usp=sharing

テーブル定義

https://docs.google.com/spreadsheets/d/1rjnD2ibadYYPnWowH3GFGYz_f9v2n_xrPK7suFUDZl8/edit?usp=sharing

ER図
https://docs.google.com/spreadsheets/d/1aUYA2vH61IZA8nqiwYvXX7rh_TGZsOnNDARGTAxWFrM/edit?usp=sharing

画面遷移図
https://docs.google.com/spreadsheets/d/1vpxBauWIX4_I43LHzXI8n9QpO1RpxgdkgZ-kFP2JSU0/edit?usp=sharing

画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1YOwR35FsnZkYWFS8X_xEACWmjajThaRa9MI-8DHkWvE/edit?usp=sharing



機能一覧
-----------
ユーザー登録・ログイン機能									

シフト作成・編集・削除機能					

シフト一覧表示機能										

シフトの自動人員配置機能										

シフト一覧画面でのシフト検索機能					

シフト公開機能					

勤務希望登録機能									

勤務希望一覧表示機能										

コメント追加機能と通知機能					

シフト表の配置人員編集機能						

勤務登録の自動制限機能					

アルバイト情報の編集・削除機能									

アルバイト一覧表示機能					

ラベル追加機能							


使用予定Gem
----------
devise ransack



開発環境
------------

* Ruby 2.3.0
* rails 5.2.3
* postgresql 11.4

デプロイ手順
------------
1.heroku create
2.rails assets:precompile RAILS_ENV=production  
3.git add -A(またはファイル名)  
4.git commit -m "コミットメッセージ"  
5.git push heroku master  
6.heroku run rails db:migrate
