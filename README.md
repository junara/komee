# README
# 概要
コメントつきの写真をつくるアプリ

# 説明
* rails 6 beta 1
* 画像アップロード: ActionStorage
* リッチテキスト: ActionText
* CSS: [Bulma](https://bulma.io/)
# 使い方
## 初期化

```
> docker-compose build
> docker-compose up -d
> docker-compose exec web yarn install
> docker-compose down
> docker-compose up -d
> docker-compose exec web rails db:create
> docker-compose exec web rails db:migrate
```

## 起動

```
> docker-compose up
```

## アクセス

http://localhost:3000

[![Image from Gyazo](https://i.gyazo.com/f1e137b46b2cba4e35670f35806fef36.png)](https://gyazo.com/f1e137b46b2cba4e35670f35806fef36)

[![Image from Gyazo](https://i.gyazo.com/d8458116d56d4a08b2fa473f55dbccfa.jpg)](https://gyazo.com/d8458116d56d4a08b2fa473f55dbccfa)

[![Image from Gyazo](https://i.gyazo.com/0557913c4ad4a4f50f19910d09760c8d.gif)](https://gyazo.com/0557913c4ad4a4f50f19910d09760c8d)

## 終了

```
> docker-compose down
```
