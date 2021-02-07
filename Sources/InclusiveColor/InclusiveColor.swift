import Foundation
import XCTest

/// Assess colors and text by calling `AssertInclusive` methods in your tests.
///
/// This library extends **XCTestCase** for color blindness contrast testing. Only add to Unit Test targets (as this imports XCTest).
///
/// # Add to a Unit Test Target
/// 1) Click on your project in Xcode
/// 2) General tab
/// 3) Click your unit test target
/// 4) Build Phases tab
/// 5) Link Binary With Libraries: Click +
/// 6) Select InclusiveColor
///
/// If you simultaneously import `InclusiveColorTools` to a unit testing target, you can get build errors. The `InclusiveColor` library already contains `Tools`.
///
public struct InclusiveColor {
    private init() {}
    
    /// Color accessibility tools, such as contrast calculators, friendly palettes, vision simulators, and hue captioning. About 8% of men and 0.5% of women using your app may have diminished color vision.
    ///
    public static let tools = InclusiveColorTools.self
    
}
