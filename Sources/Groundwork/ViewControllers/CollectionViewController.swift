import UIKit

open class CollectionViewController<Section: Groundwork.Section>: ViewController<CollectionBasedView>, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    // MARK: - Properties.
    
    public var sections: [Section] = []
        
    // MARK: - Initialization.
    
    public init() {
        super.init()
        ui.collectionView.dataSource = self
        ui.collectionView.delegate = self
    }
    
    // MARK: - UICollectionViewDataSource.
    
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems(in: collectionView)
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sections[indexPath.section].cellForItemAt(at: indexPath, in: collectionView)
    }
    
    // MARK: - UICollectionViewDelegate.
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
    
    // MARK: - UICollectionViewDelegateFlowLayout.
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sections[indexPath.section].sizeForItemAt(at: indexPath, in: collectionView)
    }
    
}
