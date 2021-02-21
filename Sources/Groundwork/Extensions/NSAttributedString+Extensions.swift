import Foundation

extension NSMutableAttributedString {
    public func addAttributes(_ attributes: [NSAttributedString.Key : Any], for string: String) {
        guard let range = string.range(in: self.string) else {
            return
        }
        
        addAttributes(attributes, range: range)
    }
}
