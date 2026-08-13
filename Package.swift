// swift-tools-version:5.3
import PackageDescription

let version = "3.10.1"
let checksum = "cc3217e7db7047d38abdd5561cd4e5e4c1b7f813c67944bd7e50dc6715922525"
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
        
