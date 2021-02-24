import UIKit

open class CollectionViewController<View: CollectionBasedView, Section: Groundwork.Section>: ViewController<View>, UICollectionViewDataSource {
    
    // MARK: - Properties.
    
    public var sections: [Section] = []
    private var biggestTopSafeAreaInset: CGFloat = 0
        
    // MARK: - Computed Properties.
    
    private var collectionViewLayout: UICollectionViewLayout {
        return UICollectionViewCompositionalLayout(sectionProvider: { (section, _) -> NSCollectionLayoutSection? in
            let section = self.sections[section]
            return section.layoutSection(for: self.ui.collectionView)
        })
    }
    
    // MARK: - Initialization.
    
    public init() {
        super.init()
        ui.collectionView.collectionViewLayout = collectionViewLayout
        ui.collectionView.dataSource = self
    }
    
    // MARK: - Lifecycle.
    
    open override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        self.biggestTopSafeAreaInset = max(ui.safeAreaInsets.top, biggestTopSafeAreaInset)
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
    
}

extension CollectionViewController: ScrollsToTop {
    func scrollToTop(animated: Bool) {
        ui.collectionView.setContentOffset(CGPoint(x: 0, y: -biggestTopSafeAreaInset), animated: animated)
    }
}
