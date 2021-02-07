import Foundation
import XCTest
@testable import InclusiveColor

class Int8BitTests: XCTestCase {
    
    static var allTests = [
        ("testInteger_BecomesDecimalColorChannel", testInteger_BecomesDecimalColorChannel)
    ]
    
    func testInteger_BecomesDecimalColorChannel() throws {
        let sut = Int.div255
       
        let tests = [-10, 0, 1, 2, 255, 256, .max, .min]
        let expectations: [ICColorChannel] = [-10/255, 0, 1/255, 2/255, 1, 256/255,
                                            ICColorChannel(Int.max)/255, ICColorChannel(Int.min)/255]
        
        let results = tests.map { sut($0)() }
        
        for i in results.indices {
            XCTAssertEqual(expectations[i], results[i], accuracy: 0.01)
        }
    }
}
