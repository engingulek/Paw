
import Foundation
import UIKit

struct Theme {
    let themeColor:  ThemeColor
    let themeFont : ThemeFont
}


struct ThemeColor {
    /// labelUIColor is red
    let labelUIColor : UIColor
    /// primaryBackColor is white
    let primaryBackColor : UIColor
    /// primaryborferColor
    let primaryBorderColor : CGColor
}

struct ThemeFont {
    let headline : UIFont
}


extension Theme {
    static var defaultTheme : Theme {
        return Theme(
            themeColor: ThemeColor(
                labelUIColor: .red,
                primaryBackColor: .white,
                primaryBorderColor: UIColor.red.cgColor
                
            ),
            themeFont: ThemeFont(
                headline: .systemFont(ofSize: FontSize.headline)
            )
        )
    }
}
