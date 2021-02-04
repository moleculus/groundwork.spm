import UIKit

public extension UINavigationController {
    convenience init(rootViewController: UIViewController, options: Set<Option>) {
        self.init(rootViewController: rootViewController)
        
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
        for option in options {
            switch option {
            case .largeTitleDisplayMode (let mode):
                navigationItem.largeTitleDisplayMode = mode
                navigationBar.prefersLargeTitles = (mode == .always) ? true : false
            case .backButton (let image):
                navigationBar.backIndicatorImage = image
                navigationBar.backIndicatorTransitionMaskImage = image
            case .tintColor (let color):
                navigationBar.tintColor = color
            case .titleColor (let color):
                navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor: color ]
            }
        }
    }

}

public extension UINavigationController {
    enum Option: Hashable {
        case largeTitleDisplayMode (UINavigationItem.LargeTitleDisplayMode )
        case backButton (UIImage)
        case tintColor (UIColor)
        case titleColor (UIColor)
    }
}
