import XCTest
@testable import AdvertDetailModule

final class AdvertDetailPresenterUnitTest : XCTest {
    var sut : AdvertDetailPresenter!
    var view : MockAdvertDetailController!
    var advertDetailImages : MockAdvertDetailImages!
    var router : MockAdvertDetailRouter!
    
    
    override func setUp() {
        super.setUp()
        view = MockAdvertDetailController()
        router = MockAdvertDetailRouter()
        advertDetailImages = MockAdvertDetailImages()
        sut = .init(
            router: router,
            view: view,
            advertDetailImageView: advertDetailImages)
    }
    
    func test_viewDidload_backColor_ReturnWhite(){
        XCTAssertEqual(view.invokedSetBackColorStatus, false)
        XCTAssertEqual(view.invokedSetBackColorCount, 0)
        
        sut.viewDidLoad()
        
        XCTAssertEqual(view.invokedSetBackColorStatus, true)
        XCTAssertEqual(view.invokedSetBackColorCount, 1)
        XCTAssertEqual(view.invokedSetBackColor.map(\.color), .white)
    }
    
    func test_viewDidLoad_navigationBackButtonHidden_ReturnTrue(){
        XCTAssertEqual(view.invokedNavigaitonBackButtonHiddenStatus, false)
        XCTAssertEqual(view.invokedNavigaitonBackButtonHiddenCount, 0)
        
        sut.viewDidLoad()
        
        XCTAssertEqual(view.invokedNavigaitonBackButtonHiddenStatus, false)
        XCTAssertEqual(view.invokedNavigaitonBackButtonHiddenCount, 1)
        XCTAssertEqual(view.invokedNavigaitonBackButtonHidden.map(\.isHidden), false)
    }
    
    func test_viewDidLoad_tabbarisHidden_ReturnFalse(){
        XCTAssertEqual(view.invokedTabbarIsHiddenStatus, false)
        XCTAssertEqual(view.invokedTabbarIsHiddenCount, 0)
        
        sut.viewDidLoad()
        
        XCTAssertEqual(view.invokedTabbarIsHiddenStatus, true)
        XCTAssertEqual(view.invokedTabbarIsHiddenCount, 1)
        XCTAssertEqual(view.invokedTabbarIsHidden.map(\.isHidden), true)
    }
    
    func test_selectedADIOne_ReturnOpacityDefaultOpacity() {
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageOneStatus,false )
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageOneCount,0)
        
        sut.selectedADIOne()
        
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageOneStatus,true )
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageOneCount,1)
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageOne.map(\.opacity), 0.50)
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageOne.map(\.defaultOpacity), 1)
    }
    
    
    func test_selectedADITwo_ReturnOpacityDefaultOpacity() {
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageTwoStatus,false)
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageTwoCount,0)
        
        sut.selectedADITwo()
        
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageTwoStatus,true)
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageTwoCount,1)
        
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageTwo.map(\.opacity), 0.50)
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageTwo.map(\.defaultOpacity), 1)
        
    }
    
    func test_selectedADIThree_ReturnOpacityDefaultOpacity() {
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageThreeStatus,false)
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageThreeCount,0)
        
        sut.selectedADIThree()
        
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageThreeStatus,true)
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageThreeCount,1)
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageThree.map(\.opacity), 0.50)
        XCTAssertEqual(advertDetailImages.invokedchangeOpacityWhenSelectedImageThree.map(\.defaultOpacity), 1)
    }
}
