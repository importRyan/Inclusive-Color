//
//  File.swift
//  
//
//  Created by Ryan Ferrell on 1/29/21.
//

import Foundation
import XCTest
@testable import InclusiveColor

typealias WCAG3KeystoneTestCase = (text: ICSRGBA, bg: ICSRGBA, score: ICContrastRatio)

extension ICTestCases.WCAG3KeystoneTests {

    /// Source: https://github.com/Myndex/SAPC-APCA/commit/b206f4de40b3c98b1c9bc9a9b4af98de8990f9d1
    
    static let cases = [case1, case2, case3, case4]
    
    static let case1 = (text: ICSRGBA(136),
                        bg: ICSRGBA(255),
                        score: ICContrastRatio(66.89346308821438))
    
    static let case2 = (text: ICSRGBA(170),
                        bg: ICSRGBA(0),
                        score: ICContrastRatio(-60.438571788907524))
    
    static let case3 = (text: ICSRGBA(221, 238, 255),
                        bg: ICSRGBA(17, 34, 51),
                        score: ICContrastRatio(-98.44863435731266))
    
    static let case4 = (text: ICSRGBA(17, 34, 51),
                        bg: ICSRGBA(34, 51, 68),
                        score: ICContrastRatio(1.276075977788573))
}

// APCA contrast 0 - 100
// 80 Similar to 7:1   for BG ddd and lighter
// 60 Similar to 4.5:1 for BG d0d0d0 and lighter
// 40 Similar to 3:1   for BG ccc and lighter
