import NetworkKit
import ModelKit

protocol CreateAdvertListInteractorInterface {
    func fetchCreateAdverts(userId:Int) async throws -> [AdoptingAdvert]
}

final class CreateAdvertListInteractor : CreateAdvertListInteractorInterface {
    static let shared = CreateAdvertListInteractor()
    func fetchCreateAdverts(userId: Int) async throws -> [AdoptingAdvert] {
        do {
            let response = try await NetworkManager.shared.fetch(
                target: .getAdvertListByUserId(userId),
                responseClass: DataResult<[AdoptingAdvert]>.self)
            return response.data
        }catch{
            throw error
        }
    }
}
