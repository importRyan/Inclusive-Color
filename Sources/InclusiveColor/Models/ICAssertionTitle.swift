import Foundation

internal enum ICAssertionTitle: String {
    case inclusivity = "Not Inclusive"
    case unequal = "Unequal"

    var condition: String { rawValue }
}
