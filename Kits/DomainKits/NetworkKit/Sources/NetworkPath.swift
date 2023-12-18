

import Foundation
import Alamofire
public enum NetworkPath {
    case categories
    case adoptingAdvert
    case advertDetail(Int,Int)
    case getAdvertFilterByCategory(Int)
    case getAdvertFilterBySearchText(String)
    case getAdvertFilterByCategoryAndSearchText(String,Int)
    case getFavList(Int)
    case deleteFavAdvertFromFavAdvertList(Int)
    case deletteFavAdvertByAdvertIdAndUserId(Int,Int)
    case addAdvertToFavList(Parameters)
    case addAdvertToAdvertList(Parameters)
    case getAdvertListByUserId(Int)
    case deleteAdvertOfUser(Int,Int)
    
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
        case .advertDetail(let advertId,let userId):
            return "adverts/getAdvertDetail?advertId=\(advertId)&userId=\(userId)"
        case .getAdvertFilterByCategory(let categoryId):
            return "adverts/getAdvertFilterByCategory?categoryId=\(categoryId)"
        case .getAdvertFilterBySearchText(let searchText):
            return "adverts/getAdvertFilterBySearchText?searchText=\(searchText)"
        case .getAdvertFilterByCategoryAndSearchText(let searchText, let categoryId):
            return  "adverts/getAdvertFilterByCategoryIdAndSearchText?categoryId=\(categoryId)&searchText=\(searchText)"
            
        case .getFavList(let userId):
            return "favorites/getFavorites?userid=\(userId)"
        case .deleteFavAdvertFromFavAdvertList(let id):
            return "favorites/deleteFavAdvert?id=\(id)"
        case .deletteFavAdvertByAdvertIdAndUserId(let advertId, let userId):
            return "favorites/deleteFavAdvertByAdvertIdAndUserId?advertid=\(advertId)&userid=\(userId)"
        case .addAdvertToFavList:
            return "favorites/add"
        case .addAdvertToAdvertList:
            return "adverts/add"
        case .getAdvertListByUserId(let userId):
            return "adverts/getAdvertListByUserId?userId=\(userId)"
        case .deleteAdvertOfUser(let id, let userid):
            return "adverts/deleteAdvert?id=\(id)&userid=\(userid)"
        }
    }
    
    var method: AlamofireMethod {
        switch self {
        case .deleteFavAdvertFromFavAdvertList,
                .deletteFavAdvertByAdvertIdAndUserId,
                .deleteAdvertOfUser:
            return .DELETE
        case .addAdvertToFavList,.addAdvertToAdvertList:
            return .POST
        default:
            return .GET
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .addAdvertToFavList(let parameters):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.init())
        case .addAdvertToAdvertList(let parameters):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.init())
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}
