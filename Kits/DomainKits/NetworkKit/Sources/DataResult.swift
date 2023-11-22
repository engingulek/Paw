
import Foundation

public struct DataResult<T:Decodable> : Decodable {
    let success : Bool
    let message:String
    var data:T
}
