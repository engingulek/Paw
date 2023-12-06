
import Foundation

public struct DataResult<T:Decodable> : Decodable {
    let success : Bool
    let message:String
   public var data:T
}


public struct DeleteResult : Decodable {
    let success : Bool
    let message:String
}
