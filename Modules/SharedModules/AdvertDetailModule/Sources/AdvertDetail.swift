

import Foundation

// MARK: - AdvertDetail
struct AdvertDetail: Codable {
    let id: Int
    let images: [String]
    let name, gender, genus, category: String
    let age: Int
    let city, about: String
    let userId: Int
    let userImage,userName, userSurname: String
    let favStatus:Bool
}
