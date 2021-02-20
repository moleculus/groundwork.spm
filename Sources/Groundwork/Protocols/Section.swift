import UIKit

public protocol Section {
    func numberOfItems(in collectionView: UICollectionView) -> Int
    func sizeForItemAt(at indexPath: IndexPath, in collectionView: UICollectionView) -> Size
    func cellForItemAt(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell
}
