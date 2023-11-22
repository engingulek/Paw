

import Foundation

public enum NetworkPath {
    case categories
}

extension NetworkPath : TargetType {
    var baseURL: String {
        return "http://localhost:8080/api/"
    }
    
    var path: String {
        switch self {
        case .categories:
            return "categories/getCategories"
        }
    }
    
    var method: AlamofireMethod {
        switch self {
        case .categories:
            return .GET
        }
    }
    
    var requestType: RequestType {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
    
}
