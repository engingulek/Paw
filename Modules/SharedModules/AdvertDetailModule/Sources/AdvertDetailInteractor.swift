

import Foundation
import NetworkKit

protocol AdvertDetailServiceProtocol {
    func fetchAdvertDetail(advertId:Int,userId:Int) async throws -> AdvertDetail
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
}
    


