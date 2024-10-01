# ReddsLife

這款應用旨在具體展現後端工作的價值，讓其不再如同鴨子划水般隱而不見。透過這個平台，我希望將日常的技術想法轉化為實際功能，進一步提升生活的便利性。

## 附近餐廳

透過 Google places API，搜尋裝置當前位置(座標)，半徑內的餐廳。

> 需考慮以什麼行為模式帶來收益，以支援 Google API 使用成本。
> 像 Nearby Search 功能 (1120 TWD / 1k)

## 聊天

透過 FCM 所提供的訊息收發和推播通知，逹成即時對話功能。

> 由 FCM 取代後端的開發成本。

### FCM Step By Step

- GCP Account，需有一組 GCP 帳號，用來建立 Firebase 專案。
- Firebase Project，由 Firebase 控制台新增專案或是在 GCP 專案中加入 Firebase 服務。
- 安裝開發工具

```
# 安裝 firebase cli
npm install -g firebase-tools
# 登入 firebase project
firebase login
# 安裝 flutterfire cli
dart pub global activate flutterfire_cli
```

- 加入應用程式

```
# 建立應用程式
flutter create project-name
# 設定工作流程
flutterfire configure
```

> 上述是以 Flutter 應用程式示範，其它程式語言的步驟有些微不同
> firebase 13.20.1
