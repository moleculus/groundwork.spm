import UIKit

extension UIColor {
    public static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
}

extension UIColor {
    public static func background(_ backgroundColor: BackgroundColor) -> UIColor {
        return UIColor { (traitCollection) -> UIColor in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return backgroundColor.dark
            default:
                return backgroundColor.light
            }
        }
    }
    
    public static func tint(_ tintColor: TintColor) -> UIColor {
        return UIColor { (traitCollection) -> UIColor in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return tintColor.dark
            default:
                return tintColor.light
            }
        }
    }
    
    public static func text(_ textColor: TintColor) -> UIColor {
        return UIColor { (traitCollection) -> UIColor in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return textColor.dark
            default:
                return textColor.light
            }
        }
    }
    
    public static func border(_ borderColor: TintColor) -> UIColor {
        return UIColor { (traitCollection) -> UIColor in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return borderColor.dark
            default:
                return borderColor.light
            }
        }
    }
    
    public static func system(_ systemColor: TintColor) -> UIColor {
        return UIColor { (traitCollection) -> UIColor in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return systemColor.dark
            default:
                return systemColor.light
            }
        }
    }
}
