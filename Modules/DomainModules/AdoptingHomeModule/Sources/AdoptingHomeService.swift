
import Foundation
import NetworkKit

protocol AdoptingHomeServiceProtocol {
    func fetchCategories() async throws -> [Category]
    func fetchAdoptinAdvert() async throws -> [AdoptingAdvert]
}

final class AdoptingHomeService : AdoptingHomeServiceProtocol {
   
    static let shared = AdoptingHomeService()

    // MARK: - FethCategories
    func fetchCategories() async throws -> [Category] {
        do {
            let response = try await NetworkManager.shared.fetch(
                target: .categories,
                responseClass: [Category].self)
            return response
        }catch{
            throw error
        }
        
    }
    
    func fetchAdoptinAdvert() async throws -> [AdoptingAdvert] {
       
            let response = try await NetworkManager.shared.fetch(
                target: .adoptingAdvert,
                responseClass: [AdoptingAdvert].self)
            return response
      
    }
}
