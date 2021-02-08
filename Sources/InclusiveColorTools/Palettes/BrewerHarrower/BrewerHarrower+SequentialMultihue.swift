import Foundation

extension ICPalettes.BrewerHarrower.Sequential {
    
    struct BluePurple: AccessiblePalette {
        
        public let title = "Blue Purple"
        
        public let description = ICPalettes.BrewerHarrower.description
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .sequentialData]
        
        public let author = ICPalettes.BrewerHarrower.author
        public let license = ICPalettes.BrewerHarrower.license
        public let licenseCopy = ICPalettes.BrewerHarrower.licenseCopy
        public let link = ICPalettes.BrewerHarrower.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0BluishCyan
            case color1Blue
            case color2BlueViolet
            case color3Purple
            case color4Purple
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0BluishCyan: return ICSRGBA(237, 248, 251)
                    case .color1Blue:       return ICSRGBA(179, 205, 227)
                    case .color2BlueViolet: return ICSRGBA(140, 150, 198)
                    case .color3Purple:     return ICSRGBA(136,  87, 167)
                    case .color4Purple:     return ICSRGBA(129,  15, 124)
                }
            }
        }
    }
    
    struct OrangeRed: AccessiblePalette {
        
        public let title = "Orange Red"
        
        public let description = ICPalettes.BrewerHarrower.description
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .sequentialData]
        
        public let author = ICPalettes.BrewerHarrower.author
        public let license = ICPalettes.BrewerHarrower.license
        public let licenseCopy = ICPalettes.BrewerHarrower.licenseCopy
        public let link = ICPalettes.BrewerHarrower.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Orange
            case color1Orange
            case color2RedOrange
            case color3Red
            case color4Red
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Orange:    return ICSRGBA(254, 240, 217)
                    case .color1Orange:    return ICSRGBA(253, 204, 138)
                    case .color2RedOrange: return ICSRGBA(252, 141,  89)
                    case .color3Red:       return ICSRGBA(227,  74,  51)
                    case .color4Red:       return ICSRGBA(179,   0,   0)
                }
            }
        }
    }
    
    struct PurpleBlue: AccessiblePalette {
        
        public let title = "Purple Blue"
        
        public let description = ICPalettes.BrewerHarrower.description
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .sequentialData]
        
        public let author = ICPalettes.BrewerHarrower.author
        public let license = ICPalettes.BrewerHarrower.license
        public let licenseCopy = ICPalettes.BrewerHarrower.licenseCopy
        public let link = ICPalettes.BrewerHarrower.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Purple
            case color1BlueViolet
            case color2Blue
            case color3BluishCyan
            case color4BluishCyan
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Purple:     return ICSRGBA(241, 238, 246)
                    case .color1BlueViolet: return ICSRGBA(189, 201, 225)
                    case .color2Blue:       return ICSRGBA(116, 169, 207)
                    case .color3BluishCyan: return ICSRGBA( 43, 140, 190)
                    case .color4BluishCyan: return ICSRGBA(  4,  90, 141)
                }
            }
        }
    }
    
    
    struct RedPurple: AccessiblePalette {
        
        public let title = "Red Purple"
        
        public let description = ICPalettes.BrewerHarrower.description
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .sequentialData]
        
        public let author = ICPalettes.BrewerHarrower.author
        public let license = ICPalettes.BrewerHarrower.license
        public let licenseCopy = ICPalettes.BrewerHarrower.licenseCopy
        public let link = ICPalettes.BrewerHarrower.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0RedOrange
            case color1Red
            case color2ScarletRed
            case color3Scarlet
            case color4Purple
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0RedOrange:  return ICSRGBA(254, 235, 226)
                    case .color1Red:        return ICSRGBA(251, 180, 185)
                    case .color2ScarletRed: return ICSRGBA(247, 104, 161)
                    case .color3Scarlet:    return ICSRGBA(197,  27, 138)
                    case .color4Purple:     return ICSRGBA(122,   1, 119)
                }
            }
        }
    }
    
    struct YellowGreenBlue: AccessiblePalette {
        
        public let title = "Yellow Green Blue"
        
        public let description = ICPalettes.BrewerHarrower.description
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .sequentialData]
        
        public let author = ICPalettes.BrewerHarrower.author
        public let license = ICPalettes.BrewerHarrower.license
        public let licenseCopy = ICPalettes.BrewerHarrower.licenseCopy
        public let link = ICPalettes.BrewerHarrower.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Yellow
            case color1GreenishBlue
            case color2Cyan
            case color3Blue
            case color4BlueViolet
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Yellow:       return ICSRGBA(255, 255, 204)
                    case .color1GreenishBlue: return ICSRGBA(161, 218, 180)
                    case .color2Cyan:         return ICSRGBA( 65, 182, 196)
                    case .color3Blue:         return ICSRGBA( 44, 127, 184)
                    case .color4BlueViolet:   return ICSRGBA( 37,  52, 148)
                }
            }
        }
    }
    
    struct YellowOrangeBrown: AccessiblePalette {
        
        public let title = "Yellow Orange Brown"
        
        public let description = ICPalettes.BrewerHarrower.description
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .sequentialData]
        
        public let author = ICPalettes.BrewerHarrower.author
        public let license = ICPalettes.BrewerHarrower.license
        public let licenseCopy = ICPalettes.BrewerHarrower.licenseCopy
        public let link = ICPalettes.BrewerHarrower.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Yellow
            case color1YellowOrange
            case color2Orange
            case color3RedOrange
            case color4RedOrange
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Yellow:       return ICSRGBA(255, 255, 212)
                    case .color1YellowOrange: return ICSRGBA(254, 217, 142)
                    case .color2Orange:       return ICSRGBA(254, 153,  41)
                    case .color3RedOrange:    return ICSRGBA(217,  95,  14)
                    case .color4RedOrange:    return ICSRGBA(153,  52,   4)
                }
            }
        }
    }
    
    struct YellowOrangeRed: AccessiblePalette {
        
        public let title = "Yellow Orange Red"
        
        public let description = ICPalettes.BrewerHarrower.description
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .sequentialData]
        
        public let author = ICPalettes.BrewerHarrower.author
        public let license = ICPalettes.BrewerHarrower.license
        public let licenseCopy = ICPalettes.BrewerHarrower.licenseCopy
        public let link = ICPalettes.BrewerHarrower.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Yellow
            case color1YellowOrange
            case color2RedOrange
            case color3Red
            case color4ScarletRed
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Yellow:       return ICSRGBA(255, 254, 178)
                    case .color1YellowOrange: return ICSRGBA(254, 204,  92)
                    case .color2RedOrange:    return ICSRGBA(253, 141,  60)
                    case .color3Red:          return ICSRGBA(240,  59,  32)
                    case .color4ScarletRed:   return ICSRGBA(189,   0,  38)
                }
            }
        }
    }
}
