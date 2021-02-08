import Foundation

extension ICPalettes.BrewerHarrower.Diverging {
    
    struct BrownGreen: AccessiblePalette {
        
        public let title = "Brown Green"
        
        public let description = ICPalettes.BrewerHarrower.description
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .divergingData]
        
        public let author = ICPalettes.BrewerHarrower.author
        public let license = ICPalettes.BrewerHarrower.license
        public let licenseCopy = ICPalettes.BrewerHarrower.licenseCopy
        public let link = ICPalettes.BrewerHarrower.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Orange
            case color1YellowOrange
            case color2Gray
            case color3CyanGreen
            case color4CyanGreen
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Orange:       return ICSRGBA(166,  97,  26)
                    case .color1YellowOrange: return ICSRGBA(223, 194, 125)
                    case .color2Gray:         return ICSRGBA(245, 245, 245)
                    case .color3CyanGreen:    return ICSRGBA(128, 205, 193)
                    case .color4CyanGreen:    return ICSRGBA(  1, 133, 113)
                }
            }
        }
    }
    
    struct PinkYellowGreen: AccessiblePalette {
        
        public let title = "Pink Yellow Green"
        
        public let description = ICPalettes.BrewerHarrower.description
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .divergingData]
        
        public let author = ICPalettes.BrewerHarrower.author
        public let license = ICPalettes.BrewerHarrower.license
        public let licenseCopy = ICPalettes.BrewerHarrower.licenseCopy
        public let link = ICPalettes.BrewerHarrower.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Scarlet
            case color1Scarlet
            case color2Gray
            case color3YellowGreen
            case color4GreenSapling
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Scarlet:      return ICSRGBA(208,  28, 139)
                    case .color1Scarlet:      return ICSRGBA(241, 182, 218)
                    case .color2Gray:         return ICSRGBA(247, 247, 247)
                    case .color3YellowGreen:  return ICSRGBA(184, 225, 134)
                    case .color4GreenSapling: return ICSRGBA( 77, 172,  38)
                        
                }
            }
        }
    }
    
    struct PurpleGreen: AccessiblePalette {
        
        public let title = "Purple Green"
        
        public let description = ICPalettes.BrewerHarrower.description
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .divergingData]
        
        public let author = ICPalettes.BrewerHarrower.author
        public let license = ICPalettes.BrewerHarrower.license
        public let licenseCopy = ICPalettes.BrewerHarrower.licenseCopy
        public let link = ICPalettes.BrewerHarrower.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0PurpleMagenta
            case color1PurpleMagenta
            case color2Gray
            case color3Green
            case color4GreenishBlue
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0PurpleMagenta: return ICSRGBA(123,  50, 148)
                    case .color1PurpleMagenta: return ICSRGBA(194, 165, 207)
                    case .color2Gray:          return ICSRGBA(247, 247, 147)
                    case .color3Green:         return ICSRGBA(166, 219, 160)
                    case .color4GreenishBlue:  return ICSRGBA(  0, 136,  55)
                }
                
            }
        }
    }
    
    struct PurpleOrange: AccessiblePalette {
        
        public let title = "Purple Orange"
        
        public let description = ICPalettes.BrewerHarrower.description
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .divergingData]
        
        public let author = ICPalettes.BrewerHarrower.author
        public let license = ICPalettes.BrewerHarrower.license
        public let licenseCopy = ICPalettes.BrewerHarrower.licenseCopy
        public let link = ICPalettes.BrewerHarrower.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0PurpleViolet
            case color1PurpleViolet
            case color2Gray
            case color3Orange
            case color4RedOrange
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0PurpleViolet: return ICSRGBA( 94,  60, 153)
                    case .color1PurpleViolet: return ICSRGBA(178, 171, 210)
                    case .color2Gray:         return ICSRGBA(247, 247, 247)
                    case .color3Orange:       return ICSRGBA(253, 184,  99)
                    case .color4RedOrange:    return ICSRGBA(230,  97,  1)
                        
                }
            }
        }
    }
    
    struct RedBlue: AccessiblePalette {
        
        public let title = "Red Blue"
        
        public let description = ICPalettes.BrewerHarrower.description
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .divergingData]
        
        public let author = ICPalettes.BrewerHarrower.author
        public let license = ICPalettes.BrewerHarrower.license
        public let licenseCopy = ICPalettes.BrewerHarrower.licenseCopy
        public let link = ICPalettes.BrewerHarrower.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0ScarletRed
            case color1RedOrange
            case color2Gray
            case color3BluishCyan
            case color4BluishCyan
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0ScarletRed: return ICSRGBA(202,   0,  32)
                    case .color1RedOrange:  return ICSRGBA(244, 165, 130)
                    case .color2Gray:       return ICSRGBA(247, 247, 247)
                    case .color3BluishCyan: return ICSRGBA(146, 197, 222)
                    case .color4BluishCyan: return ICSRGBA(  5, 113, 176)
                }
            }
        }
    }
}

