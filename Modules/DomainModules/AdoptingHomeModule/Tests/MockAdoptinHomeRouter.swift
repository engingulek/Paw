
import Foundation

@testable import AdoptingHomeModule

final class MockAdoptinHomeRouter : AdoptingRouterInterface {
    var invokedToAdvertDetail = false
    var invokedToAdvertDetailCount = 0
    func toAdvertDetail(view:AdoptingHomeViewControllerInterfaca?) {
        invokedToAdvertDetail = true
        invokedToAdvertDetailCount += 1
    }
    
    
}
