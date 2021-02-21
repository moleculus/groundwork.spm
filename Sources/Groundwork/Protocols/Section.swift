import UIKit

public protocol Section {
    func numberOfItems(in collectionView: UICollectionView) -> Int
    func sizeForItemAt(in collectionView: UICollectionView) -> (size: NSCollectionLayoutSize, sectionInsets: NSDirectionalEdgeInsets)
    func cellForItemAt(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell
    func scrollDirection(in collectionView: UICollectionView) -> UICollectionView.ScrollDirection
    func layoutGroup(for collectionView: UICollectionView) -> NSCollectionLayoutGroup
    func layoutSection(for collectionView: UICollectionView) -> NSCollectionLayoutSection
}

extension Section {
    public func scrollDirection(in collectionView: UICollectionView) -> UICollectionView.ScrollDirection {
        return .vertical
    }
    
    public func layoutGroup(for collectionView: UICollectionView) -> NSCollectionLayoutGroup {
        let itemSize = sizeForItemAt(in: collectionView).size
        let sectionInsets = sizeForItemAt(in: collectionView).sectionInsets
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let layoutSize = NSCollectionLayoutSize(
            widthDimension: itemSize.widthDimension,
            heightDimension: itemSize.heightDimension
        )
    
        switch scrollDirection(in: collectionView) {
        case .horizontal:
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize, subitems: [item])
            group.contentInsets = sectionInsets
            return group
        case .vertical:
            let group = NSCollectionLayoutGroup.vertical(layoutSize: layoutSize, subitems: [item])
            group.contentInsets = sectionInsets
            return group
        default:
            preconditionFailure()
        }
    }
    
    public func layoutSection(for collectionView: UICollectionView) -> NSCollectionLayoutSection {
        let group = layoutGroup(for: collectionView)
        let section = NSCollectionLayoutSection(group: group)
        
        switch scrollDirection(in: collectionView) {
        case .horizontal:
            section.orthogonalScrollingBehavior = .continuous
        case .vertical:
            section.orthogonalScrollingBehavior = .none
        default:
            preconditionFailure()
        }
        
        return section
    }
}
