import UIKit

extension UIAction {
    public convenience init(handler: @escaping UIActionHandler) {
        self.init(title: "", handler: handler)
    }
}
