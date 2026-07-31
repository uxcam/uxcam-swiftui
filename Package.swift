// swift-tools-version:5.3
import PackageDescription

let version = "3.10.0"
let checksum = "174ecb067f7e00716e9ac64ce22346793804ab8ba62151759b8dfe9eb3880b80"
let repoName = "uxcam-swiftui"

let package = Package(
    
    name: "UXCamSwiftUI",
    
    platforms: 
    [
        .iOS(.v13)
    ],
    
    products: 
    [
        .library(
			name: "UXCamSwiftUI",
            targets: ["UXCamSwiftUI", "UXCamSwiftUIWrapper"]
		)
    ],
	
	dependencies:
	[
		.package(name: "UXCam", url: "https://github.com/uxcam/uxcam-ios", .exact("3.10.0")),
	],
	
    targets: 
    [
		// 'UXCamSwiftUIWrapper' target is a way to include the necessary dependency that the binary XCFramework in UXCamSwiftUI requires.
		// See https://forums.swift.org/t/swiftpm-binary-target-with-sub-dependencies/40197/13 for a long thread on the deficiencies of the `binaryTarget`
		.target(
				name: "UXCamSwiftUIWrapper",
				dependencies: ["UXCam"],
				path: "UXCamSwiftUIWrapper",
				exclude: ["README.md"]
		),
        .binaryTarget(
            name: "UXCamSwiftUI",
            url: "https://github.com/uxcam/uxcam-swiftui/releases/download/\(version)/UXCamSwiftUI.xcframework.zip",
            checksum: checksum
        )
    ]
)
        
