

import Foundation

public enum NetworkPath {
    case categories
    case adoptingAdvert
}

extension NetworkPath : TargetType {
    var baseURL: String {
        return "http://localhost:8080/api/"
    }
    
    var path: String {
        switch self {
        case .categories:
            return "categories/getCategories"
        case .adoptingAdvert:
            return "adverts/getAdverts"
        }
    }
    
    var method: AlamofireMethod {
        switch self {
        default:
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
