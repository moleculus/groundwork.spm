import UIKit

public struct Shadow {
    
    // MARK: - Properties.
    
    public let color: UIColor
    public let offset: CGSize
    public let opacity: Float
    public let radius: CGFloat
    public let cornerRadius: CGFloat
    
    // MARK: - Initialization.
    
    public init(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat, cornerRadius: CGFloat) {
        self.color = color
        self.offset = offset
        self.opacity = opacity
        self.radius = radius
        self.cornerRadius = cornerRadius
    }
    
}
