

import Foundation

public enum NetworkPath {
    case categories
    case adoptingAdvert
    case advertDetail(Int)
    case getAdvertFilterByCategory(Int)
    case getAdvertFilterBySearchText(String)
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
        case .advertDetail(let id):
            return "adverts/getAdvertDetail?id=\(id)"
        case .getAdvertFilterByCategory(let categoryId):
            return "adverts/getAdvertFilterByCategory?categoryId=\(categoryId)"
        case .getAdvertFilterBySearchText(let searchText):
            return "adverts/getAdvertFilterBySearchText?searchText=\(searchText)"
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
