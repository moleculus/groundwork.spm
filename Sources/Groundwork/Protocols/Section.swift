import UIKit

public protocol Section {
    func numberOfItems(in collectionView: UICollectionView) -> Int
    func sizeForItemAt(in collectionView: UICollectionView) -> NSCollectionLayoutSize
    func itemInsets(in collectionView: UICollectionView) -> NSDirectionalEdgeInsets
    func sectionInset(in collectionView: UICollectionView) -> NSDirectionalEdgeInsets
    func cellForItemAt(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell
    func decorationItems() -> [NSCollectionLayoutDecorationItem]
    func scrollDirection(in collectionView: UICollectionView) -> UICollectionView.ScrollDirection
    func layoutGroup(for collectionView: UICollectionView) -> NSCollectionLayoutGroup
    func layoutSection(for collectionView: UICollectionView) -> NSCollectionLayoutSection
}

extension Section {
    public func scrollDirection(in collectionView: UICollectionView) -> UICollectionView.ScrollDirection {
        return .vertical
    }
    
    public func layoutGroup(for collectionView: UICollectionView) -> NSCollectionLayoutGroup {
        let itemSize = sizeForItemAt(in: collectionView)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = itemInsets(in: collectionView)
        
        let layoutSize = NSCollectionLayoutSize(
            widthDimension: itemSize.widthDimension,
            heightDimension: itemSize.heightDimension
        )
    
        switch scrollDirection(in: collectionView) {
        case .horizontal:
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize, subitems: [item])
            return group
        case .vertical:
            let group = NSCollectionLayoutGroup.vertical(layoutSize: layoutSize, subitems: [item])
            return group
        default:
            preconditionFailure()
        }
    }
    
    public func itemInsets(in collectionView: UICollectionView) -> NSDirectionalEdgeInsets {
        return .zero
    }
    
    public func sectionInsets(in collectionView: UICollectionView) -> NSDirectionalEdgeInsets {
        return .zero
    }
    
    public func decorationItems() -> [NSCollectionLayoutDecorationItem] {
        return []
    }
    
    public func layoutSection(for collectionView: UICollectionView) -> NSCollectionLayoutSection {
        let group = layoutGroup(for: collectionView)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = sectionInsets(in: collectionView)
        section.decorationItems = decorationItems()
        
        switch scrollDirection(in: collectionView) {
        case .horizontal:
            section.orthogonalScrollingBehavior = .groupPaging
        case .vertical:
            section.orthogonalScrollingBehavior = .none
        default:
            preconditionFailure()
        }
        
        return section
    }
}
