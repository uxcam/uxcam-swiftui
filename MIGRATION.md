# Migrating an existing Swift Package Manager integration

The package product and imported module remain named `UXCamSwiftUI`. Application code
does not change, but the Git package identity changes from `uxcam-ios-swiftui` to
`uxcam-swiftui`.

Migrate to 3.11.1 or later. Do not use 3.10.0–3.11.0: App Store Connect rejects
Swift Package Manager apps that ship them (ITMS-90685, ITMS-90206).

## Xcode projects

1. Note every application target currently linked to the `UXCamSwiftUI` product.
2. Remove the `uxcam-ios-swiftui` package dependency.
3. Add `https://github.com/uxcam/uxcam-swiftui`.
4. Select the required UXCamSwiftUI version.
5. Link the `UXCamSwiftUI` product to the same application targets.
6. Resolve package dependencies and commit the updated project and
   `Package.resolved`.
7. Build both a simulator and device destination.

## Package.swift consumers

Replace the dependency URL:

```swift
.package(
    url: "https://github.com/uxcam/uxcam-swiftui",
    from: "3.11.1" // 3.10.0–3.11.0 are rejected by App Store Connect
)
```

Then run `swift package resolve` and commit the updated `Package.resolved`.

## Compatibility

- The old URL remains available permanently for version 1.10.0 and earlier.
- Versions 3.10.0 and later are released from `uxcam-swiftui`.
- Never include both package URLs in one dependency graph. They have different
  package identities but export the same `UXCamSwiftUI` product and module.
- CocoaPods users do not need to make any migration change.
