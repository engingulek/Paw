
import ProjectDescription

public extension Package {
    static var snapKit : Self {
        .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .upToNextMajor(from: "5.0.1"))
    }
    
    static var alamofire : Self {
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.8.1"))
    }
    
    static var kingfisher : Self {
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0.0"))
    }
    
    static var messageKit : Self {
        .package(url: "https://github.com/MessageKit/MessageKit", .upToNextMajor(from: "4.2.0"))
    }
}

public let snapKit =  TargetDependency.package(product: "SnapKit")
public let alamofire = TargetDependency.package(product: "Alamofire")
public let kingfisher = TargetDependency.package(product: "Kingfisher")
public let messageKit = TargetDependency.package(product: "MessageKit")
