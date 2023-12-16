
import Foundation
import NetworkKit
import ModelKit

protocol CreateAdvertInteractorInterface {
    func addAdvertToAdvertList(parameters : [String:Any]) async throws
    func fetchCategories() async throws -> [CategoryResult]
    
}

final class CreateAdvertInteractor : CreateAdvertInteractorInterface {
   
    static let shared = CreateAdvertInteractor()
    func addAdvertToAdvertList(parameters : [String:Any]) async throws {
        /*print("images data \(imagesData)")
        let testData : [Data] = []
        let parameters : [String:Any] = [
            "images":imagesData,
            "name": "Test",
            "genus":"testGenys",
            "categoryid":1,
            "age":2,
            "gender":"testgender",
            "city" :"Test",
            "district":"Test",
            "about":"Test",
            "userid":1,
           
        ]*/
        
        do{
            _ = try await NetworkManager.shared.fetch(
                target: .addAdvertToAdvertList(parameters), responseClass: DeleteResult.self
                 )
           
        }catch{
            print("Create Interactor error \(error.localizedDescription)")
            throw error
        }
    }
    
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
    
    
    
}
