#名前

Stage-log

## 簡単な説明
 
演劇や舞台の感想・レビューを記録したり、
他の方へ共有することができるサイトです。
***デモ***
 
![デモ](https://image-url.gif)
 
## 機能
 
- レビューの投稿機能
- いいね機能
- フォロー機能
- 検索機能
 
## 必要条件
- ruby 2.5.7
- Rails 5.2.4.1
- kaminari 0.17.0
- bootstra 4.2.1

## 使い方
 
1. 観劇した舞台の感想を投稿する。
2. 他の利用者が投稿した感想を閲覧する。
3. 気に入った投稿があったら、いいねやClipをして見返す。
4. 投稿が気になるレビューワーさんをフォローする。
 
## インストール
 
```
$ git clone https://github.com/natsuki525/stage-reviews
$ cd stage-reviews
$ bundle install
$ rails db:migrate
$ rails db:seed
```
 
## 作者
 
[natsuki525](https://github.com/natsuki525)