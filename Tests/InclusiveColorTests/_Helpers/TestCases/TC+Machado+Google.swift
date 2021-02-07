import Foundation
import InclusiveColor

extension ICTestCases.Machado.Google {
    
    static let cases = [g, o, ooo, l]
    
    /// Logo Jan 2021
    static let g: AlreadySimulated = [
        .typicalTrichromacy : ICSRGBA(66,133,244),
        .protanopia         : ICSRGBA(100, 136, 250),
        .deuteranopia       : ICSRGBA(83, 119, 241),
        .tritanopia         : ICSRGBA(29, 155, 166),
        .monochromacy   : ICSRGBA(135) // 126 in Firefox, but incorrect Y calc
    ]
    
    /// Logo Jan 2021
    static let o: AlreadySimulated = [
        .typicalTrichromacy : ICSRGBA(234, 67, 53),
        .protanopia         : ICSRGBA(95, 85, 52),
        .deuteranopia       : ICSRGBA(131, 113, 51),
        .tritanopia         : ICSRGBA(255, 52, 64),
        .monochromacy   : ICSRGBA(128) // 115 in Firefox, but incorrect Y calc
    ]
    
    /// Logo Jan 2021
    static let ooo: AlreadySimulated = [
        .typicalTrichromacy : ICSRGBA(251, 188, 5),
        .protanopia         : ICSRGBA(235, 177, 0), // B clipped -4
        .deuteranopia       : ICSRGBA(253, 197, 10),
        .tritanopia         : ICSRGBA(255, 156, 133),
        .monochromacy   : ICSRGBA(198) // 186 in Firefox, but incorrect Y calc
    ]
    
    /// Logo Jan 2021
    static let l: AlreadySimulated = [
        .typicalTrichromacy : ICSRGBA(52, 168, 83),
        .protanopia         : ICSRGBA(168, 146, 79),
        .deuteranopia       : ICSRGBA(145, 131, 87),
        .tritanopia         : ICSRGBA(38, 165, 142),
        .monochromacy   : ICSRGBA(147) // 124 in Firefox, but incorrect Y calc
    ]
}
