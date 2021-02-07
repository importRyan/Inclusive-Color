import Foundation
import XCTest

internal extension XCTestCase {
    
    struct Tolerances {
        let RGB888_Permissive_2: Int = 2 // 2 is 0.8%
        let RGB888_Mild_1: Int = 1 // 1 is 0.4%
        let RGB888_Exact_0: Int = 0
    }
}
