#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

public extension ICSourceColorSet {
    var nscolor: NSColor {
        NSColor(srgba)
    }
    
    static var nscolors: [NSColor] {
        Self.allCases.map { NSColor($0.srgba) }
    }
}

public extension AccessiblePalette {
    var nscolors: [NSColor] {
        srgba.nscolors
    }
}

public extension ICPalettes.AllPalettes {
    var nscolors: [NSColor] {
        colors_SRGBA.nscolors
    }
}

public extension NSColor {

    /// These published color blindness-friendly palettes are free, with licenses for inclusion in your app. A visual browser is available on the Mac App Store as "Inclusive Color".
    ///
    static let InclusiveColors = ICPalettes.self
}
#endif
