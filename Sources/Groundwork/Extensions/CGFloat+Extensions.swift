import UIKit

extension CGFloat {
    public static func minimalSpacing(multipliedBy multiplier: CGFloat = 1) -> CGFloat {
        return 4 * multiplier
    }
    
    public static var defaultInset: CGFloat {
        return NSDirectionalEdgeInsets.default.leading
    }
}
