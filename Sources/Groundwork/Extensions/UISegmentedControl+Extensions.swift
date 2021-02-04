import UIKit

extension UISegmentedControl {
    @available(iOS 14.0, *)
    public func addActions<T: Tab>(for tabs: [T], then completion: @escaping (T) -> Void) {
        for tab in tabs.reversed() {
            let action = UIAction(title: tab.title) { (_) in
                completion(tab)
            }
                        
            insertSegment(action: action, at: 0, animated: false)
        }
        
        selectedSegmentIndex = 0
    }
}
