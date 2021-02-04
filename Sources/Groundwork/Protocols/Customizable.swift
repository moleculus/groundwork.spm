import UIKit

public protocol Customizable {
    associatedtype T
    func then(preservesSuperviewLayoutMargins: Bool, _ completion: (T) -> Void) -> T
}

extension Customizable {
    public func then(preservesSuperviewLayoutMargins: Bool = true, _ completion: (Self) -> Void) -> Self {
        if let view = self as? UIView {
            view.preservesSuperviewLayoutMargins = true
        }
        
        if let view = self as? UIScrollView {
            view.preservesSuperviewLayoutMargins = true
        }
        
        if let view = self as? UITableView {
            view.preservesSuperviewLayoutMargins = true
        }
        
        if let view = self as? UIScrollView {
            view.preservesSuperviewLayoutMargins = true
        }
        
        completion(self)
        return self
    }
}

extension NSObject: Customizable {}
