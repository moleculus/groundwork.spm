import UIKit

public class LayoutSection {
            
    // MARK: - DataSource.
    
    public func numberOfItems() -> Int {
        return 1
    }
    
    public func cell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        fatalError()
    }
    
    public func decorationItems() -> [NSCollectionLayoutDecorationItem] {
        return []
    }
    
    // MARK: - Layout.
    
    public func scrollDirection() -> UICollectionView.ScrollDirection {
        return .vertical
    }
    
    public func itemSize(in collectionView: UICollectionView) -> NSCollectionLayoutSize {
        fatalError()
    }
    
    public func groupInterItemSpacing() -> NSCollectionLayoutSpacing? {
        return nil
    }
    
    public func groupEdgeSpacing() -> NSCollectionLayoutEdgeSpacing? {
        return nil
    }
    
    public func sectionInsets(in collectionView: UICollectionView) -> NSDirectionalEdgeInsets {
        return .zero
    }
    
    public func sectionInterGroupSpacing() -> CGFloat {
        return 0
    }
    
    public func layoutGroup(in collectionView: UICollectionView) -> NSCollectionLayoutGroup {
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
    
    public func layoutSection(in collectionView: UICollectionView) -> NSCollectionLayoutSection {
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
