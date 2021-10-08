import UIKit

open class CollectionBasedView: UIView {
    
    // MARK: - UI Properties.
    
    public let collectionView = UICollectionView(direction: .vertical).then {
        $0.alwaysBounceVertical = true
        $0.preservesSuperviewLayoutMargins = true
    }
    
    public let header = UIView(frame: .zero).then {
        $0.backgroundColor = .clear
    }
    
    // MARK: - Initialization.
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubview(collectionView) {
            $0.edges.equalTo(self)
        }
        
        addSubview(header) {
            $0.top.equalTo(self)
            $0.leading.equalTo(self)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.top)
            $0.trailing.equalTo(self)
        }
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
