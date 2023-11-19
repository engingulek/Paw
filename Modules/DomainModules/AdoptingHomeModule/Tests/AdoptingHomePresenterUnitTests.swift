
import XCTest
@testable import AdoptingHomeModule

final class AdoptingHomePresenterUnitTests : XCTest {
    var sut : AdoptinHomePresenter!
    var view : MockAdoptingHomeViewController!
    var router : MockAdoptinHomeRouter!
    
    
    override func setUp()  {
        super.setUp()
        view = MockAdoptingHomeViewController()
        router = MockAdoptinHomeRouter()
        sut = .init(router: router, view: view)
    }
    
    override func tearDown() {
        super.tearDown()
        view = nil
        router = nil
        sut = nil
    }
    
    func test_viewDidload_backColor_ReturnWhite(){
        XCTAssertEqual(view.invokedSetBackColorStatus, false)
        XCTAssertEqual(view.invokedSetBackColorCount, 0)
        
        sut.viewDidload()
        
        XCTAssertEqual(view.invokedSetBackColorStatus, true)
        XCTAssertEqual(view.invokedSetBackColorCount, 1)
        XCTAssertEqual(view.invokedSetBackColor.map(\.color), .white)
    }
    
    func test_viewDidLoad_navigationBackButtonHidden_ReturnTrue(){
        XCTAssertEqual(view.invokedNavigaitonBackButtonHiddenStatus, false)
        XCTAssertEqual(view.invokedNavigaitonBackButtonHiddenCount, 0)
        
        sut.viewDidload()
        
        XCTAssertEqual(view.invokedNavigaitonBackButtonHiddenStatus, true)
        XCTAssertEqual(view.invokedNavigaitonBackButtonHiddenCount, 1)
        XCTAssertEqual(view.invokedNavigaitonBackButtonHidden.map(\.isHidden), true)
    }
    
    func test_viewDidload_prepareCollectionView(){
        XCTAssertEqual(view.invokedPreapareCollectionView, false)
        XCTAssertEqual(view.invokedPreapareCollectionViewCount, 0)
        
        sut.viewDidload()
        
        XCTAssertEqual(view.invokedPreapareCollectionView, true)
        XCTAssertEqual(view.invokedPreapareCollectionViewCount, 1)
    }
    
    
    func test_viewDidload_prepareTableView(){
        XCTAssertEqual(view.invokedPreapareTableView, false)
        XCTAssertEqual(view.invokedPreapareTableViewCount, 0)
        
        sut.viewDidload()
        
        XCTAssertEqual(view.invokedPreapareTableView, true)
        XCTAssertEqual(view.invokedPreapareTableViewCount, 1)
    }
    
    func test_viewWillAppear_tabbarisHidden_ReturnFalse(){
        XCTAssertEqual(view.invokedTabbarIsHiddenStatus, false)
        XCTAssertEqual(view.invokedTabbarIsHiddenCount, 0)
        
        sut.viewWillAppear()
        
        XCTAssertEqual(view.invokedTabbarIsHiddenStatus, true)
        XCTAssertEqual(view.invokedTabbarIsHiddenCount, 1)
        XCTAssertEqual(view.invokedTabbarIsHidden.map(\.isHidden), false)
    }
    
    func test_disSelectItem_toAdvertDetail(){
        XCTAssertEqual(view.invokedPushViewControllerAbleStatus, false)
        XCTAssertEqual(view.invokedPushViewControllerAbleCount, 0)
        
        sut.didSelectItem(index: 0)
        
        XCTAssertEqual(view.invokedPushViewControllerAbleStatus, false)
        XCTAssertEqual(view.invokedPushViewControllerAbleCount, 0)
    }
    
}
