import Foundation
import NetworkKit

protocol FavAdvertsInteractorInterface {
    func fetchFavAdverts(userId:Int) async throws ->  [FavAdvert]
    func deleteFavAdvert(id:Int) async throws
}


final class FavAdvertsInteractor : FavAdvertsInteractorInterface {
    
    static let shared = FavAdvertsInteractor()
    func fetchFavAdverts(userId: Int) async throws -> [FavAdvert] {
        do {
            let response = try await NetworkManager.shared.fetch(
                target: .getFavList(userId),
                responseClass: DataResult<[FavAdvert]>.self)
            return response.data
        }catch{
            throw error
        }
    }
    
    func deleteFavAdvert(id: Int) async throws  {
        do {
            let response = try await NetworkManager.shared.fetch(
                target: .deleteFavAdvertFromFavAdvertList(id),
                responseClass: DeleteResult.self)
        }catch{
            throw error
        }
    }
}
