import UIKit

extension UIBarButtonItem {
    public func setFont(_ font: UIFont, colored color: UIColor) {
        let attributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color
        ]

        setAttributes(attributes)
    }
    
    public func setAttributes(_ attributes: [NSAttributedString.Key: Any]) {
        setTitleTextAttributes(attributes, for: .normal)
        setTitleTextAttributes(attributes, for: .highlighted)
        setTitleTextAttributes(attributes, for: .focused)
        setTitleTextAttributes(attributes, for: .disabled)
    }
    
    public func addAction(_ action: Selector, for target: AnyObject) {
        self.target = target
        self.action = action
    }
    
}
