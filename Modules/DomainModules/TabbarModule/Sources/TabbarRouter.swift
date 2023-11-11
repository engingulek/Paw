import UIKit
import TabbarModuleInterface



public final class TabbarRouter : TabbarModuleInterface {
    public init() {}
    public func tabbarViewController() -> UIViewController {
        let view = TabbarController()
        return view
    }
}
