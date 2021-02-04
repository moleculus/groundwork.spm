import UIKit

public class Separator: UIView {
    
    // MARK: - Computed Properties.
    
    public override var intrinsicContentSize: CGSize {
        #if targetEnvironment(macCatalyst)
        return CGSize(width: 1, height: 1)
        #else
        return CGSize(width: 1 / UIScreen.main.scale, height: 1 / UIScreen.main.scale)
        #endif
    }
    
    // MARK: - Initialization.
            
    init() {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable, message: "Loading this view from a nib is unsupported")
    public required init?(coder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported")
    }
    
}
