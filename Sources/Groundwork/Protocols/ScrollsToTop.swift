import UIKit

public protocol ScrollsToTop {
    @discardableResult
    func scrollToTop(animated: Bool) -> Bool
}
