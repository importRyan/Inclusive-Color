import Foundation

extension ICSRGBA: ICAnyColor {
    public var sRGBA: ICSRGBA? { self }

    public typealias Original = ICSRGBA
    
    /// Redundant: for protocol compliance only.
    static public func convert(_ srgba: ICSRGBA) -> ICSRGBA {
        return srgba
    }

}
