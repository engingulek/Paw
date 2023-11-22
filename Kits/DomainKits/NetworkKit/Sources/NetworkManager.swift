
import Foundation
import Alamofire

enum NetworkError : Error {
    case invalidResponse
    case defaultStatusCode
    case doNotCompleted
    case valueError
}

public protocol NetworkManagerProtocol{
    func fetch<T:Decodable>(
        target:NetworkPath,
        responseClass:T.Type) async throws -> T
}

public final class NetworkManager : NetworkManagerProtocol  {
    
    public static let shared :NetworkManagerProtocol  = NetworkManager()
    
    init() {}
    
    public func fetch<T:Decodable>(
        target: NetworkPath,
        responseClass: T.Type) async throws -> T  {
            
            let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
            let fetchUrl = target.baseURL + target.path
            
            let request = AF.request(
                fetchUrl,
                method: method)
                .validate()
                .serializingDecodable(DataResult<T>.self)
            
            let result = await request.response
            
            guard let response = result.response else {
                throw NetworkError.invalidResponse
            }
            
            switch response.statusCode {
            case 200...299:
                guard let value = result.value else {
                    throw NetworkError.valueError
                }
                return value.data
            default:
                throw NetworkError.defaultStatusCode
            }
        }
}


