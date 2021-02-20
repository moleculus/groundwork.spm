import UIKit

open class ViewController<UI: UIView>: UIViewController {
    
    // MARK: - UI Properties.
    
    open var ui = UI(frame: .zero)
        
    // MARK: - Computed Properties.
    
    open var hidesKeyboardOnTouch: Bool {
        return false
    }
    
    // MARK: - Initialization.
    
    public init(then completion: ((_ viewController: ViewController) -> Void)? = nil) {
        super.init(nibName: nil, bundle: nil)
        
        if #available(iOS 14.0, *) {
            navigationItem.backButtonDisplayMode = .minimal
        }
        else {
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.cancelsTouchesInView = false
        ui.addGestureRecognizer(tapGesture)
        
        completion?(self)
    }
    
    @available(*, unavailable, message: "Loading this controller from a nib is unsupported")
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this controller from a nib is unsupported")
    }
    
    // MARK: - Lifecycle.
    
    public override func loadView() {
        super.loadView()
        view = ui
        ui.frame = parent?.view.frame ?? presentingViewController?.view.frame ?? CGRect(x: 0, y: 0, width: 375, height: 812)
    }
        
    // MARK: - User Interaction.
    
    @objc
    private func handleTap(_ tapGesture: UITapGestureRecognizer) {
        guard hidesKeyboardOnTouch else {
            return
        }
        
        ui.endEditing(true)
    }
    
}
