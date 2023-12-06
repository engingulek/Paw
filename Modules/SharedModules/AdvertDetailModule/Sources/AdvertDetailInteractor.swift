

import Foundation
import NetworkKit

protocol AdvertDetailServiceProtocol {
    func fetchAdvertDetail(advertId:Int,userId:Int) async throws -> AdvertDetail
    func deleteFavAdvertFromFavList(advertId:Int,userId:Int) async throws
    func addAdvertToFromFavList(advertId:Int,userId:Int) async throws
}

final class AdvertDetailService : AdvertDetailServiceProtocol {
    
    static let shared = AdvertDetailService()
    func fetchAdvertDetail(advertId:Int,userId:Int) async throws -> AdvertDetail {
        do {
            let response = try await NetworkManager.shared.fetch(
                target: .advertDetail(
                    advertId,
                    userId),
                responseClass: DataResult<AdvertDetail>.self)
            return response.data
        }catch {
            throw error
        }
    }
    
    func deleteFavAdvertFromFavList(advertId:Int,userId:Int) async throws {
        do {
            _ = try await NetworkManager.shared.fetch(
                target: .deletteFavAdvertByAdvertIdAndUserId(advertId, userId),
                responseClass: DeleteResult.self)
        }catch{
            throw error
        }
    }
    
    func addAdvertToFromFavList(advertId:Int,userId:Int) async throws {
        let parameters = ["advertid":advertId,"userid":userId]
        print(parameters)
        do{
            _ = try await NetworkManager.shared.fetch(
                target: .addAdvertToFavList(parameters),
                responseClass: DeleteResult.self)
        }catch{
            throw error
        }
    }
    
}
    


