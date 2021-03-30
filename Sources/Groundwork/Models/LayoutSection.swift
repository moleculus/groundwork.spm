import UIKit

open class LayoutSection {
    
    // MARK: - Properties.
    
    public var backgroundColor: UIColor = .clear
        
    // MARK: - Initialization.
    
    public init() {}
    
    // MARK: - Public Methods.
    
    open func numberOfItems() -> Int {
        return 1
    }

    open func cell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        fatalError("Subclasses must provide their own implementation of this method")
    }
    
    open func scrollDirection(collectionView: UICollectionView) -> UICollectionView.ScrollDirection {
        return .vertical
    }
    
    open func itemSize(collectionView: UICollectionView) -> NSCollectionLayoutSize {
        return NSCollectionLayoutSize(
            widthDimension: .absolute(collectionView.bounds.width),
            heightDimension: .estimated(0)
        )
    }
    
    open func itemInsets(collectionView: UICollectionView) -> NSDirectionalEdgeInsets {
        return .zero
    }
    
    open func sectionInsets(collectionView: UICollectionView) -> NSDirectionalEdgeInsets {
        return .zero
    }
        
    open func layoutGroup(collectionView: UICollectionView) -> NSCollectionLayoutGroup {
        let itemSize = itemSize(collectionView: collectionView)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = itemInsets(collectionView: collectionView)
        
        return NSCollectionLayoutGroup.vertical(
            layoutSize: itemSize,
            subitems: [item]
        )
    }
    
    open func decorationItems(collectionView: UICollectionView) -> [NSCollectionLayoutDecorationItem] {
        return []
    }
    
    open func layoutSection(collectionView: UICollectionView) -> NSCollectionLayoutSection {
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup(collectionView: collectionView))
        layoutSection.contentInsets = sectionInsets(collectionView: collectionView)
        layoutSection.decorationItems = decorationItems(collectionView: collectionView)
        
        switch scrollDirection(collectionView: collectionView) {
        case .horizontal:
            layoutSection.orthogonalScrollingBehavior = .groupPaging
        case .vertical:
            layoutSection.orthogonalScrollingBehavior = .none
        default:
            preconditionFailure()
        }
        
        return layoutSection
    }
}
