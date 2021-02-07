import Foundation
import XCTest
import InclusiveColor

internal extension XCTestCase {
    
    func AssertSimulationsComparable(exp: AlreadySimulated,
                                     result: [ICColorVisionType : ICSRGBA],
                                     _ rgbTolerance: ICColorChannel,
                                     _ alphaTolerance: ICColorChannel,
                                     index: Int? = nil,
                                     file: String = #filePath,
                                     line: Int = #line,
                                     suppressFailure: Bool = false
    ) {
        
        for key in exp.keys {
            
            guard let expectation = exp[key],
                  let simulation = result[key] else {
                XCTFail("\(key.name) not present")
                return
            }
            
            AssertColorsComparable(exp: expectation,
                                   sut: simulation,
                                   rgb888Tolerance: rgbTolerance,
                                   alpha8Tolerance: alphaTolerance,
                                   index: index,
                                   label: key.name,
                                   file: file,
                                   line: line,
                                   suppressFailure: suppressFailure)
        }
    }
    
}
