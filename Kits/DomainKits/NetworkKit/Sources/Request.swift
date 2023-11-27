
import Foundation

protocol Request {
    var baseUrl: String {get}
    var path : String {get}
    var headers : [String:String] {get}
    var queryItems : [URLQueryItem] {get}
    var method : HTTPMethod {get}
}



enum HTTPMethod  : String {
    case GET
    case POST
}
