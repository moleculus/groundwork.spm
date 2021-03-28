import UIKit

public let defaultMargins: NSDirectionalEdgeInsets = {
    let window = UIWindow()
    let vc = UIViewController()
    window.rootViewController = vc
    window.makeKeyAndVisible()
    
    return vc.view.directionalLayoutMargins
}()


extension NSDirectionalEdgeInsets {
    public static var `default`: NSDirectionalEdgeInsets = {
        return defaultMargins
    }()
}
