import Foundation

public extension ICAnyColor {
    
    /// Label a color by its hue and value (e.g., red, black, brown).
    ///
    /// A few published color nomenclatures are available. Set your preference by calling `InclusiveColorTools.captions.setNomenclature()`.
    ///
    /// - Returns: Short color captioning string
    ///
    func caption() -> String {
        InclusiveColorTools.captions.caption(self)
    }
}

public extension Array {
    
    /// Label colors by hue and value (e.g., red, black, brown).
    ///
    /// A few published color nomenclatures are available. Set your preference by calling `InclusiveColorTools.captions.setNomenclature()`.
    ///
    /// - Returns: A string of color captions, with each color on a separate line
    ///
    func caption() -> String where Element: ICAnyColor {
        var captions = reduce(String()) { (acc, next) in
            acc.appending("\(next.caption())\n")
        }
        captions.removeLast(1)
        return captions
    }
}
