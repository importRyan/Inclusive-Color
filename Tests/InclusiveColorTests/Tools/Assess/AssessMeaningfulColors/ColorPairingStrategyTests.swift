import Foundation
import XCTest
@testable import InclusiveColor

class ColorPairingStrategyTests: XCTestCase {
    
    static var allTests = [
        ("testGetPairs_AllPairs_ReturnsEmptyOnOutOfRangeInputs", testGetPairs_AllPairs_ReturnsEmptyOnOutOfRangeInputs),
        ("test_getPairs_Sequential_ReturnsEmptyOnOutofRangeInputs", test_getPairs_Sequential_ReturnsEmptyOnOutofRangeInputs),
        ("pairing_getPairs_Sequential", test_getPairsSequential_returnsProperCombosInOrder),
        ("pairing_getPairs_AllPairs", testGetPairs_AllPairs_returnsProperCombosInOrder)
    ]
    
    func test_getPairs_Sequential_ReturnsEmptyOnOutofRangeInputs() throws {
        let sut = ICColorPairingStrategy.allPairs.getPairs
        
        let test0: [ICSRGBA] = []
        let expectation0: [[ICSRGBA]] = []
        
        let test1: [ICSRGBA] = [ICSRGBA(1)]
        let expectation1: [[ICSRGBA]] = []
        
        let results0 = sut(test0)
        let results1 = sut(test1)
        
        XCTAssertEqual(results0.count, expectation0.count)
        XCTAssertEqual(results1.count, expectation1.count)
    }
    
    func testGetPairs_AllPairs_ReturnsEmptyOnOutOfRangeInputs() throws {
        
        // Arrange
        
        let sut = ICColorPairingStrategy.allPairs.getPairs
        
        let test0: [ICSRGBA] = []
        
        let expectation0: [ICColorPair] = []
        
        let test1 = [ICSRGBA(1)] // below k = 2
        
        let expectation1: [ICColorPair] = []
        
        // Act
        
        let results0 = [0...100].map { _ in sut(test0) }
        let results1 = [0...100].map { _ in sut(test1) }
        
        // Assert
        
        XCTAssertEqual(results0[0].count, expectation0.count)
        XCTAssertEqual(results1[0].count, expectation1.count)
        
        results1.forEach { result in
            for (res, exp) in zip(result, expectation0) {
                XCTAssertEqual(res.left, exp.left)
                XCTAssertEqual(res.right, exp.right)
                XCTAssertEqual(res.indexLeft, exp.indexLeft)
                XCTAssertEqual(res.indexRight, exp.indexRight)
            }
        }
    }
    
    func testGetPairs_AllPairs_returnsProperCombosInOrder() throws {
        
        // Arrange
        
        let sut = ICColorPairingStrategy.allPairs.getPairs
        
        let test1 = ICTestCases.MeaningfulColors.test1
        
        let expectation1 = [
            (left: ICSRGBA(1), right: ICSRGBA(2), indexLeft: 0, indexRight: 1),
            (left: ICSRGBA(1), right: ICSRGBA(3), indexLeft: 0, indexRight: 2),
            (left: ICSRGBA(1), right: ICSRGBA(4), indexLeft: 0, indexRight: 3),
            (left: ICSRGBA(2), right: ICSRGBA(3), indexLeft: 1, indexRight: 2),
            (left: ICSRGBA(2), right: ICSRGBA(4), indexLeft: 1, indexRight: 3),
            (left: ICSRGBA(3), right: ICSRGBA(4), indexLeft: 2, indexRight: 3)
        ]
        
        let test2 = [ICSRGBA(1), ICSRGBA(2), ICSRGBA(3)] // just above k = 2
        
        let expectation2 = [
            (left: ICSRGBA(1), right: ICSRGBA(2), indexLeft: 0, indexRight: 1),
            (left: ICSRGBA(1), right: ICSRGBA(3), indexLeft: 0, indexRight: 2),
            (left: ICSRGBA(2), right: ICSRGBA(3), indexLeft: 1, indexRight: 2)
        ]
        
        let test3 = [ICSRGBA(1), ICSRGBA(2)] // at k = 2
        
        let expectation3 = [
            (left: ICSRGBA(1), right: ICSRGBA(2), indexLeft: 0, indexRight: 1)
        ]
        
        
        // Act
        
        let results1 = [0...100].map { _ in sut(test1) }
        let results2 = [0...100].map { _ in sut(test2) }
        let results3 = [0...100].map { _ in sut(test3) }
        

        // Assert
        
        XCTAssertEqual(results1[0].count, expectation1.count)
        XCTAssertEqual(results2[0].count, expectation2.count)
        XCTAssertEqual(results3[0].count, expectation3.count)
        
        results1.forEach { result in
            for (res, exp) in zip(result, expectation1) {
                XCTAssertEqual(res.left, exp.left)
                XCTAssertEqual(res.right, exp.right)
                XCTAssertEqual(res.indexLeft, exp.indexLeft)
                XCTAssertEqual(res.indexRight, exp.indexRight)
            }
        }
        
        results2.forEach { result in
            for (res, exp) in zip(result, expectation2) {
                XCTAssertEqual(res.left, exp.left)
                XCTAssertEqual(res.right, exp.right)
                XCTAssertEqual(res.indexLeft, exp.indexLeft)
                XCTAssertEqual(res.indexRight, exp.indexRight)
            }
        }
        
        results3.forEach { result in
            for (res, exp) in zip(result, expectation3) {
                XCTAssertEqual(res.left, exp.left)
                XCTAssertEqual(res.right, exp.right)
                XCTAssertEqual(res.indexLeft, exp.indexLeft)
                XCTAssertEqual(res.indexRight, exp.indexRight)
            }
        }
        
    }
    
    func test_getPairsSequential_returnsProperCombosInOrder() throws {
        
        let sut = ICColorPairingStrategy.sequential.getPairs
        
        let test = ICTestCases.MeaningfulColors.test1
        
        let expectation = [
            (left: ICSRGBA(1), right: ICSRGBA(2), indexLeft: 0, indexRight: 1),
            (left: ICSRGBA(2), right: ICSRGBA(3), indexLeft: 1, indexRight: 2),
            (left: ICSRGBA(3), right: ICSRGBA(4), indexLeft: 2, indexRight: 3)
        ]
        
        // Act
        
        let results = [0...100].map { _ in sut(test) }
        
        
        // Assert
        
        results.forEach { result in
            for (res, exp) in zip(result, expectation) {
                XCTAssertEqual(res.left, exp.left)
                XCTAssertEqual(res.right, exp.right)
                XCTAssertEqual(res.indexLeft, exp.indexLeft)
                XCTAssertEqual(res.indexRight, exp.indexRight)
            }
        }
    }

}
