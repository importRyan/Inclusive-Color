import Foundation

public protocol AccessiblePalette {
    var title: String { get }
    var description: String { get }
    var tags: [ICPaletteUtilityTag] { get }
    var author: String { get }
    var license: String { get }
    var licenseCopy: String { get }
    var link: URL { get }
    var colorCount: Int { get }
    var srgba: [ICSRGBA] { get }
    var id: String { get }
}

extension AccessiblePalette {
    public var colorCount: Int {
        srgba.count
    }
}
