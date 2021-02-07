import Foundation
import XCTest
@testable import InclusiveColor
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#else
import UIKit
#endif

class AppKitSimulateTests: XCTestCase {
    
    static var allTests = [
        ("testSimulateSingleColorFunctions_MatchFirefoxAndColorspaciousImplementations", testSimulateSingleColorFunctions_MatchFirefoxAndColorspaciousImplementations),
        ("testSimulateColorArrayFunctions_MatchFirefoxAndColorspaciousImplementations", testSimulateColorArrayFunctions_MatchFirefoxAndColorspaciousImplementations),
        ("test10kInputColors_FullySimulated_Requires90ms_onM1MacMini", test10kInputColors_FullySimulated_Requires90ms_onM1MacMini)
    ]
    
    func test10kInputColors_FullySimulated_Requires90ms_onM1MacMini() throws {
        let sut = ICVisionSimulator_Machado()
        let test = ICTestCases.LargerN.make10kcolors().map { ICNativeAnyColor($0) }
        
        var results = [[ICColorVisionType : ICNativeAnyColor]]()
        
        measure {
            results = test.map { $0.simulate(sut) }
        }
        
        XCTAssertEqual(50000, results.count * results[0].keys.count)
        
    }
    
    func testSimulateSingleColorFunctions_MatchFirefoxAndColorspaciousImplementations() throws {
        let sut = ICVisionSimulator_Machado()
        let cases = ICTestCases.Machado.Google.cases.map { $0.mapValues { ICNativeAnyColor($0) }}
        
        cases.forEach { test in
            let color: ICNativeAnyColor = test[.typicalTrichromacy]!
            
            let resultTrichromacy = color.simulate(for: .typicalTrichromacy, sut)
            let resultDeutan = color.simulate(for: .deuteranopia, sut)
            let resultProtan = color.simulate(for: .protanopia, sut)
            let resultTritan = color.simulate(for: .tritanopia, sut)
            let resultMonochromat = color.simulate(for: .monochromacy, sut)
            
            AssertColorsComparable(exp: test[.typicalTrichromacy]!.sRGBA!, sut: resultTrichromacy.sRGBA!)
            AssertColorsComparable(exp: test[.deuteranopia]!.sRGBA!, sut: resultDeutan.sRGBA!)
            AssertColorsComparable(exp: test[.protanopia]!.sRGBA!, sut: resultProtan.sRGBA!)
            AssertColorsComparable(exp: test[.tritanopia]!.sRGBA!, sut: resultTritan.sRGBA!)
            AssertColorsComparable(exp: test[.monochromacy]!.sRGBA!, sut: resultMonochromat.sRGBA!)
        }
        
        cases.forEach { test in
            let color = test[.typicalTrichromacy]!
            
            let results99 = color.simulate(for: .max99percent)
            for result in results99 {
                AssertColorsComparable(exp: test[result.key]!.sRGBA!, sut: result.value.sRGBA!)
            }
            
            let results94 = color.simulate(for: .max94percent)
            for result in results94 {
                AssertColorsComparable(exp: test[result.key]!.sRGBA!, sut: result.value.sRGBA!)
            }
            
            let resultsMax = color.simulate(for: .maxInclusivity)
            for result in resultsMax {
                AssertColorsComparable(exp: test[result.key]!.sRGBA!, sut: result.value.sRGBA!)
            }
        }
        
        cases.forEach { test in
            let color = test[.typicalTrichromacy]!
            
            let results = color.simulate()
            for result in results {
                AssertColorsComparable(exp: test[result.key]!.sRGBA!, sut: result.value.sRGBA!)
            }
        }

    }
    
    func testSimulateColorArrayFunctions_MatchFirefoxAndColorspaciousImplementations() throws {
        let sut = ICVisionSimulator_Machado()
        let cases = ICTestCases.Machado.Google.cases
        let test = cases.flatMap { $0.compactMap { $0.key == .typicalTrichromacy ? ICNativeAnyColor($0.value) : nil } }
        let expProtan = cases.flatMap { $0.compactMap { $0.key == .protanopia ? ICNativeAnyColor($0.value) : nil } }
        let expDeutan = cases.flatMap { $0.compactMap { $0.key == .deuteranopia ? ICNativeAnyColor($0.value) : nil } }
        let expTritan = cases.flatMap { $0.compactMap { $0.key == .tritanopia ? ICNativeAnyColor($0.value) : nil } }
        let expMonochromat = cases.flatMap { $0.compactMap { $0.key == .monochromacy ? ICNativeAnyColor($0.value) : nil } }

        // All
        
        let resultsAll = test.simulate(sut)
        
        for (e, r) in zip(test, resultsAll[.typicalTrichromacy]!) {
            AssertColorsComparable(exp: e.sRGBA!, sut: r.sRGBA!)
        }
        
        for (e, r)  in zip(expDeutan, resultsAll[.deuteranopia]!) {
            AssertColorsComparable(exp: e.sRGBA!, sut: r.sRGBA!)
        }
        
        for (e, r) in zip(expProtan, resultsAll[.protanopia]!) {
            AssertColorsComparable(exp: e.sRGBA!, sut: r.sRGBA!)
        }
        
        for (e, r) in zip(expTritan, resultsAll[.tritanopia]!) {
            AssertColorsComparable(exp: e.sRGBA!, sut: r.sRGBA!)
        }
        
        for (e, r) in zip(expMonochromat, resultsAll[.monochromacy]!) {
            AssertColorsComparable(exp: e.sRGBA!, sut: r.sRGBA!)
        }
        
        // Max Inclusivity
        
        let resultsMax = test.simulate(for: .maxInclusivity, sut)
        
        for (e, r) in zip(test, resultsMax[.typicalTrichromacy]!) {
            AssertColorsComparable(exp: e.sRGBA!, sut: r.sRGBA!)
        }
        
        for (e, r)  in zip(expDeutan, resultsMax[.deuteranopia]!) {
            AssertColorsComparable(exp: e.sRGBA!, sut: r.sRGBA!)
        }
        
        for (e, r) in zip(expProtan, resultsMax[.protanopia]!) {
            AssertColorsComparable(exp: e.sRGBA!, sut: r.sRGBA!)
        }
        
        for (e, r) in zip(expTritan, resultsMax[.tritanopia]!) {
            AssertColorsComparable(exp: e.sRGBA!, sut: r.sRGBA!)
        }
        
        for (e, r) in zip(expMonochromat, resultsMax[.monochromacy]!) {
            AssertColorsComparable(exp: e.sRGBA!, sut: r.sRGBA!)
        }
        
        // Inclusivity 99

        let results99 = test.simulate(for: .max99percent, sut)
    
        for (e, r) in zip(test, results99[.typicalTrichromacy]!) {
            AssertColorsComparable(exp: e.sRGBA!, sut: r.sRGBA!)
        }
        
        for (e, r)  in zip(expDeutan, results99[.deuteranopia]!) {
            AssertColorsComparable(exp: e.sRGBA!, sut: r.sRGBA!)
        }
        
        for (e, r) in zip(expProtan, results99[.protanopia]!) {
            AssertColorsComparable(exp: e.sRGBA!, sut: r.sRGBA!)
        }
        
        // Inclusivity 94
        
        let results94 = test.simulate(for: .max94percent, sut)

        for (e, r) in zip(test, results94[.typicalTrichromacy]!) {
            AssertColorsComparable(exp: e.sRGBA!, sut: r.sRGBA!)
        }
    }
}
