
import Foundation
import Alamofire

enum NetworkError : Error {
    case invalidResponse
    case defaultStatusCode
    case valueError
    case noRequestResource
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
            let parameters = buildParams(requestType: target.requestType)
            let request = AF.request(
                fetchUrl,
                method: method,
                parameters: parameters.0,
                encoding: parameters.1
            )
                .validate()
                .serializingDecodable(T.self)
                
                
            
            let result = await request.response
            
            guard let response = result.response else {
                print("invalidResponse")
                throw NetworkError.invalidResponse
            }
            
            switch response.statusCode {
            case 200...299:
                guard let value = result.value else {
                    print("valueError")
                    throw NetworkError.valueError
                }
                return value
            case 404:
                throw NetworkError.noRequestResource
            default:
                print("defaultStatusCode")
                throw NetworkError.defaultStatusCode
            }
        }
    
    
      private func buildParams(requestType: RequestType) -> ([String: Any], ParameterEncoding) {
           
           switch requestType {
               
           case .requestPlain:
               return ([:], URLEncoding.default)
           case .requestParameters(parameters: let parameters, encoding: let encoding):
               return (parameters, encoding)
           }
       }
}


