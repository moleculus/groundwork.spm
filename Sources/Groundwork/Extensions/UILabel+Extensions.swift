import UIKit

extension UILabel {
    
    /// Iterates over the given strings and returns the maximum width
    /// that is needed to display each of them without truncating.
    /// Each string is expected to be displayed on a single line.
    ///
    /// - Parameters:
    ///     - strings: The string for which you need to calculate the maximum width.
    ///     - font: The font to be used for the label. Use the same value as in your UI.
    ///
    /// - Returns: The maximum width that is needed to display each string (individually)
    /// on a single line without truncating.
    
    public static func preferredWidth(for strings: [String], font: UIFont) -> CGFloat {
        let label = UILabel(frame: .zero).then {
            $0.font = font
            $0.numberOfLines = 1
        }
        
        let bounds = CGRect(
            x: 0,
            y: 0,
            width: CGFloat.greatestFiniteMagnitude,
            height: CGFloat.greatestFiniteMagnitude
        )
        
        let widths: [CGFloat] = strings.map {
            label.frame = bounds
            label.text = $0
            label.sizeToFit()
            
            return label.bounds.width
        }
        
        return widths.max() ?? 0
    }
}
