import Foundation

/// Color accessibility tools, such as contrast calculators, friendly palettes, vision simulators, and hue captioning. About 8% of men and 0.5% of women using your app may have diminished color vision.
///
/// Common tools are aliased here. More tools are exposed for customizing UI assessments and other applications. Please note that there are two libraries in this package: `InclusiveColor` and `InclusiveColorTools`. The former wraps Tools with `XCTest` extensions for unit testing *only*. Importing the unit-testing library to a production target will cause build errors.

///
/// # Add InclusiveColorTools to an Executable Target
/// 1) Click on your project in Xcode
/// 2) General tab
/// 3) Click your executable app
/// 4) General Tab
/// 5) In "Frameworks, Libraries and Embedded Content", click "+"
/// 6) Select InclusiveColorTools
/// 7) Click on your unit test targets
/// 8) Build Phases tab
/// 9) If you intend to use the XCTest-extending library in your test targets, remove this `Tools` library from your test targets. Under "Dependencies" and "Link Binary with Libraries", click "-".
///
/// ## Add InclusiveColor to a Testing Target
/// 1) Click on your project in Xcode
/// 2) General tab
/// 3) Click your unit test target
/// 4) Build Phases tab
/// 5) Link Binary With Libraries: Click +
/// 6) Select InclusiveColor
///
/// If you simultaneously import *both* the vanilla and XCTest+ library to a unit test target, you can also get build errors.
///
public struct InclusiveColorTools {
    private init() {}
    
// MARK: - TOOLS
    
    /// Free-to-use color blindness-friendly color palettes, with annotations, citations, and license notes. Please consider contributing and providing feedback if palettes need additional usage flags.
    ///
    public static let palettes = ICPalettes.self
    
    /// General-purpose simulator of color perception. You may use this singleton instance or initialize a custom simulator that replaces the default transformations.
    ///
    public static private(set) var simulator: ICVisionSimulator = { ICVisionSimulator_Machado.default }()
    
    /// Caption colors with customizable labels for hues and grayscales. The selected nomenclature is also used in this framework's debug descriptions.
    ///
    public static var captions: ICColorCaptioning = { ICColorCaptioner() }()
    
    
// MARK: - METHODS FOR ASSESSING COLORS AND TEXT
    
    /// Assess backgrounds, text colors, and font styles against an accessibility standard across the chosen vision types. By default, all vision types are assessed using the WCAG 2.1 Minimum Contrast 1.4.3 AA criterion, which demands a minimum relative luminance ratio of 4.5:1 for body text and 3:1 for strong text (i.e., at least 18 pt or 14 pt and bold). There are stricter standards than 1.4.3 AA.
    ///
    /// - Parameters:
    ///   - text: Any Swift color object
    ///   - fonts: Point size and boldness. By default, WCAG body and strong styles are assessed. You may choose just one with: `.wcagBody()`, `.wcagStrong()`
    ///   - backgrounds: Any Swift color object
    ///   - inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
    ///   - metric: Select a pass threshold based on an accessibility standard. Default is WCAG 2.1 Minimum Contrast 1.4.3 AA.
    ///   - simulator: A default or customized color vision simulator
    ///
    ///  - Returns: An object that reports:
    ///   * if all background, text, and font combinations did pass the selected standard
    ///   * colors simulated for requested vision types
    ///   * detailed pairwise contrast comparisons
    ///   * a basic statistical summary
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    public static func assessText<C: ICAnyColor>(_ text: [C],
                                               backgrounds: [C],
                                               fonts: [ICFontStyle] = .wcag2_bodyAndStrong(),
                                               inclusivity: ICVisionInclusivity = .maxInclusivity,
                                               metric: ICTextColorsMetrics = .default,
                                               simulator: ICVisionSimulator = simulator
    ) -> ICAssessment.TextColors<C> {
        
        assess(text: text,
               backgrounds: backgrounds,
               fonts: fonts,
               inclusivity: inclusivity,
               metric: metric,
               simulator: simulator)
    }
    
    /// Assess colors against a chosen accessibility standard for the chosen vision types. By default, all pairwise color combinations are assessed for all vision types against the WCAG 2.1 Meaningful Colors 1.4.11 criterion, which demands a minimum relative luminance ratio of 3:1.
    ///
    /// - Parameters:
    ///   - colors: Any Swift color object
    ///   - pairings: Applicable combinations (e.g., sequential pairs only)
    ///   - inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
    ///   - metric: Select a pass threshold based on an accessibility standard
    ///   - simulator: A default or customized color vision simulator
    ///
    /// - Returns: An object that reports:
    ///   * if all color combinations did pass the selected standard
    ///   * colors simulated for requested vision types
    ///   * detailed pairwise contrast comparisons
    ///   * a basic statistical summary
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    public static func assessColors<C: ICAnyColor>(_ colors: [C],
                                                 pairings: ICColorPairingStrategy = .allPairs,
                                                 inclusivity: ICVisionInclusivity = .maxInclusivity,
                                                 metric: ICMeaningfulColorsMetrics = .WCAG21(.meaningfulColor_1411_AA),
                                                 simulator: ICVisionSimulator = simulator
    ) -> ICAssessment.MeaningfulColors<C> {
        
        assess(colors: colors,
               pairings: pairings,
               inclusivity: inclusivity,
               metric: metric,
               simulator: simulator)
    }
    
    /// By default, the Machado et al transform is used. This function overrides that implementation for all methods in this framework.  Calling this function without specifying a custom implementation will restore the default Machado simulator.
    ///
    /// - Parameter newSimulator: A custom object conforming to ICVisionSimulator.
    ///
    public static func setDefaultSimulator(_ newSimulator: ICVisionSimulator = ICVisionSimulator_Machado.default) {
        simulator = newSimulator
    }
    
}

