
import XCTest

@testable import OnboardingModule
final class OnboardingPresenterUnitTest : XCTestCase {
    var sut : OnboardPresenter!
    var view : MockOnboardingViewController!
    var router : MockOnboardingRouter!
    
    override func setUp() {
        super.setUp()
        view = MockOnboardingViewController()
        router = MockOnboardingRouter()
        sut  = .init(router: router, view: view)
       
    }
    
    override func tearDown() {
        super.tearDown()
        view = nil
        router = nil
        sut = nil
    }
    
    func test_viewDidload_backColor(){
        XCTAssertEqual(view.invokedSetBackColorStatus, false)
        XCTAssertEqual(view.invokedSetBackColorCount, 0)
        
        sut.viewDidLoad()
        
        XCTAssertEqual(view.invokedSetBackColorStatus, true)
        XCTAssertEqual(view.invokedSetBackColorCount, 1)
        XCTAssertEqual(view.invokedSetBackColor.map(\.color), .white)
        
    }
    
    func test_viewDidLoad_PresentViewControllerAble(){
        
        // MockMockOnboardingRouter
        XCTAssertEqual(router.invokedToTabbarContoller, false)
        XCTAssertEqual(router.invokedToTabbarContollerCount, 0)
        
        sut.selectedAdoptingView()
        
        // MockMockOnboardingRouter
        XCTAssertEqual(router.invokedToTabbarContoller, true)
        XCTAssertEqual(router.invokedToTabbarContollerCount, 1)
    }
    
    
    
    
}
