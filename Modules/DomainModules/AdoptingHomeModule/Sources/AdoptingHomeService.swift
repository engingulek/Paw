
import Foundation
import NetworkKit

protocol AdoptingHomeServiceProtocol {
    func fetchCategories() async throws -> [Category]
    func fetchAdoptinAdvert() async throws -> [AdoptingAdvert]
    func advertFilterByCategory(categoryId:Int) async throws ->  [AdoptingAdvert]
    func advertFilterBySearchText(searchText:String) async throws -> [AdoptingAdvert]
    func advertFilterBySearchTextAndCategoryId(
        categoryId:Int,
        searchText:String)  async throws -> [AdoptingAdvert]
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
    // MARK: - FethAdverts
    func fetchAdoptinAdvert() async throws -> [AdoptingAdvert] {
        do {
            let response = try await NetworkManager.shared.fetch(
                target: .adoptingAdvert,
                responseClass: [AdoptingAdvert].self)
            return response
        }catch{
            throw error
        }
    }
    // MARK: - AdvertFilterByCategory
    func advertFilterByCategory(categoryId: Int) async throws -> [AdoptingAdvert] {
        do{
            let response = try await NetworkManager.shared.fetch(
                target: .getAdvertFilterByCategory(categoryId),
                responseClass: [AdoptingAdvert].self)
            return response
        }catch{
            throw error
        }
    }
    //MARK: - AdvertFilterBySearchText
    func advertFilterBySearchText(searchText:String) async throws -> [AdoptingAdvert] {
        do {
            let response = try await NetworkManager.shared.fetch(
                target: .getAdvertFilterBySearchText(searchText),
                responseClass: [AdoptingAdvert].self)
            return response
        }catch{
            throw error
        }
    }
    
    func advertFilterBySearchTextAndCategoryId(
        categoryId: Int,
        searchText: String) async throws -> [AdoptingAdvert] {
            do {
                let response = try await NetworkManager.shared.fetch(
                    target: .getAdvertFilterByCategoryAndSearchText(searchText, categoryId),
                    responseClass: [AdoptingAdvert].self)
                return response
            }catch{
                throw error
            }
        
    }
}
