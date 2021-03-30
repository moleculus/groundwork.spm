import UIKit

public protocol LayoutSection: LayoutSectionDataSource, LayoutSectionDelegate {
    func layoutGroup(in collectionView: UICollectionView) -> NSCollectionLayoutGroup
    func layoutSection(in collectionView: UICollectionView) -> NSCollectionLayoutSection
}

extension LayoutSection {
    public func layoutGroup(in collectionView: UICollectionView) -> NSCollectionLayoutGroup {
        let itemSize = itemSize(in: collectionView)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = itemInsets(in: collectionView)
        
        return NSCollectionLayoutGroup.vertical(
            layoutSize: itemSize,
            subitems: [item]
        )
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
        
        return layoutSection
    }
}

public protocol LayoutSectionDataSource {
    func numberOfItems() -> Int
    func cell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
    func decorationItems() -> [NSCollectionLayoutDecorationItem]
}

extension LayoutSectionDataSource {
    public func numberOfItems() -> Int {
        return 1
    }
        
    public func decorationItems() -> [NSCollectionLayoutDecorationItem] {
        return []
    }
}

public protocol LayoutSectionDelegate {
    func scrollDirection() -> UICollectionView.ScrollDirection
    func itemSize(in collectionView: UICollectionView) -> NSCollectionLayoutSize
    func itemInsets(in collectionView: UICollectionView) -> NSDirectionalEdgeInsets
    func sectionInsets(in collectionView: UICollectionView) -> NSDirectionalEdgeInsets
}

extension LayoutSectionDelegate {
    public func scrollDirection() -> UICollectionView.ScrollDirection {
        return .vertical
    }
    
    public func itemInsets(in collectionView: UICollectionView) -> NSDirectionalEdgeInsets {
        return .zero
    }
    
    public func sectionInsets(in collectionView: UICollectionView) -> NSDirectionalEdgeInsets {
        return .zero
    }
}
