import Foundation

public extension ICPalettes.PaulTol.DivergingData {
    
    struct Sunset: AccessiblePalette {
        
        public let title = "Sunset"
        
        public let description = """
colors can be used as given or linearly interpolated using equidistant points, but should not be mixed with other schemes. For clarity, the selected colors follow a non-linear progression.
"""
        public let tags: [ICPaletteUtilityTag] = [.quantitative,
                                                   .divergingData]
        
        public let author = ICPalettes.PaulTol.author
        public let license = ICPalettes.PaulTol.license
        public let licenseCopy = ICPalettes.PaulTol.licenseCopy
        public let link = ICPalettes.PaulTol.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case blueExtreme
            case blue1
            case blue2
            case blue3
            case blue4
            case middle
            case red4
            case red3
            case red2
            case red1
            case redExtreme
            case badDataWhite
            
            public var srgba: ICSRGBA {
                switch self {
                    case .blueExtreme: return ICSRGBA(54, 75, 154)
                    case .blue1: return ICSRGBA(74, 123, 183)
                    case .blue2: return ICSRGBA(110, 166, 205)
                    case .blue3: return ICSRGBA(152, 202, 225)
                    case .blue4: return ICSRGBA(194, 228, 239)
                    case .middle: return ICSRGBA(234, 236, 204)
                    case .red4: return ICSRGBA(254, 218, 139)
                    case .red3: return ICSRGBA(253, 179, 102)
                    case .red2: return ICSRGBA(246, 126, 75)
                    case .red1: return ICSRGBA(221, 61, 45)
                    case .redExtreme: return ICSRGBA(165, 0, 38)
                    case .badDataWhite: return ICSRGBA(255)
                }
            }
        }
    }
    
    struct BuRd: AccessiblePalette {
        
        public let title = "BuRd"
        
        public let description = """
colors can be used as given or linearly interpolated using equidistant points, but should not be mixed with other schemes. For clarity, the selected colors follow a non-linear progression.
"""
        public let tags: [ICPaletteUtilityTag] = [.quantitative,
                                                   .divergingData]
        
        public let author = ICPalettes.PaulTol.author
        public let license = ICPalettes.PaulTol.license
        public let licenseCopy = ICPalettes.PaulTol.licenseCopy
        public let link = ICPalettes.PaulTol.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case blueExtreme
            case blue1
            case blue2
            case blue3
            case middle
            case red3
            case red2
            case red1
            case redExtreme
            case badDataGrey
            
            public var srgba: ICSRGBA {
                switch self {
                    case .blueExtreme: return ICSRGBA(33, 102, 172)
                    case .blue1: return ICSRGBA(67, 147, 195)
                    case .blue2: return ICSRGBA(146, 197, 222)
                    case .blue3: return ICSRGBA(209, 229, 240)
                    case .middle: return ICSRGBA(247)
                    case .red3: return ICSRGBA(253, 219, 199)
                    case .red2: return ICSRGBA(244, 165, 130)
                    case .red1: return ICSRGBA(214, 96, 77)
                    case .redExtreme: return ICSRGBA(178, 24, 43)
                    case .badDataGrey: return ICSRGBA(255, 238, 153)
                }
            }
        }
    }
    
    struct PRGn: AccessiblePalette {
        
        public let title = "PRGn"
        
        public let description = """
Print-friendly. colors can be used as given or linearly interpolated using equidistant points, but should not be mixed with other schemes. For clarity, the selected colors follow a non-linear progression.
"""
        public let tags: [ICPaletteUtilityTag] = [.quantitative,
                                                   .divergingData]
        
        public let author = ICPalettes.PaulTol.author
        public let license = ICPalettes.PaulTol.license
        public let licenseCopy = ICPalettes.PaulTol.licenseCopy
        public let link = ICPalettes.PaulTol.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case purpleExtreme
            case purple1
            case purple2
            case purple3
            case middle
            case green3
            case green2
            case green1
            case greenExtreme
            case badDataGrey
            
            public var srgba: ICSRGBA {
                switch self {
                    case .purpleExtreme: return ICSRGBA(118, 42, 131)
                    case .purple1: return ICSRGBA(153, 112, 171)
                    case .purple2: return ICSRGBA(194, 165, 207)
                    case .purple3: return ICSRGBA(231, 212, 232)
                    case .middle: return ICSRGBA(247)
                    case .green3: return ICSRGBA(217, 240, 211)
                    case .green2: return ICSRGBA(172, 211, 158)
                    case .green1: return ICSRGBA(90, 174, 97)
                    case .greenExtreme: return ICSRGBA(27, 120, 55)
                    case .badDataGrey: return ICSRGBA(255, 238, 153)
                }
            }
        }
    }
}
