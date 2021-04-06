import UIKit

open class CollectionViewController<View: CollectionBasedView>: ViewController<View>, UICollectionViewDataSource, ScrollsToTop {
    
    // MARK: - Properties.
    
    public var biggestTopSafeAreaInset: CGFloat = 0
    
    // MARK: - Observed Properties.
    
    public var sections: [LayoutSection<UIView>] = [] {
        didSet {
            for section in sections {
                section.registerReusableView(in: ui.collectionView)
            }
        }
    }
        
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
    
    open func handleLayoutChanges(in section: LayoutSection<UIView>, visibleItems: [NSCollectionLayoutVisibleItem], contentOffset: CGPoint, environment: NSCollectionLayoutEnvironment) {
        
    }
    
    open func scrollToTop(animated: Bool) {
        ui.collectionView.setContentOffset(CGPoint(x: 0, y: -biggestTopSafeAreaInset), animated: animated)
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
