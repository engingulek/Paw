
import ProjectDescription

public extension Package {
    static var snapKit : Self {
        .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .upToNextMajor(from: "5.0.1"))
    }
}

public let snapKit =  TargetDependency.package(product: "SnapKit")
