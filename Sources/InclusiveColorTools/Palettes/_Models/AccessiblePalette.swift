import Foundation

public protocol AccessiblePalette {
    
    /// Palette title
    var title: String { get }
    
    var description: String { get }
    
    var tags: [ICPaletteUtilityTag] { get }
    
    var author: String { get }
    
    /// Short name for the license
    var license: String { get }
    
    /// License full text
    var licenseCopy: String { get }
    
    var link: URL { get }
    
    var colorCount: Int { get }
    
    var srgba: [ICSRGBA] { get }
    
    /// Title + author
    var id: String { get }
}

extension AccessiblePalette {
    public var colorCount: Int {
        srgba.count
    }
}
