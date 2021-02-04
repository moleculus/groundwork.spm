import UIKit

public protocol Customizable {
    associatedtype Object: NSObject
    func then(_ completion: (Object) -> Void) -> Object
}

extension Customizable where Self: NSObject {
    public func then(_ completion: (Self) -> Void) -> Self {
        completion(self)
        return self
    }
}

extension UIView: Customizable {
    public func then(_ completion: (UIView) -> Void) -> UIView {
        backgroundColor = .clear
        preservesSuperviewLayoutMargins = true
        completion(self)
        return self
    }
}
