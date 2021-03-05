#if canImport(AppKit) && !targetEnvironment(macCatalyst)

import XCTest
import AppKit
@testable import InclusiveColor

@available(OSX 11.0, *)
class ExampleTestInYourApp: XCTestCase {
    
    func testStateIcons_NoticeableToColorblindUsers() throws {

//        let colors = [NSColor.yellow, .green]
//        AssertInclusive(colors: colors)
    }

    func testButtonLabels_PassWCAG2() throws {

//        let backgrounds = [NSColor.systemIndigo]
//        let text        = [NSColor.textColor, .secondaryLabelColor]
//        let font        = ICFontStyle(style: .title3)
//
//        AssertInclusive(text: text,
//                        backgrounds: backgrounds,
//                        fonts: [font])

    }
}

#endif

