import NetworkKit
import ModelKit

protocol CreateAdvertListInteractorInterface {
    func fetchCreateAdverts(userId:Int) async throws -> [AdoptingAdvert]
    func deleteAdvertOfUser(id:Int,userId:Int) async throws
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
    
    func deleteAdvertOfUser(id: Int, userId: Int) async throws {
        do {
            _ = try await NetworkManager.shared.fetch(
                target: .deleteAdvertOfUser(id, userId),
                responseClass: DeleteResult.self)
        }catch{
            throw error
        }
    }
    
}
