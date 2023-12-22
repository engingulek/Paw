
import Foundation
import UIKit

struct Theme {
    let themeColor:  ThemeColor
    let themeFont : ThemeFont
    let cellColor : CellColor
}



struct CellColor {
    /// is red
    let primaryBorderColor : UIColor
    /// is red
    let primaryBackColor : UIColor
    /// is white
    let primaryLabelColor : UIColor
    /// is black
    let secondaryBorderColor : UIColor
    /// is white
    let secondaryBackColor : UIColor
    /// is black
    let secondaryLabelColor : UIColor
}

struct ThemeColor {
    /// labelUIColor is red
    let labelUIColor : UIColor
    /// primaryBackColor is white
    let primaryBackColor : UIColor
    /// primaryborferColor
    let primaryBorderColor : CGColor
    /// indicatorColor is black
    let indicatorColor : UIColor
    /// primaryTextColor is black
    let primaryTextColor : UIColor

}

struct ThemeFont {
    let headline : UIFont
    let primaryLabel : UIFont
}


extension Theme {
    static var defaultTheme : Theme {
        return Theme(
            themeColor: ThemeColor(
                labelUIColor: .red,
                primaryBackColor: .white,
                primaryBorderColor: UIColor.red.cgColor,
                indicatorColor: .black, 
                primaryTextColor: .black
                
            ),
            themeFont: ThemeFont(
                headline: .systemFont(ofSize: FontSize.headline),
                primaryLabel: .systemFont(ofSize: FontSize.primaryLabel)
                
            ), 
            cellColor: CellColor(
                primaryBorderColor: .red,
                primaryBackColor: .red,
                primaryLabelColor: .white,
                secondaryBorderColor: .black,
                secondaryBackColor: .white,
                secondaryLabelColor: .black)
        )
    }
}
