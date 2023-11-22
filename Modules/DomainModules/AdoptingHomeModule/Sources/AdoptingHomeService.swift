
import Foundation
import NetworkKit

protocol AdoptingHomeServiceProtocol {
    func fetchCategories() async throws -> [Category]
}

final class AdoptingHomeService : AdoptingHomeServiceProtocol {
    
    static let shared = AdoptingHomeService()

    func fetchCategories() async throws -> [Category] {
        do {
            let response = try await NetworkManager.shared.fetch(target: .categories, responseClass: [Category].self)
            return response
        }catch {
            throw error
        }
      
    }
}
