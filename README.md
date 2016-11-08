## LakestoneRealm

A set of common abstractions for using realm API in Swift/Silver cross-platform codebases.

## Installation (swift)
1. Clone the project
2. Download latest realm distribution from [Realm.io](https://realm.io) into designated repository folder.
3. Extract the realm destribution archive and rename it into `realm-swift`
4. run `./regenerate_project.sh` in your terminal to generate the xcode project. (You are also adviced to regenerate it each time you pull)

*the whole thing in terminal*:

```swift
git clone https://github.com/GeoThings/LakestoneRealm.git
cd LakestoneRealm
curl -O https://static.realm.io/downloads/swift/realm-swift-2.0.3.zip
tar -xvf realm-swift-2.0.3.zip
mv realm-swift-2.0.3 realm-swift
./regenerate_project.sh
open LakestoneRealm.xcodeproj
```
