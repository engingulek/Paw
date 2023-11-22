

import Foundation

// MARK: - AdoptingAdvert
struct AdoptingAdvert: Codable {
    let id: Int
    let images: [String]
    let name, gender, genus, category: String
    let age: Int
    let city, district: String
}
