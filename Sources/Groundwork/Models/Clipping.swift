import UIKit

public struct Clipping {
    
    // MARK: - Properties.
    
    public let cornerRadius: CGFloat
    public let cornerCurve: CALayerCornerCurve
    
    // MARK: - Initialization.
    
    public init(cornerRadius: CGFloat, cornerCurve: CALayerCornerCurve) {
        self.cornerRadius = cornerRadius
        self.cornerCurve = cornerCurve
    }
    
}
