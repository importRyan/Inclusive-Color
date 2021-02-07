# InclusiveColor **Beta**

This is a humble toolset:
1.  `AssertInclusive`  Unit tests colors and text against accessibility standards across color vision simulations
2.  `ICPalettes`  Contains free accessibility-friendly color palettes published by researchers and engineers
3.  `.simulate()`  For internal UI testing, adapts UIColor, NSColor, and Color objects to simulate color vision impairments
4.  `.caption()`  Captions color objects for accessibility tags, if the need arises

A free companion macOS app:
1. Visualizes test results for color sets and fonts across multiple metrics and vision simulations, helping designers respond to unit test screen failures
2. Assembles palettes quickly by importing Swift code, xcasset drops, manual inputs, or by cursor sampling + a key trigger
3. Exports colors as Swift code
4. Houses more documentation for this package



## Why unit test for color accessibility?
1. About 8% of men and 0.5% of women are somewhat or completely unable to see colors that could be essential to your UI.
2. Indistinguishable colors may surprise you. (It's not just red vs. green.)
3. An ~50-200 ms unit test can screen thousands of color combinations... even on Intel. That beats screening or finding regressions by sporadic manual inspection. 



## Quick start

* Import this package using Swift Package Manager. 
* Add `InclusiveColor` to your unit test target(s). (Go to `Build Phase`, `Link Binary With Libraries`).
```
https://github.com/importRyan/InclusiveColor
```

**Test meaningful colors (e.g., charts, toggles, or buttons)**
```
import XCTest
import InclusiveColor

let sut: [NSColor] / [UIColor]  / [Color] = [.blue, .green, .white]
AssertInclusive(colors: test, pairings: .allPairs)
```
That sample test will fail with details about the inaccessible color combos. The default metric is from WCAG 2.1, but you can specify an override.

**Test text–background–font combinations**
```
AssertInclusive(text: textColorArray,
                backgrounds: bgColorArray,
                fonts: .wcag2_body(),
                inclusivity: .max99percent)
```
The `fonts` parameter has defaults (and explanations) for WCAG body and strong text, but also accepts custom styles and applies the appropriate standard. 

The `inclusivity` parameter on these assertions by default covers typical, protan, deutan, tritan, and monochromatic vision. Other options restrict testing to vision types covering less of your user base.

**Wrap your own assertions**
Similar to the new assertion tools in Swift 5.4, you can silence failure handlers in favor of your own assertions, such as expecting a failure while waiting on a design fix.  

Assign `AssertInclusive` to a variable. Pass `true` for the optional parameter `suppressFailure`.  The now-silenced assertion will output a tuple that includes an overall didPass verdict, details on comparisons and simulations, and its usual failure description.

Domain experts can further customize framework behaviors. For example, you can replace the vision simulator (based on Machado et al) with preferred transforms as a parameter for individual assertions or as a global default via the `InclusiveColorTools.setDefaultSimulator` method.


### Build error?
The `InclusiveColorTools` library does not extend `XCTest`. Production targets can link to it. 

But `InclusiveColor` wraps `Tools` with custom `XCTest` assertions. Presently, Xcode and Swift Package Manger do not gracefully ignore an `XCTest` import. The workaround is simple: only link this library to unit test targets.

1. Tap on your `Project` and then the desired unit test under `Targets`
2. In `Build Phases`, open `Link Binary With Libraries`
3. Use the `+` to add the `InclusiveColor` library
4. If build errors continue, you may need to remove `InclusiveColor` from 
* `Test Targets\Build Phases\Dependencies`
* `Executable Targets\Build Phases\*`



## Feedback

Find a bug? Wish I wrote a better API? Suggestions on metrics or other features?

Please email me importRyan@gmail.com or open an issue/PR on GitHub. Feedback from experienced developers to enhance the utility of this package would be welcomed warmly, as I am looking for my first junior dev role. 
