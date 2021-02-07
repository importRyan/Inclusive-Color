#if canImport(SwiftUI)
import SwiftUI

public extension ICSourceColorSet {
    @available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, *)
    var swiftUI: Color {
        Color(srgba)
    }
    
    @available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, *)
    static var swiftUI: [Color] { Self.allCases.map { Color($0.srgba) } }
}

public extension AccessiblePalette {
    @available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, *)
    var swiftUIcolors: [Color] {
        srgba.swiftUIcolors
    }
}

public extension ICPalettes.AllPalettes {
    @available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, *)
    var swiftUIcolors: [Color] {
        colors_SRGBA.swiftUIcolors
    }
}

@available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, *)
public extension Color {

    /// These published color blindness-friendly palettes are free, with licenses for inclusion in your app. A visual browser is available on the Mac App Store as "Inclusive Color".
    ///
    static let InclusiveColors = ICPalettes.self
}

#endif
