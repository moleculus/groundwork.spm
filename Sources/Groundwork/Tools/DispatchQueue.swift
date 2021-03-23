import Foundation

public func shift(to queue: DispatchQueue, _ handler: @escaping () -> Void) {
    queue.async {
        handler()
    }
}

extension DispatchQueue {
    public static let backgroundRead = DispatchQueue(label: "backgroundRead", qos: .userInitiated)
    public static let backgroundWrite = DispatchQueue(label: "backgroundWrite", qos: .userInitiated)
    public static let main = DispatchQueue.main
}
