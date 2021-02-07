import Foundation
import XCTest
@testable import InclusiveColor

class VSMachadoTests: XCTestCase {
    
    static var allTests = [
        ("testSimulateSingleColorFunctions_MatchFirefoxAndColorspaciousImplementations", testSimulateSingleColorFunctions_DoNotMutateTypicalVision_AndMatchFirefoxAndColorspaciousImplementations),
        ("testSimulateColorArrayFunctions_DoNotMutateTypicalVision_AndMatchFirefoxAndColorspaciousImplementations", testSimulateColorArrayFunctions_DoNotMutateTypicalVision_AndMatchFirefoxAndColorspaciousImplementations),
        ("test10kInputColors_FullySimulated_Requires60ms_onM1MacMini", test10kInputColors_FullySimulated_Requires60ms_onM1MacMini)
    ]
    
    func test10kInputColors_FullySimulated_Requires60ms_onM1MacMini() throws {
        let sut = ICVisionSimulator_Machado()
        let test = ICTestCases.LargerN.make10kcolors()
        
        var results = [[ICColorVisionType : ICSRGBA]]()
        measure {
            results = test.map { sut.simulate($0) }
        }
        
        XCTAssertEqual(50000, results.count * results[0].keys.count)
        
    }
    
    func testSimulateSingleColorFunctions_DoNotMutateTypicalVision_AndMatchFirefoxAndColorspaciousImplementations() throws {
        let sut = ICVisionSimulator_Machado()
        let cases = ICTestCases.Machado.Google.cases
        
        cases.forEach { test in
            let color = test[.typicalTrichromacy]!
            
            let resultTrichromacy = sut.simulate(color, .typicalTrichromacy)
            let resultDeutan = sut.simulate(color, .deuteranopia)
            let resultProtan = sut.simulate(color, .protanopia)
            let resultTritan = sut.simulate(color, .tritanopia)
            let resultMonochromat = sut.simulate(color, .monochromacy)
            
            AssertColorsComparable(exp: test[.typicalTrichromacy]!, sut: resultTrichromacy)
            AssertColorsComparable(exp: test[.deuteranopia]!, sut: resultDeutan)
            AssertColorsComparable(exp: test[.protanopia]!, sut: resultProtan)
            AssertColorsComparable(exp: test[.tritanopia]!, sut: resultTritan)
            AssertColorsComparable(exp: test[.monochromacy]!, sut: resultMonochromat)
        }
        
        cases.forEach { test in
            let color = test[.typicalTrichromacy]!
            
            let results99 = sut.simulate(color, .max99percent)
            for result in results99 {
                AssertColorsComparable(exp: test[result.key]!, sut: result.value)
            }
            
            let results94 = sut.simulate(color, .max94percent)
            for result in results94 {
                AssertColorsComparable(exp: test[result.key]!, sut: result.value)
            }
            
            let resultsMax = sut.simulate(color, .maxInclusivity)
            for result in resultsMax {
                AssertColorsComparable(exp: test[result.key]!, sut: result.value)
            }
        }
        
        cases.forEach { test in
            let color = test[.typicalTrichromacy]!
            
            let results = sut.simulate(color)
            for result in results {
                AssertColorsComparable(exp: test[result.key]!, sut: result.value)
            }
        }
        
    }
    
    func testSimulateColorArrayFunctions_DoNotMutateTypicalVision_AndMatchFirefoxAndColorspaciousImplementations() throws {
        let sut = ICVisionSimulator_Machado()
        let cases = ICTestCases.Machado.Google.cases
        let test = cases.flatMap { $0.compactMap { $0.key == .typicalTrichromacy ? $0.value : nil } }
        let expProtan = cases.flatMap { $0.compactMap { $0.key == .protanopia ? $0.value : nil } }
        let expDeutan = cases.flatMap { $0.compactMap { $0.key == .deuteranopia ? $0.value : nil } }
        let expTritan = cases.flatMap { $0.compactMap { $0.key == .tritanopia ? $0.value : nil } }
        let expMonochromat = cases.flatMap { $0.compactMap { $0.key == .monochromacy ? $0.value : nil } }
        
        // All
        
        let resultsAll = sut.simulate(test)
        
        for (e, r) in zip(test, resultsAll[.typicalTrichromacy]!) {
            AssertColorsComparable(exp: e, sut: r)
        }
        
        for (e, r)  in zip(expDeutan, resultsAll[.deuteranopia]!) {
            AssertColorsComparable(exp: e, sut: r)
        }
        
        for (e, r) in zip(expProtan, resultsAll[.protanopia]!) {
            AssertColorsComparable(exp: e, sut: r)
        }
        
        for (e, r) in zip(expTritan, resultsAll[.tritanopia]!) {
            AssertColorsComparable(exp: e, sut: r)
        }
        
        for (e, r) in zip(expMonochromat, resultsAll[.monochromacy]!) {
            AssertColorsComparable(exp: e, sut: r)
        }
        
        // Max Inclusivity
        
        let resultsMax = sut.simulate(test, .maxInclusivity)
        
        for (e, r) in zip(test, resultsMax[.typicalTrichromacy]!) {
            AssertColorsComparable(exp: e, sut: r)
        }
        
        for (e, r)  in zip(expDeutan, resultsMax[.deuteranopia]!) {
            AssertColorsComparable(exp: e, sut: r)
        }
        
        for (e, r) in zip(expProtan, resultsMax[.protanopia]!) {
            AssertColorsComparable(exp: e, sut: r)
        }
        
        for (e, r) in zip(expTritan, resultsMax[.tritanopia]!) {
            AssertColorsComparable(exp: e, sut: r)
        }
        
        for (e, r) in zip(expMonochromat, resultsMax[.monochromacy]!) {
            AssertColorsComparable(exp: e, sut: r)
        }
        
        // Inclusivity 99
        
        let results99 = sut.simulate(test, .max99percent)
        
        for (e, r) in zip(test, results99[.typicalTrichromacy]!) {
            AssertColorsComparable(exp: e, sut: r)
        }
        
        for (e, r)  in zip(expDeutan, results99[.deuteranopia]!) {
            AssertColorsComparable(exp: e, sut: r)
        }
        
        for (e, r) in zip(expProtan, results99[.protanopia]!) {
            AssertColorsComparable(exp: e, sut: r)
        }
        
        // Inclusivity 94
        
        let results94 = sut.simulate(test, .max94percent)
        
        for (e, r) in zip(test, results94[.typicalTrichromacy]!) {
            AssertColorsComparable(exp: e, sut: r)
        }
    }
}
