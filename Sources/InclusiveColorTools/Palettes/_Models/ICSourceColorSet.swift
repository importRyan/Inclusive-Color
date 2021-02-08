import Foundation

public protocol ICSourceColorSet: CaseIterable {
    var srgba: ICSRGBA { get }
}

public extension ICSourceColorSet {
    static var srgba: [ICSRGBA] { Self.allCases.map { $0.srgba } }
}
