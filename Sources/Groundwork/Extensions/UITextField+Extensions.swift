import UIKit

extension UITextField {
    public func setPlaceholder(_ placeholder: String?, placeholderColor: UIColor) {
        guard let placeholder = placeholder else {
            self.placeholder = nil
            self.attributedPlaceholder = nil
            return
        }
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: placeholderColor,
            .font: font as Any
        ]
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }
}
