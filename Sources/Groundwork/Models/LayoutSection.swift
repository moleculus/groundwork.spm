import UIKit

open class LayoutSection {
    
    // MARK: - Initialization.
    
    public init() {}
            
    // MARK: - DataSource.
    
    open func numberOfItems() -> Int {
        return 1
    }
    
    open func cell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        fatalError()
    }
    
    open func decorationItems() -> [NSCollectionLayoutDecorationItem] {
        return []
    }
    
    // MARK: - Layout.
    
    open func scrollDirection() -> UICollectionView.ScrollDirection {
        return .vertical
    }
    
    open func itemSize(in collectionView: UICollectionView) -> NSCollectionLayoutSize {
        fatalError()
    }
    
    open func groupInterItemSpacing() -> NSCollectionLayoutSpacing? {
        return nil
    }
    
    open func groupEdgeSpacing() -> NSCollectionLayoutEdgeSpacing? {
        return nil
    }
    
    open func sectionInsets(in collectionView: UICollectionView) -> NSDirectionalEdgeInsets {
        return .zero
    }
    
    open func sectionInterGroupSpacing() -> CGFloat {
        return 0
    }
    
    open func layoutGroup(in collectionView: UICollectionView) -> NSCollectionLayoutGroup {
        let itemSize = self.itemSize(in: collectionView)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: itemSize,
            subitems: [item]
        )
        
        group.interItemSpacing = groupInterItemSpacing()
        group.edgeSpacing = groupEdgeSpacing()
        
        return group
    }
    
    open func layoutSection(in collectionView: UICollectionView) -> NSCollectionLayoutSection {
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup(in: collectionView))
        layoutSection.contentInsets = sectionInsets(in: collectionView)
        layoutSection.decorationItems = decorationItems()
        
        switch scrollDirection() {
        case .horizontal:
            layoutSection.orthogonalScrollingBehavior = .groupPaging
        case .vertical:
            layoutSection.orthogonalScrollingBehavior = .none
        default:
            preconditionFailure()
        }
        
        layoutSection.interGroupSpacing = sectionInterGroupSpacing()
        
        return layoutSection
    }
        
}
