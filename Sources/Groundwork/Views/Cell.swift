import UIKit
import SnapKit

public class Cell<CustomView>: UICollectionViewCell where CustomView: UIView {
    
    // MARK: - UI Properties.
    
    public let customView: CustomView
        
    // MARK: - Initialization.
    
    public override init(frame: CGRect) {
        self.customView = CustomView(frame: frame)
        super.init(frame: frame)
        
        backgroundColor = .clear
        clipsToBounds = false
        preservesSuperviewLayoutMargins = true
        translatesAutoresizingMaskIntoConstraints = false
        
        contentView.preservesSuperviewLayoutMargins = true
                
        customView.preservesSuperviewLayoutMargins = true
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(customView)
        customView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
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
