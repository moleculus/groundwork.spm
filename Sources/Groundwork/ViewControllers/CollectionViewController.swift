import UIKit

open class CollectionViewController<Section: Groundwork.Section>: ViewController<CollectionBasedView>, UICollectionViewDataSource {
    
    // MARK: - Properties.
    
    public var sections: [Section] = []
        
    // MARK: - Initialization.
    
    public init() {
        super.init()
        ui.collectionView.dataSource = self
        
        let flowLayout = ui.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }
    
    // MARK: - UICollectionViewDataSource
    
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems(in: collectionView)
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("HELLPO")
        let cell = sections[indexPath.section].cellForItemAt(at: indexPath, in: collectionView) as! Cell
        cell.size = sections[indexPath.section].sizeForItemAt(at: indexPath, in: collectionView)
        return cell
    }
        
}
