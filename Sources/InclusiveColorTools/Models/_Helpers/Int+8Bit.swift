import Foundation

internal extension Int {
    
    func div255() -> ICColorChannel {
        ICColorChannel(self)/255
    }
}
