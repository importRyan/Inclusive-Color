import Foundation

public extension ICPalettes.FabioCrameri.Multisequential {
    
    struct Oleron: AccessiblePalette {
        
        public let title = "Oleron"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.multisequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case seriesA_0BlueViolet
            case seriesA_1BlueViolet
            case seriesA_2BlueViolet
            case seriesA_3BlueViolet
            case seriesA_4BlueViolet
            case seriesB_5LemonRipening
            case seriesB_6Yellow
            case seriesB_7YellowOrange
            case seriesB_8Orange
            case seriesB_9Yellow
            
            public var srgba: ICSRGBA {
                switch self {
                    case .seriesA_0BlueViolet:    return ICSRGBA( 25,  38,  89)
                    case .seriesA_1BlueViolet:    return ICSRGBA( 69,  81, 133)
                    case .seriesA_2BlueViolet:    return ICSRGBA(118, 131, 182)
                    case .seriesA_3BlueViolet:    return ICSRGBA(169, 182, 231)
                    case .seriesA_4BlueViolet:    return ICSRGBA(210, 223, 250)
                    case .seriesB_5LemonRipening: return ICSRGBA( 59,  86,   0)
                    case .seriesB_6Yellow:        return ICSRGBA(121, 113,  30)
                    case .seriesB_7YellowOrange:  return ICSRGBA(183, 154,  94)
                    case .seriesB_8Orange:        return ICSRGBA(240, 206, 164)
                    case .seriesB_9Yellow:        return ICSRGBA(252, 252, 229)
                }
            }
        }
    }
    
    struct Bukavu: AccessiblePalette {
        
        public let title = "Bukavu"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.multisequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case seriesA_0Cyan
            case seriesA_1Blue
            case seriesA_2Blue
            case seriesA_3BluishCyan
            case seriesA_4CyanGreen
            case seriesB_5Green
            case seriesB_6LemonRipening
            case seriesB_7Brown
            case seriesB_8Orange
            case seriesB_9Violet
            
            public var srgba: ICSRGBA {
                switch self {
                    case .seriesA_0Cyan:          return ICSRGBA( 25,  51,  51)
                    case .seriesA_1Blue:          return ICSRGBA( 33,  80, 119)
                    case .seriesA_2Blue:          return ICSRGBA( 51, 132, 194)
                    case .seriesA_3BluishCyan:    return ICSRGBA(102, 180, 202)
                    case .seriesA_4CyanGreen:     return ICSRGBA(178, 229, 216)
                    case .seriesB_5Green:         return ICSRGBA( 18,  82,  23)
                    case .seriesB_6LemonRipening: return ICSRGBA(105, 115,  40)
                    case .seriesB_7Brown:         return ICSRGBA(169, 132,  79)
                    case .seriesB_8Orange:        return ICSRGBA(210, 193, 169)
                    case .seriesB_9Violet:        return ICSRGBA(237, 236, 252)
                }
            }
        }
    }
    
    struct Fes: AccessiblePalette {
        
        public let title = "Fes"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.multisequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case seriesA_0Gray
            case seriesA_1Gray
            case seriesA_2Gray
            case seriesA_3Gray
            case seriesA_4Gray
            case seriesB_5GreenSapling
            case seriesB_6YellowOrange
            case seriesB_7Orange
            case seriesB_8Orange
            case seriesB_9Violet
            
            public var srgba: ICSRGBA {
                switch self {
                    case .seriesA_0Gray:         return ICSRGBA( 12,  12,  12)
                    case .seriesA_1Gray:         return ICSRGBA( 63,  63,  63)
                    case .seriesA_2Gray:         return ICSRGBA(108, 108, 108)
                    case .seriesA_3Gray:         return ICSRGBA(150, 150, 150)
                    case .seriesA_4Gray:         return ICSRGBA(206, 206, 206)
                    case .seriesB_5GreenSapling: return ICSRGBA( 45,  79,  31)
                    case .seriesB_6YellowOrange: return ICSRGBA(117,  99,  42)
                    case .seriesB_7Orange:       return ICSRGBA(182, 130,  76)
                    case .seriesB_8Orange:       return ICSRGBA(211, 194, 169)
                    case .seriesB_9Violet:       return ICSRGBA(237, 236, 251)
                }
            }
        }
    }
}
