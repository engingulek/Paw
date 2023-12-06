import Foundation
import NetworkKit

protocol FavAdvertsInteractorInterface {
    func fetchFavAdverts(userId:Int) async throws ->  [FavAdvert]
}


final class FavAdvertsInteractor : FavAdvertsInteractorInterface {
    static let shared = FavAdvertsInteractor()
    func fetchFavAdverts(userId: Int) async throws -> [FavAdvert] {
        do {
            let response = try await NetworkManager.shared.fetch(target: .getFavList(userId), responseClass: [FavAdvert].self)
            return response
        }catch{
            throw error
        }
    }
}
