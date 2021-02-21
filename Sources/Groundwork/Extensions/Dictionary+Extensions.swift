import Foundation
import UIKit

extension Dictionary where Key == NSAttributedString.Key, Value == Any {
    public static func attributes(font: UIFont, textColor: UIColor) -> [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: textColor
        ]
    }
}
