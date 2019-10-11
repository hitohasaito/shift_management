# アルバイト人員管理お助けアプリ
アルバイト管理に置いて特に管理者の負担が大きいのは、シフトへの人員配置とシフトに空きがでた時の人員調整です。それぞれの希望や労働時間などを調整・考慮しながら人員配置をしなければならないため、
管理人数やシフト枠が多いほど、その作業は煩雑で労力がかかります。このアプリでは、その作業の一部を自動化することによって、管理者の負担を軽減し、人的コストの削減を目指します。


カタログ設計

https://docs.google.com/spreadsheets/d/1rjnD2ibadYYPnWowH3GFGYz_f9v2n_xrPK7suFUDZl8/edit#gid=0

テーブル定義

https://docs.google.com/spreadsheets/d/1rjnD2ibadYYPnWowH3GFGYz_f9v2n_xrPK7suFUDZl8/edit#gid=1428317529


画面遷移図

https://docs.google.com/spreadsheets/d/1YOwR35FsnZkYWFS8X_xEACWmjajThaRa9MI-8DHkWvE/edit#gid=0

画面ワイヤーフレーム

https://docs.google.com/spreadsheets/d/1YOwR35FsnZkYWFS8X_xEACWmjajThaRa9MI-8DHkWvE/edit#gid=1950278972

使用予定Gem
devise ransak



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
