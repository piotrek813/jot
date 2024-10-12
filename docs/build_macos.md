# Release for mac:

## Add your icon if you haven't yet
```
flutter pub run flutter_launcher_icons -f flutter_launcher_icons.yaml
```
## Build
```
flutter build macos --release
```
## Check if your buid is signed
```
codesign -dv --verbose=4 ./build/macos/Build/Products/Release/jot_notes.app
```
## Check your key
```
security find-identity -p codesigning
```
## Sign your code with the key you've found
```
codesign --deep --force --verbose --sign "YOURKEY" "./build/macos/Build/Products/Release/jot_notes.app"
```
## Pack your app into dmg installer
```
appdmg ./installers/macos/config.json ./installers/macos/jot.dmg

```