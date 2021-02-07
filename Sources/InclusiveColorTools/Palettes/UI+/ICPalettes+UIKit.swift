#if canImport(UIKit)
import UIKit

public extension ICSourceColorSet {
    var uicolor: UIColor {
        UIColor(srgba)
    }
    
    static var uicolors: [UIColor] {
        Self.allCases.map { UIColor($0.srgba) }
    }
}

public extension AccessiblePalette {
    var uicolors: [UIColor] {
        srgba.uiColors
    }
}

public extension ICPalettes.AllPalettes {
    var uicolors: [UIColor] {
        colors_SRGBA.uiColors
    }
}

public extension UIColor {

    /// These published color blindness-friendly palettes are free, with licenses for inclusion in your app. A visual browser is available on the Mac App Store as "Inclusive Color".
    ///
    static let InclusiveColors = ICPalettes.self
}
#endif
