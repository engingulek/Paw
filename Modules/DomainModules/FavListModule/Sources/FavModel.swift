import Foundation

// MARK: - FavAdvert
struct FavAdvert: Codable {
    let id, advertId: Int
    let images: [String]
    let name, gender, genus, category: String
    let age: Int
    let city, district: String
}
