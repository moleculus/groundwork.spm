import Foundation

public extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func range(in string: String) -> NSRange {
        guard let range = string.range(of: self) else {
            preconditionFailure()
        }
        
        return NSRange(range, in: string)
    }
    
    func range() -> NSRange? {
        return range(in: self)
    }
}
