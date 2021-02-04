import UIKit

public protocol Reusable {
    static var reuseIdentifier: String { get }
    func prepareForReuse()
}

extension UIView: Reusable {
    @objc open func prepareForReuse() {}
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
