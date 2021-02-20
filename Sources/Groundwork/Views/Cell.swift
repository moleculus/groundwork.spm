import UIKit
import SnapKit

public class Cell<CustomView>: UICollectionViewCell where CustomView: UIView {
    
    // MARK: - UI Properties.
    
    public let customView: CustomView
    private var widthConstraint: Constraint?
    private var heightConstraint: Constraint?
    
    // MARK: - Observed Properties.
    
    public var size: Size? {
        didSet {
            guard let size = size else {
                widthConstraint?.deactivate()
                heightConstraint?.deactivate()
                return
            }
            
            switch size.width {
            case .absolute (let width):
                customView.snp.updateConstraints {
                    $0.width.equalTo(width)
                }
                
                widthConstraint?.activate()
            case .flexible:
                widthConstraint?.deactivate()
            }
            
            switch size.height {
            case .absolute (let height):
                customView.snp.updateConstraints {
                    $0.height.equalTo(height)
                }
                
                heightConstraint?.activate()
            default:
                heightConstraint?.deactivate()
            }
        }
    }
        
    // MARK: - Initialization.
    
    public override init(frame: CGRect) {
        self.customView = CustomView(frame: frame)
        super.init(frame: frame)
        
        backgroundColor = .clear
        clipsToBounds = false
        preservesSuperviewLayoutMargins = true
        contentView.preservesSuperviewLayoutMargins = true
        customView.preservesSuperviewLayoutMargins = true
        
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
            self.widthConstraint = $0.width.equalTo(0).constraint
            self.heightConstraint = $0.height.equalTo(0).constraint
        }
        
        widthConstraint?.deactivate()
        heightConstraint?.deactivate()
    }
    
    @available(*, unavailable, message: "Loading this view from a nib is unsupported")
    public required init?(coder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported")
    }
    
    // MARK: - Lifecycle.
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        customView.prepareForReuse()
    }
        
}
