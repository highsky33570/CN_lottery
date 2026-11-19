# CN Lottery APP

Flutter mobile lottery-results APP. UI style referenced from [yiqicai.com](https://www.yiqicai.com/), redesigned for phone (not a website clone).

## Stack

- Flutter + Dart
- `flutter_screenutil` (required from start)
- Mock data now → replace with API when scraper DB is ready

## Project layout

```
app/                 Flutter client
docs/APP_PLAN.md     Website → mobile mapping & phases
```

## Run on LDPlayer

1. Install Android SDK / platform-tools (or Android Studio)
2. Start LDPlayer, enable ADB
3. Connect:

```powershell
$env:PATH = "C:\flutter\bin;$env:PATH"
adb connect 127.0.0.1:5555
cd C:\Projects\cnlotery\app
flutter devices
flutter run
```

## V1 screens

- 首页 — latest draws + quick lottery chips
- 开奖 — 全国彩 / 地方彩 + detail + history
- 走势 — category tool hub (charts after real history)
- 我的 — simple settings shell
