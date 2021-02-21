import Foundation

extension NSMutableAttributedString {
    public func addAttributes(_ attributes: [NSAttributedString.Key : Any], for string: String) {
        addAttributes(attributes, range: string.range(in: self.string))
    }
}
