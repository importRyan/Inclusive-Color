import Foundation

public extension ICPalettes.FabioCrameri.Diverging {
    
    struct Broc: AccessiblePalette {
        
        public let title = "Broc"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.divergingData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba } }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0PurpleViolet
            case color1BlueViolet
            case color2Blue
            case color3Blue
            case color4Blue
            case color5Yellow
            case color6Yellow
            case color7Yellow
            case color8Yellow
            case color9Yellow
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0PurpleViolet: return ICSRGBA( 43,  25,  76)
                    case .color1BlueViolet:   return ICSRGBA( 40,  68, 118)
                    case .color2Blue:         return ICSRGBA( 75, 117, 160)
                    case .color3Blue:         return ICSRGBA(138, 166, 194)
                    case .color4Blue:         return ICSRGBA(205, 217, 228)
                    case .color5Yellow:       return ICSRGBA(232, 232, 209)
                    case .color6Yellow:       return ICSRGBA(196, 196, 142)
                    case .color7Yellow:       return ICSRGBA(141, 141,  85)
                    case .color8Yellow:       return ICSRGBA( 85,  85,  39)
                    case .color9Yellow:       return ICSRGBA( 38,  38,   0)
                }
            }
        }
    }
    
    
    struct Cork: AccessiblePalette {
        
        public let title = "Cork"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.divergingData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0PurpleViolet
            case color1BlueViolet
            case color2Blue
            case color3Blue
            case color4Blue
            case color5Green
            case color6Green
            case color7Green
            case color8Green
            case color9GreenSapling
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0PurpleViolet: return ICSRGBA( 43,  25,  76)
                    case .color1BlueViolet:   return ICSRGBA( 39,  68, 119)
                    case .color2Blue:         return ICSRGBA( 72, 116, 158)
                    case .color3Blue:         return ICSRGBA(130, 160, 189)
                    case .color4Blue:         return ICSRGBA(202, 215, 227)
                    case .color5Green:        return ICSRGBA(209, 224, 209)
                    case .color6Green:        return ICSRGBA(141, 179, 141)
                    case .color7Green:        return ICSRGBA( 78, 137,  78)
                    case .color8Green:        return ICSRGBA( 27,  91,  24)
                    case .color9GreenSapling: return ICSRGBA( 15,  40,   3)
                }
            }
        }
    }
    
    struct Vik: AccessiblePalette {
        
        public let title = "Vik"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.divergingData, .quantitative]
        
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
            case color2BluishCyan
            case color3BluishCyan
            case color4BluishCyan
            case color5RedOrange
            case color6RedOrange
            case color7RedOrange
            case color8RedOrange
            case color9Red
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0BlueViolet: return ICSRGBA(  0,  17,  96)
                    case .color1Blue:       return ICSRGBA(  2,  61, 124)
                    case .color2BluishCyan: return ICSRGBA( 30, 111, 157)
                    case .color3BluishCyan: return ICSRGBA(112, 168, 195)
                    case .color4BluishCyan: return ICSRGBA(201, 221, 230)
                    case .color5RedOrange:  return ICSRGBA(234, 205, 189)
                    case .color6RedOrange:  return ICSRGBA(211, 151, 116)
                    case .color7RedOrange:  return ICSRGBA(189, 101,  51)
                    case .color8RedOrange:  return ICSRGBA(139,  39,   5)
                    case .color9Red:        return ICSRGBA( 89,   0,   7)
                }
            }
        }
    }
    
    
    struct Lisbon: AccessiblePalette {
        
        public let title = "Lisbon"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.divergingData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Violet
            case color1BlueViolet
            case color2Blue
            case color3Blue
            case color4Blue
            case color5Yellow
            case color6YellowOrange
            case color7YellowOrange
            case color8Yellow
            case color9Yellow
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Violet:       return ICSRGBA(229, 229, 254)
                    case .color1BlueViolet:   return ICSRGBA(154, 174, 210)
                    case .color2Blue:         return ICSRGBA( 81, 119, 163)
                    case .color3Blue:         return ICSRGBA( 29,  67, 104)
                    case .color4Blue:         return ICSRGBA( 17,  29,  43)
                    case .color5Yellow:       return ICSRGBA( 38,  37,  25)
                    case .color6YellowOrange: return ICSRGBA( 86,  81,  51)
                    case .color7YellowOrange: return ICSRGBA(141, 133,  86)
                    case .color8Yellow:       return ICSRGBA(200, 194, 144)
                    case .color9Yellow:       return ICSRGBA(254, 254, 216)
                }
            }
        }
    }
    
    struct Tofino: AccessiblePalette {
        
        public let title = "Tofino"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.divergingData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0PurpleViolet
            case color1BlueViolet
            case color2BlueViolet
            case color3BlueViolet
            case color4Blue
            case color5Green
            case color6Green
            case color7Green
            case color8GreenSapling
            case color9LemonRipening
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0PurpleViolet:  return ICSRGBA(221, 216, 254)
                    case .color1BlueViolet:    return ICSRGBA(146, 164, 222)
                    case .color2BlueViolet:    return ICSRGBA( 74, 107, 172)
                    case .color3BlueViolet:    return ICSRGBA( 39,  60, 100)
                    case .color4Blue:          return ICSRGBA( 17,  25,  38)
                    case .color5Green:         return ICSRGBA( 17,  34,  19)
                    case .color6Green:         return ICSRGBA( 36,  77,  40)
                    case .color7Green:         return ICSRGBA( 63, 128,  67)
                    case .color8GreenSapling:  return ICSRGBA(135, 185, 111)
                    case .color9LemonRipening: return ICSRGBA(219, 229, 155)
                }
            }
        }
    }
    
    struct Berlin: AccessiblePalette {
        
        public let title = "Berlin"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.divergingData, .quantitative]
        
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
            case color2BluishCyan
            case color3BluishCyan
            case color4Blue
            case color5RedOrange
            case color6RedOrange
            case color7RedOrange
            case color8Red
            case color9Red
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0BlueViolet: return ICSRGBA(158, 175, 254)
                    case .color1Blue:       return ICSRGBA( 90, 163, 218)
                    case .color2BluishCyan: return ICSRGBA( 45, 116, 150)
                    case .color3BluishCyan: return ICSRGBA( 25,  66,  85)
                    case .color4Blue:       return ICSRGBA( 16,  24,  29)
                    case .color5RedOrange:  return ICSRGBA( 40,  13,   0)
                    case .color6RedOrange:  return ICSRGBA( 80,  23,   3)
                    case .color7RedOrange:  return ICSRGBA(138,  62,  41)
                    case .color8Red:        return ICSRGBA(196, 117, 106)
                    case .color9Red:        return ICSRGBA(254, 173, 173)
                }
            }
        }
    }
    
    
    struct Roma: AccessiblePalette {
        
        public let title = "Roma"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.divergingData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0RedOrange
            case color1Orange
            case color2YellowOrange
            case color3YellowOrange
            case color4LemonRipening
            case color5CyanGreen
            case color6BluishCyan
            case color7BluishCyan
            case color8Blue
            case color9BlueViolet
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0RedOrange:     return ICSRGBA(125,  23,   0)
                    case .color1Orange:        return ICSRGBA(153,  81,  21)
                    case .color2YellowOrange:  return ICSRGBA(176, 128,  42)
                    case .color3YellowOrange:  return ICSRGBA(200, 180,  85)
                    case .color4LemonRipening: return ICSRGBA(208, 226, 163)
                    case .color5CyanGreen:     return ICSRGBA(164, 229, 211)
                    case .color6BluishCyan:    return ICSRGBA( 93, 192, 211)
                    case .color7BluishCyan:    return ICSRGBA( 50, 145, 193)
                    case .color8Blue:          return ICSRGBA( 32,  99, 174)
                    case .color9BlueViolet:    return ICSRGBA(  2,  48, 152)
                }
            }
        }
    }
    
    struct Bam: AccessiblePalette {
        
        public let title = "Bam"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.divergingData, .quantitative]
        
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
            case color3Crimson
            case color4Crimson
            case color5LemonRipening
            case color6YellowGreen
            case color7YellowGreen
            case color8GreenSapling
            case color9GreenSapling
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Crimson:       return ICSRGBA(101,   2,  75)
                    case .color1Crimson:       return ICSRGBA(158,  59, 132)
                    case .color2Crimson:       return ICSRGBA(200, 111, 177)
                    case .color3Crimson:       return ICSRGBA(228, 174, 214)
                    case .color4Crimson:       return ICSRGBA(244, 227, 239)
                    case .color5LemonRipening: return ICSRGBA(238, 242, 228)
                    case .color6YellowGreen:   return ICSRGBA(193, 217, 161)
                    case .color7YellowGreen:   return ICSRGBA(124, 168,  86)
                    case .color8GreenSapling:  return ICSRGBA( 69, 122,  42)
                    case .color9GreenSapling:  return ICSRGBA( 12,  75,   0)
                }
            }
        }
    }
    
    struct Vanimo: AccessiblePalette {
        
        public let title = "Vanimo"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.divergingData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Magenta
            case color1Crimson
            case color2Crimson
            case color3Crimson
            case color4Scarlet
            case color5LemonRipening
            case color6YellowGreen
            case color7YellowGreen
            case color8YellowGreen
            case color9GreenSapling
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Magenta:       return ICSRGBA(255, 204, 252)
                    case .color1Crimson:       return ICSRGBA(211, 129, 196)
                    case .color2Crimson:       return ICSRGBA(161,  73, 142)
                    case .color3Crimson:       return ICSRGBA( 91,  36,  79)
                    case .color4Scarlet:       return ICSRGBA( 34,  19,  28)
                    case .color5LemonRipening: return ICSRGBA( 27,  29,  17)
                    case .color6YellowGreen:   return ICSRGBA( 53,  73,  26)
                    case .color7YellowGreen:   return ICSRGBA( 91, 126,  45)
                    case .color8YellowGreen:   return ICSRGBA(132, 181,  76)
                    case .color9GreenSapling:  return ICSRGBA(189, 252, 165)
                }
            }
        }
    }
}
