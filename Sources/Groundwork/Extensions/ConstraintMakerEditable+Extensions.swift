import UIKit
import SnapKit

public extension ConstraintMakerEditable {
    @discardableResult
    func inset(_ amount: CGFloat) -> ConstraintMakerEditable {
        return inset(amount as ConstraintInsetTarget)
    }
}
