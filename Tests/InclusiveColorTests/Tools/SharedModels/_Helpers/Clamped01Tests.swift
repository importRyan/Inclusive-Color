import Foundation
import XCTest
@testable import InclusiveColor

class Clamped01Tests: XCTestCase {
    
    static var allTests = [
        ("testColorChannel_Clamps", testColorChannel_Clamps),
        ("testSIMD3_Clamps", testSIMD3_Clamps),
        ("testDouble_ClampsIntoColorChannel", testDouble_ClampsIntoColorChannel)
    ]
    
    func testDouble_ClampsIntoColorChannel() throws {
        
        let sut = Double.clamped01
        let tests: [Double] = makeTests()
        let exp: [ICColorChannel] = makeExpectations()
        
        let results = tests.map { sut($0)() }
        
        for i in 0..<tests.count {
            XCTAssertEqual(results[i], exp[i])
        }
        
    }
    
    func testColorChannel_Clamps() throws {
        
        let sut = ICColorChannel.clamped01
        let tests: [ICColorChannel] = makeTests().map { ICColorChannel($0) }
        let exp: [ICColorChannel] = makeExpectations()
        
        let results = tests.map { sut($0)() }
        
        for i in 0..<tests.count {
            XCTAssertEqual(results[i], exp[i])
        }
    }
    
    func testSIMD3_Clamps() throws {

        let sut = SIMD3<ICColorChannel>.clamped01
        let tests = makeTests()
            .map { ICColorChannel($0) }
            .map { SIMD3<ICColorChannel>(repeating: $0) }
        let exp = makeExpectations()
            .map { SIMD3<ICColorChannel>(repeating: $0) }
        
        let results = tests.map { sut($0)() }
        
        for i in 0..<tests.count {
            XCTAssertEqual(results[i], exp[i])
        }

    }
    
    // MARK: - Helpers
    
    private func makeTests() -> [Double] {
        [-0.01, 0, 0.01, 0.99, 1, 1.01, 1000,
         .nan, .greatestFiniteMagnitude, .infinity, -.infinity]
    }
    
    private func makeExpectations() -> [ICColorChannel] {
        [0, 0, 0.01, 0.99, 1, 1, 1,
         0, 1, 1, 0]
    }
}
