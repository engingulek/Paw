

import Foundation

// MARK: - Category
public struct CategoryResult : Codable {
   public init(id: Int, category: String) {
        self.id = id
        self.category = category
    }
   public let id : Int
   public let category : String
}
