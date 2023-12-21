import Foundation
import UIKit
import SnapKit

final class AccountActionViewController : UIViewController {
    
    public override func loadView() {
        let accountActionView = AccountActionView()
        view = accountActionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

