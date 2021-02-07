#if canImport(UIKit)
import UIKit

/// Convenient interface for internal test functions to apply across UIKit and AppKit.
public typealias ICNativeAnyColor = UIColor

internal extension Array where Element == ICSRGBA {

    /// (TESTING FRAMEWORK) Convert out of framework-internal sRGB representation
    ///
    var nativeColors: [UIColor] {
        map { UIColor($0) }
    }
}

#elseif canImport(AppKit) && !targetEnvironment(macCatalyst)

import AppKit

/// Unit test and description interface for platform color objects.
public typealias ICNativeAnyColor = NSColor

public extension Array where Element == ICSRGBA {

    /// (TESTING FRAMEWORK) Convert out of framework-internal sRGB representation
    ///
    var nativeColors: [NSColor] {
        map { NSColor($0) }
    }
}

#endif
