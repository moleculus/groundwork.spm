import UIKit

public class CollectionBasedView: UIView {
    
    // MARK: - UI Properties.
    
    public let collectionView = UICollectionView(direction: .vertical).then {
        $0.alwaysBounceVertical = true
        $0.preservesSuperviewLayoutMargins = true
    }
    
    // MARK: - Initialization.
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubview(collectionView) {
            $0.edges.equalTo(self)
        }
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
