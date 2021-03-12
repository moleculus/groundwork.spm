import Foundation

public class TimeLogger {
    
    // MARK: - Properties.
    
    private var stamps: [(date: Date, message: String)] = [] {
        didSet {
            guard stamps.count > 1 else {
                return
            }
            
            let count = stamps.count
            let start = stamps[count - 2]
            let end = stamps[count - 1]
            
            print(end.date.timeIntervalSince1970 - start.date.timeIntervalSince1970, end.message)
        }
    }
    
    // MARK: - Initialization.
    
    public init() {}
    
    // MARK: - Public Methods.
    
    public func logTime(message: String = "") {
        stamps.append((date: Date(), message: message))
    }
    
}
