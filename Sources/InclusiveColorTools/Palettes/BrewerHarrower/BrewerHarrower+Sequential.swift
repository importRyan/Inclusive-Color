import Foundation

extension ICPalettes.BrewerHarrower.Sequential {
    
    struct Reds: AccessiblePalette {
        
        public let title = "Reds"
        
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
            case color1RedOrange
            case color2RedOrange
            case color3Red
            case color4Red
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0RedOrange: return ICSRGBA(254, 229, 217)
                    case .color1RedOrange: return ICSRGBA(252, 174, 144)
                    case .color2RedOrange: return ICSRGBA(250, 105,  73)
                    case .color3Red:       return ICSRGBA(222,  45,  37)
                    case .color4Red:       return ICSRGBA(165,  21,  21)
                }
            }
        }
    }
    
    struct Blues: AccessiblePalette {
        
        public let title = "Blues"
        
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
            case color0BlueViolet
            case color1BluishCyan
            case color2BluishCyan
            case color3Blue
            case color4Blue
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0BlueViolet: return ICSRGBA(238, 242, 254)
                    case .color1BluishCyan: return ICSRGBA(189, 215, 231)
                    case .color2BluishCyan: return ICSRGBA(106, 173, 214)
                    case .color3Blue:       return ICSRGBA( 49, 130, 189)
                    case .color4Blue:       return ICSRGBA(  8,  81, 156)
                }
            }
        }
    }
    
    struct Greens: AccessiblePalette {
        
        public let title = "Greens"
        
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
            case color0GreenSapling
            case color1GreenSapling
            case color2Green
            case color3GreenishBlue
            case color4Turquoise
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0GreenSapling: return ICSRGBA(237, 248, 233)
                    case .color1GreenSapling: return ICSRGBA(186, 228, 179)
                    case .color2Green:        return ICSRGBA(116, 196, 118)
                    case .color3GreenishBlue: return ICSRGBA( 48, 163,  84)
                    case .color4Turquoise:    return ICSRGBA(  0, 109,  44)
                }
            }
        }
    }
    
    struct Grays: AccessiblePalette {
        
        public let title = "Grays"
        
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
            case color0Gray
            case color1Gray
            case color2Gray
            case color3Gray
            case color4Gray
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Gray: return ICSRGBA(247, 247, 247)
                    case .color1Gray: return ICSRGBA(204, 204, 204)
                    case .color2Gray: return ICSRGBA(150, 150, 150)
                    case .color3Gray: return ICSRGBA( 99,  99,  99)
                    case .color4Gray: return ICSRGBA( 37,  37,  37)
                }
            }
        }
        
    }
    
    struct Oranges: AccessiblePalette {
        
        public let title = "Oranges"
        
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
            case color2Orange
            case color3RedOrange
            case color4RedOrange
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Orange:    return ICSRGBA(254, 237, 222)
                    case .color1Orange:    return ICSRGBA(253, 190, 133)
                    case .color2Orange:    return ICSRGBA(253, 140,  60)
                    case .color3RedOrange: return ICSRGBA(230,  85,  13)
                    case .color4RedOrange: return ICSRGBA(166,  54,   3)
                }
            }
            
        }
    }
    
    struct Purples: AccessiblePalette {
        
        public let title = "Purples"
        
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
            case color0Gray
            case color1Violet
            case color2Violet
            case color3PurpleViolet
            case color4Purple
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Gray:         return ICSRGBA(242, 240, 247)
                    case .color1Violet:       return ICSRGBA(203, 201, 226)
                    case .color2Violet:       return ICSRGBA(158, 154, 200)
                    case .color3PurpleViolet: return ICSRGBA(117, 107, 177)
                    case .color4Purple:       return ICSRGBA( 84,  39, 143)
                }
            }
        }
    }
}
