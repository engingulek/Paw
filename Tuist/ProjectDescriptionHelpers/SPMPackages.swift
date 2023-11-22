
import ProjectDescription

public extension Package {
    static var snapKit : Self {
        .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .upToNextMajor(from: "5.0.1"))
    }
    
    static var alamofire : Self {
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.8.1"))
    }
}

public let snapKit =  TargetDependency.package(product: "SnapKit")
public let alamofire = TargetDependency.package(product: "Alamofire")
