
import Foundation

protocol Request {
    var baseUrl: String {get}
    var path : String {get}
    var headers : [String:String] {get}
    var queryItems : [URLQueryItem] {get}
    var method : HTTPMethod {get}
}

extension Request {
    var asURLRequest : URLRequest {
        var url = URL(string: baseUrl + path)!
        url.append(queryItems: queryItems)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers.forEach { key,value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}

enum HTTPMethod  : String {
    case GET
    case POST
}
