import UIKit

extension UIAlertController {
    public static func with(message: String, buttonTitle: String = "OK") -> UIAlertController {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .cancel, handler: nil)
        alertController.addAction(action)
        
        return alertController
    }
}
