
import Foundation
import NetworkKit
import ModelKit
protocol AdoptingHomeInteractorProtocol {
    func fetchCategories() async throws -> [CategoryResult]
    func fetchAdoptinAdvert() async throws -> [AdoptingAdvert]
    func advertFilterByCategory(categoryId:Int) async throws ->  [AdoptingAdvert]
    func advertFilterBySearchText(searchText:String) async throws -> [AdoptingAdvert]
    func advertFilterBySearchTextAndCategoryId(
        categoryId:Int,
        searchText:String)  async throws -> [AdoptingAdvert]
}

final class AdoptingHomeService : AdoptingHomeInteractorProtocol {
    
    static let shared = AdoptingHomeService()
    
    // MARK: - FethCategories
    func fetchCategories() async throws -> [CategoryResult] {
        do {
            let response = try await NetworkManager.shared.fetch(
                target: .categories,
                responseClass: DataResult<[CategoryResult]>.self)
            return response.data
        }catch{
            throw error
        }
        
    }
    // MARK: - FethAdverts
    func fetchAdoptinAdvert() async throws -> [AdoptingAdvert] {
        do {
            let response = try await NetworkManager.shared.fetch(
                target: .adoptingAdvert,
                responseClass: DataResult<[AdoptingAdvert]>.self)
            return response.data
        }catch{
            throw error
        }
    }
    // MARK: - AdvertFilterByCategory
    func advertFilterByCategory(categoryId: Int) async throws -> [AdoptingAdvert] {
        do{
            let response = try await NetworkManager.shared.fetch(
                target: .getAdvertFilterByCategory(categoryId),
                responseClass: DataResult<[AdoptingAdvert]>.self)
            return response.data
        }catch{
            throw error
        }
    }
    //MARK: - AdvertFilterBySearchText
    func advertFilterBySearchText(searchText:String) async throws -> [AdoptingAdvert] {
        do {
            let response = try await NetworkManager.shared.fetch(
                target: .getAdvertFilterBySearchText(searchText),
                responseClass: DataResult<[AdoptingAdvert]>.self)
            return response.data
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
                    responseClass: DataResult<[AdoptingAdvert]>.self)
                return response.data
            }catch{
                throw error
            }
    }
}
