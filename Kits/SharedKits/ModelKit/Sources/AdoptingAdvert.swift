
import Foundation

// MARK: - AdoptingAdvert
public struct AdoptingAdvert: Codable {
    public let id: Int
    public let images: [String]
    public let name, gender, genus, category: String
    public let age: Int
    public let city: String
}


