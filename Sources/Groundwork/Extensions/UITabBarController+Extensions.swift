import UIKit

extension UITabBarController {
    public convenience init(viewControllers: [UIViewController], selectedTintColor: UIColor, unselectedTintColor: UIColor) {
        self.init(nibName: nil, bundle: nil)
        
        self.viewControllers = viewControllers
        tabBar.tintColor = selectedTintColor
        tabBar.unselectedItemTintColor = unselectedTintColor
    }
}
