import Foundation
import UIKit

public extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func range(in string: String) -> NSRange {
        guard let range = string.range(of: self) else {
            preconditionFailure()
        }
        
        return NSRange(range, in: string)
    }
    
    func range() -> NSRange? {
        return range(in: self)
    }
}

extension String {
    public static func preferredWidth(for strings: [String], withFont font: UIFont) -> CGFloat {
        var width: CGFloat = 0

        for string in strings {
            let rect = string.boundingRect(
                with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude),
                options: [.usesFontLeading, .usesLineFragmentOrigin],
                attributes: [ .font: font ],
                context: nil
            )

            let calculatedWidth = ceil(rect.width) + 1
            width = Swift.max(calculatedWidth, width)
        }

        return width
    }
}
