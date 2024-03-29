import UIKit

open class CollectionViewController<View: CollectionBasedView>: ViewController<View>, UICollectionViewDataSource, ScrollsToTop {
    
    // MARK: - Properties.
    
    public var sections: [LayoutSection] = []
    public var biggestTopSafeAreaInset: CGFloat = 0
    
    // MARK: - Computed Properties.
    
    open var collectionViewLayout: UICollectionViewLayout {
        let layout =  UICollectionViewCompositionalLayout(sectionProvider: { [weak self] (section, _) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let section = self.sections[section]
            let layoutSection = section.layoutSection(in: self.ui.collectionView)
            
            layoutSection.visibleItemsInvalidationHandler = { [weak self] (visibleItems, contentOffset, environment) in
                self?.handleLayoutChanges(in: section, visibleItems: visibleItems, contentOffset: contentOffset, environment: environment)
            }
            
            return layoutSection
        })
        
        return layout
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
    
    // MARK: - Public Methods.
    
    open func handleLayoutChanges(in section: LayoutSection, visibleItems: [NSCollectionLayoutVisibleItem], contentOffset: CGPoint, environment: NSCollectionLayoutEnvironment) {
        
    }
    
    @discardableResult
    open func scrollToTop(animated: Bool) -> Bool {
        if ui.collectionView.contentOffset.y == -biggestTopSafeAreaInset {
            return false
        }
        else {
            ui.collectionView.setContentOffset(CGPoint(x: 0, y: -biggestTopSafeAreaInset), animated: animated)
            return true
        }
    }
    
    // MARK: - UICollectionViewDataSource.
    
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems()
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sections[indexPath.section].cell(for: collectionView, at: indexPath)
    }
    
}
