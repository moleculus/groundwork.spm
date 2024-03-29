import Foundation
import UIKit

extension Dictionary where Key == NSAttributedString.Key, Value == Any {
    public static func attributes(font: UIFont, textColor: UIColor) -> [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: textColor
        ]
    }
    
    public static func links(withColor color: UIColor) -> [NSAttributedString.Key: Any] {
        return [
            .foregroundColor: color,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
    }
}
