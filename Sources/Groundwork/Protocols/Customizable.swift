import UIKit

public protocol Customizable {
    associatedtype T
    func then(_ completion: (T) -> Void) -> T
}

extension Customizable {
    public func then(_ completion: (Self) -> Void) -> Self {
        completion(self)
        return self
    }
}

extension NSObject: Customizable {}

extension UIView {
    public func then(_ completion: (Self) -> Void) -> Self {
        preservesSuperviewLayoutMargins = true
        backgroundColor = .clear
        completion(self)
        return self
    }
}
