import Foundation

public extension ICPalettes.FabioCrameri.Cyclic {
    
    
    struct RomaO: AccessiblePalette {
        
        public let title = "RomaO"
        
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
            case color0Red
            case color1Orange
            case color2YellowOrange
            case color3Yellow
            case color4Turquoise
            case color5BluishCyan
            case color6Blue
            case color7PurpleViolet
            case color8Scarlet
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Red:          return ICSRGBA(135,  64,  55)
                    case .color1Orange:       return ICSRGBA(163, 103,  44)
                    case .color2YellowOrange: return ICSRGBA(195, 163,  75)
                    case .color3Yellow:       return ICSRGBA(214, 216, 147)
                    case .color4Turquoise:    return ICSRGBA(180, 222, 198)
                    case .color5BluishCyan:   return ICSRGBA(116, 187, 205)
                    case .color6Blue:         return ICSRGBA( 79, 136, 185)
                    case .color7PurpleViolet: return ICSRGBA( 92,  83, 139)
                    case .color8Scarlet:      return ICSRGBA(115,  57,  87)
                }
            }
        }
    }
    
    struct BamO: AccessiblePalette {
        
        public let title = "BamO"
        
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
            case color0Crimson
            case color1Crimson
            case color2Crimson
            case color3ScarletRed
            case color4LemonRipening
            case color5LemonRipening
            case color6LemonRipening
            case color7Orange
            case color8Scarlet
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Crimson:       return ICSRGBA(118,  61, 105)
                    case .color1Crimson:       return ICSRGBA(176, 110, 160)
                    case .color2Crimson:       return ICSRGBA(211, 162, 196)
                    case .color3ScarletRed:    return ICSRGBA(218, 198, 204)
                    case .color4LemonRipening: return ICSRGBA(196, 202, 173)
                    case .color5LemonRipening: return ICSRGBA(146, 161, 115)
                    case .color6LemonRipening: return ICSRGBA(103, 110,  77)
                    case .color7Orange:        return ICSRGBA( 77,  68,  59)
                    case .color8Scarlet:       return ICSRGBA( 76,  46,  64)
                }
            }
        }
    }
    
    struct BrocO: AccessiblePalette {
        
        public let title = "BrocO"
        
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
            case color0BlueViolet
            case color1Blue
            case color2Blue
            case color3BluishCyan
            case color4Yellow
            case color5Yellow
            case color6Yellow
            case color7YellowOrange
            case color8Magenta
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0BlueViolet:   return ICSRGBA( 56,  65, 100)
                    case .color1Blue:         return ICSRGBA( 85, 114, 154)
                    case .color2Blue:         return ICSRGBA(138, 163, 191)
                    case .color3BluishCyan:   return ICSRGBA(193, 204, 208)
                    case .color4Yellow:       return ICSRGBA(202, 203, 171)
                    case .color5Yellow:       return ICSRGBA(158, 158, 108)
                    case .color6Yellow:       return ICSRGBA(107, 105,  61)
                    case .color7YellowOrange: return ICSRGBA( 68,  63,  41)
                    case .color8Magenta:      return ICSRGBA( 55,  47,  56)
                }
            }
        }
    }
    
    
    struct CorkO: AccessiblePalette {
        
        public let title = "CorkO"
        
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
            case color0BlueViolet
            case color1Blue
            case color2Blue
            case color3BluishCyan
            case color4GreenishBlue
            case color5Green
            case color6GreenSapling
            case color7LemonRipening
            case color8YellowOrange
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0BlueViolet:    return ICSRGBA( 54,  60,  81)
                    case .color1Blue:          return ICSRGBA( 73,  99, 135)
                    case .color2Blue:          return ICSRGBA(120, 148, 176)
                    case .color3BluishCyan:    return ICSRGBA(164, 188, 192)
                    case .color4GreenishBlue:  return ICSRGBA(152, 188, 158)
                    case .color5Green:         return ICSRGBA(106, 152, 103)
                    case .color6GreenSapling:  return ICSRGBA( 71, 103,  55)
                    case .color7LemonRipening: return ICSRGBA( 59,  69,  41)
                    case .color8YellowOrange:  return ICSRGBA( 55,  54,  51)
                }
            }
        }
    }
    
    struct VikO: AccessiblePalette {
        
        public let title = "VikO"
        
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
            case color0BlueViolet
            case color1Blue
            case color2Blue
            case color3BluishCyan
            case color4GreenishBlue
            case color5Green
            case color6GreenSapling
            case color7LemonRipening
            case color8YellowOrange
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0BlueViolet:    return ICSRGBA( 62,  68,  93)
                    case .color1Blue:          return ICSRGBA( 84, 110, 148)
                    case .color2Blue:          return ICSRGBA(132, 158, 186)
                    case .color3BluishCyan:    return ICSRGBA(173, 196, 200)
                    case .color4GreenishBlue:  return ICSRGBA(161, 196, 166)
                    case .color5Green:         return ICSRGBA(115, 163, 111)
                    case .color6GreenSapling:  return ICSRGBA( 79, 115,  59)
                    case .color7LemonRipening: return ICSRGBA( 67,  79,  44)
                    case .color8YellowOrange:  return ICSRGBA( 63,  62,  58)
                }
            }
        }
    }
}
