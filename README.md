![Logo](https://i.imgur.com/rYIWrEv.png "Logo")
<br>

* [Quick start](#quick-start)
* [Companion macOS app](#companion-macos-app)
* [Why unit test for color accessibility?](#why-unit-test-color-accessibility)
* [Swift Package Manager](#swift-package-manager)
* [Troubleshooting](#troubleshooting)
* [Feedback](#feedback)
* [About WCAG](#about-wcag)  
<br>


-------------------------------------------------------------------------------------------------------------
Quick start
=====================================

Safeguard your app’s meaningful colors and text–background combos by quick unit tests against the WCAG 2.1 guidelines. Test a few buttons in a view model or all color combinations in a theme.

```swift
import InclusiveColor

class YourTests: XCTestCase {
    
    func test_IconStates_VisibleToColorblindUsers() {
        let colors = [NSColor.yellow, .green] // Or UIColor/Color arrays
        AssertInclusive(colors: colors)
    }
    
    func test_ButtonLabels_MeetTextContrastMinimum() {
        let text        = [NSColor.textColor, .secondaryLabelColor]
        let backgrounds = [NSColor.systemIndigo]
        let font        = ICFontStyle(.title3)
        
        AssertInclusive(text: text,
                        backgrounds: backgrounds,
                        fonts: [font])
    }
}
```
![TestFailures](https://i.imgur.com/pmOjkWN.png "XCTest failure messages")

> No surprise, static yellow and green are inaccessible meaningful colors per [the WCAG](#about-wcag), which requires a luminance ratio of ≥3. As for the indigo button: while the white textColor is fine, the 55% opacity secondaryLabelColor just needs a little bump.

* **Be more stringent** — Apply WCAG’s more accessible “enhanced” text contrast standard by setting the `metric` parameter in `AssertInclusive`.

* **Free accessible color palettes** — Try >75 palettes by scientists and designers namespaced under `ICPalettes` along with license text. See them in the [companion macOS app](#companion-macos-app), alongside simulations and tests for colors imported from your own Swift code.
<br><br><br><br>



-------------------------------------------------------------------------------------------------------------
Companion macOS app
=====================================

    🧐   Visualize your palettes and test scores across color visions

    🎨   Browse and fork free accessible palettes (for aesthetics and complex data)

    👩🏻‍💻   Swift code import/export

    🖥   Batch capture new palettes by cursor + keyboard triggers

    🌈   Adjust colors in simulated color vision (pick/preview)

 ✉️ importRyan@gmail.com to beta test

![Screenshot](https://i.imgur.com/jERJ0u4.png "Companion macOS App screenshot")
<br><br><br>


-------------------------------------------------------------------------------------------------------------
Why unit test color accessibility?
=====================================

1. **8% of men and 0.5% of women** are somewhat or completely unable to see colors that could be essential to your UI.
2. Indistinguishable colors may surprise you. (It's not just red vs. green.)
3. An ~50-200 ms unit test can screen thousands of color combinations. That beats screening or finding regressions by sporadic manual inspection.   

![Simulations](https://i.imgur.com/eYX7q76.png "Simulated HSV Wheels")
<br><br><br><br>



-------------------------------------------------------------------------------------------------------------
Swift Package Manager
=====================================
Support for Cocoapod and Carthage is coming soon. For now, use SPM:

```
https://github.com/importRyan/InclusiveColor
```

:warning:  Only link this library to unit test targets because it extends `XCTest`. 

All logic is housed in a second library, `InclusiveColorTools` that is safe to link to executables, such as for live simulation of colors during development using `.simulate(for:)`.
<br><br><br><br>



-------------------------------------------------------------------------------------------------------------
Troubleshooting
=====================================
#### 💥 Build error?
Presently, Xcode and Swift Package Manger do not gracefully ignore an `XCTest` import in linked libraries. The workaround is simple: only link such a library to your unit test targets.

This framework has two libraries. The namesake library extends `XCTest` by wrapping the logic housed in the other library,  `InclusiveColorTools`, with pretty-printing assertion handlers.

**To solve build errors**
1. Tap on your `Project` and then the desired unit test under `Targets`
2. In `Build Phases`, open `Link Binary With Libraries`
3. Use the `+` to add the `InclusiveColor` library
4. If build errors continue, you may need to remove `InclusiveColor` from 
* `Test Targets\Build Phases\Dependencies`
* `Executable Targets\Build Phases\*`
<br><br><br><br>



-------------------------------------------------------------------------------------------------------------
Feedback
=====================================
Bug? Wish I wrote a better API? Suggested feature or metric?

Please email me importRyan@gmail.com or open an issue/PR on GitHub. Feedback from experienced developers to enhance the utility of this package would be welcomed warmly, as I am looking for my first junior dev role. 
<br><br><br><br>



-------------------------------------------------------------------------------------------------------------
About WCAG
=====================================
The Web Content Accessibility Guidelines are a common standard for accessibility testing for web content. It has far more resources than color contrast alone. Apple's own Accessibility Inspector tool with Xcode reports WCAG color contrast for elements in your app.

* [WCAG About](https://www.w3.org/WAI/standards-guidelines/wcag/)
* [WCAG "Quick" Reference Guide](https://www.w3.org/WAI/WCAG21/quickref/)
* [1.4.3 Minimum Contrast Criterion](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html)
* [1.4.6 Enhanced Contrast Criterion](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast7.html)


### Why show WCAG scores for simulated color vision?
Color vision simulations will occasionally suggest that some pairs would benefit from a little extra contrast to keep everyone above a common minimum.

The WCAG 2.1 algorithm uses gray luminance as a performant shortcut to a lowest common denominator. But human color perception is not a monolithic light calculator, nor does everyone process wavelengths like the employed luma formula does. Light perception is a product of multiple mechanisms from photoreceptors to pre-attentive cortical processing. 

It’s likely the currently active WCAG3 working group or other color scientists will develop more nuanced measures with empirical evidence. This is just a helpful extra measure along the way.
