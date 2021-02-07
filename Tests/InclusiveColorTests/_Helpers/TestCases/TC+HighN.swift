import Foundation
import InclusiveColor

extension ICTestCases.LargerN {
    
    static func make50colors() -> [ICSRGBA] {
        let ten = [
            ICSRGBA(1, 11, 21),
            ICSRGBA(2, 12, 22),
            ICSRGBA(3, 13, 23),
            ICSRGBA(4, 14, 24),
            ICSRGBA(5, 15, 25),
            ICSRGBA(6, 16, 26),
            ICSRGBA(7, 17, 27),
            ICSRGBA(8, 18, 28),
            ICSRGBA(9, 19, 29),
            ICSRGBA(10, 11, 12)
        ]
    
        var fifty = ten
        fifty.append(contentsOf: ten)
        fifty.append(contentsOf: ten)
        fifty.append(contentsOf: ten)
        fifty.append(contentsOf: ten)
        
        return fifty
    }
    
    static func make1000colors() -> [ICSRGBA] {
        let ten = [
            ICSRGBA(1, 11, 21),
            ICSRGBA(2, 12, 22),
            ICSRGBA(3, 13, 23),
            ICSRGBA(4, 14, 24),
            ICSRGBA(5, 15, 25),
            ICSRGBA(6, 16, 26),
            ICSRGBA(7, 17, 27),
            ICSRGBA(8, 18, 28),
            ICSRGBA(9, 19, 29),
            ICSRGBA(10, 11, 12)
        ]
        
        var hundred = ten
        hundred.append(contentsOf: ten)
        hundred.append(contentsOf: ten)
        hundred.append(contentsOf: ten)
        hundred.append(contentsOf: ten)
        hundred.append(contentsOf: hundred)
        
        var thousand = hundred
        thousand.append(contentsOf: hundred)
        thousand.append(contentsOf: hundred)
        thousand.append(contentsOf: hundred)
        thousand.append(contentsOf: hundred)
        thousand.append(contentsOf: thousand)
        
        return thousand
    }
    
    static func make10kcolors() -> [ICSRGBA] {
        let thousand = make1000colors().shuffled()
        
        var ten = thousand
        ten.append(contentsOf: thousand)
        ten.append(contentsOf: thousand)
        ten.append(contentsOf: thousand)
        ten.append(contentsOf: thousand)
        ten.append(contentsOf: ten)

        return ten
    }
    
    static func make100kcolors() -> [ICSRGBA] {
        let ten = make10kcolors()
        
        var hundred = ten
        hundred.append(contentsOf: ten)
        hundred.append(contentsOf: ten)
        hundred.append(contentsOf: ten)
        hundred.append(contentsOf: ten)
        hundred.append(contentsOf: hundred)
        
        return hundred
    }
    
    static func make1Mcolors() -> [ICSRGBA] {
        let hundred = make100kcolors()
        
        var million = hundred
        million.append(contentsOf: hundred)
        million.append(contentsOf: hundred)
        million.append(contentsOf: hundred)
        million.append(contentsOf: hundred)
        million.append(contentsOf: million)
        
        return million
    }
}
