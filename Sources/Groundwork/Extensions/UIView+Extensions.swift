import UIKit
import SnapKit

extension UIView {
    public static func animate(with keyboard: Keyboard, animations: @escaping () -> Void) {
        UIView.animate(withDuration: keyboard.duration, delay: 0, options: keyboard.options, animations: animations, completion: nil)
    }
    
    public func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20, 20, -20, 20, -10, 10, -5, 5, 0]

        layer.add(animation, forKey: "shake")
    }
    
    public func addSubview(_ subview: UIView, then completion: (ConstraintMaker) -> Void) {
        addSubview(subview)
        subview.snp.makeConstraints(completion)
    }
}
