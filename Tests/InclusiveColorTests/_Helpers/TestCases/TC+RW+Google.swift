import Foundation
import InclusiveColor

extension ICTestCases.RealWorld.Google {
    
    static let cases = [g, o, ooo, l]

    static let colors = cases.map { $0[.typicalTrichromacy]! }
    
    /// Logo Jan 2021
    static let g: AlreadySimulated = [
        .typicalTrichromacy : ICSRGBA(66,133,244)
    ]
    
    /// Logo Jan 2021
    static let o: AlreadySimulated = [
        .typicalTrichromacy : ICSRGBA(234, 67, 53)
    ]
    
    /// Logo Jan 2021
    static let ooo: AlreadySimulated = [
        .typicalTrichromacy : ICSRGBA(251, 188, 5)
    ]
    
    /// Logo Jan 2021
    static let l: AlreadySimulated = [
        .typicalTrichromacy : ICSRGBA(52, 168, 83)
    ]
    

}
