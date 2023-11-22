

import Foundation
import NetworkKit

protocol AdvertDetailServiceProtocol {
    func fetchAdvertDetail(id:Int) async throws -> AdvertDetail
}

final class AdvertDetailService : AdvertDetailServiceProtocol {
    static let shared = AdvertDetailService()
    func fetchAdvertDetail(id:Int) async throws -> AdvertDetail {
        do {
            let response = try await NetworkManager.shared.fetch(
                target: .advertDetail(id),
                responseClass: AdvertDetail.self)
            print(response.name)
            return response
        }catch {
            throw error
        }
    }
}
    


