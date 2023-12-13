import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(
            url: "https://github.com/firebase/firebase-ios-sdk.git",
            requirement: .upToNextMajor(
                from: "8.10.0"
            )
        )
    ],
    platforms: Set(arrayLiteral: .iOS))
