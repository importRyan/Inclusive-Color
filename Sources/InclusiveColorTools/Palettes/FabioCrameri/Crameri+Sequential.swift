import Foundation

public extension ICPalettes.FabioCrameri.Sequential {
    
    struct Batlow: AccessiblePalette {
        
        public let title = "Batlow"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
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
            case color3Turquoise
            case color4LemonRipening
            case color5YellowOrange
            case color6Orange
            case color7RedOrange
            case color8Red
            case color9Magenta
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0BlueViolet:    return ICSRGBA(  0,  25,  89)
                    case .color1Blue:          return ICSRGBA( 13,  54,  94)
                    case .color2BluishCyan:    return ICSRGBA( 28,  85,  96)
                    case .color3Turquoise:     return ICSRGBA( 62, 108,  84)
                    case .color4LemonRipening: return ICSRGBA(104, 122,  62)
                    case .color5YellowOrange:  return ICSRGBA(155, 136,  45)
                    case .color6Orange:        return ICSRGBA(212, 148,  71)
                    case .color7RedOrange:     return ICSRGBA(248, 162, 128)
                    case .color8Red:           return ICSRGBA(253, 183, 189)
                    case .color9Magenta:       return ICSRGBA(250, 204, 250)
                }
            }
        }
    }
    
    struct BatlowW: AccessiblePalette {
        
        public let title = "BatlowW"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
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
            case color2Cyan
            case color3Turquoise
            case color4YellowGreen
            case color5Yellow
            case color6Orange
            case color7RedOrange
            case color8Red
            case color9White
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0BlueViolet:  return ICSRGBA(  1,  25,  89)
                    case .color1Blue:        return ICSRGBA( 16,  62,  95)
                    case .color2Cyan:        return ICSRGBA( 26,  89,  98)
                    case .color3Turquoise:   return ICSRGBA( 56, 109,  88)
                    case .color4YellowGreen: return ICSRGBA(100, 126,  66)
                    case .color5Yellow:      return ICSRGBA(153, 144,  50)
                    case .color6Orange:      return ICSRGBA(207, 162,  90)
                    case .color7RedOrange:   return ICSRGBA(237, 175, 145)
                    case .color8Red:         return ICSRGBA(254, 216, 213)
                    case .color9White:       return ICSRGBA(255, 253, 253)
                }
            }
        }
    }
    
    struct BatlowK: AccessiblePalette {
        
        public let title = "BatlowK"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0BlueViolet
            case color1BluishCyan
            case color2Cyan
            case color3YellowGreen
            case color4Yellow
            case color5YellowOrange
            case color6Orange
            case color7RedOrange
            case color8ScarletRed
            case color9Magenta
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0BlueViolet:   return ICSRGBA(  2,   3,   5)
                    case .color1BluishCyan:   return ICSRGBA( 23,  45,  54)
                    case .color2Cyan:         return ICSRGBA( 52,  82,  81)
                    case .color3YellowGreen:  return ICSRGBA( 83, 100,  72)
                    case .color4Yellow:       return ICSRGBA(119, 118,  56)
                    case .color5YellowOrange: return ICSRGBA(169, 136,  51)
                    case .color6Orange:       return ICSRGBA(218, 150,  82)
                    case .color7RedOrange:    return ICSRGBA(247, 165, 137)
                    case .color8ScarletRed:   return ICSRGBA(253, 184, 193)
                    case .color9Magenta:      return ICSRGBA(250, 204, 250)
                }
            }
        }
    }
    
    struct Devon: AccessiblePalette {
        
        public let title = "Devon"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
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
            case color4BlueViolet
            case color5Violet
            case color6Violet
            case color7Violet
            case color8Violet
            case color9White
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0PurpleViolet: return ICSRGBA( 43,  25,  76)
                    case .color1BlueViolet:   return ICSRGBA( 41,  51, 102)
                    case .color2Blue:         return ICSRGBA( 39,  80, 133)
                    case .color3Blue:         return ICSRGBA( 53, 104, 172)
                    case .color4BlueViolet:   return ICSRGBA( 96, 129, 208)
                    case .color5Violet:       return ICSRGBA(151, 154, 230)
                    case .color6Violet:       return ICSRGBA(185, 179, 240)
                    case .color7Violet:       return ICSRGBA(207, 203, 245)
                    case .color8Violet:       return ICSRGBA(231, 229, 250)
                    case .color9White:        return ICSRGBA(254, 254, 254)
                }
            }
        }
    }
    
    struct LaJolla: AccessiblePalette {
        
        public let title = "LaJolla"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Yellow
            case color1YellowOrange
            case color2YellowOrange
            case color3Orange
            case color4RedOrange
            case color5RedOrange
            case color6Red
            case color7RedOrange
            case color8Orange
            case color9Yellow
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Yellow:       return ICSRGBA(254, 254, 203)
                    case .color1YellowOrange: return ICSRGBA(251, 235, 153)
                    case .color2YellowOrange: return ICSRGBA(243, 204, 103)
                    case .color3Orange:       return ICSRGBA(235, 167,  84)
                    case .color4RedOrange:    return ICSRGBA(228, 134,  80)
                    case .color5RedOrange:    return ICSRGBA(209,  98,  76)
                    case .color6Red:          return ICSRGBA(164,  70,  66)
                    case .color7RedOrange:    return ICSRGBA(114,  55,  46)
                    case .color8Orange:       return ICSRGBA( 66,  40,  24)
                    case .color9Yellow:       return ICSRGBA( 25,  25,   0)
                }
            }
        }
    }
    
    struct Bamako: AccessiblePalette {
        
        public let title = "Bamako"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0BluishCyan
            case color1CyanGreen
            case color2GreenishBlue
            case color3GreenSapling
            case color4YellowGreen
            case color5LemonRipening
            case color6Yellow
            case color7YellowOrange
            case color8YellowOrange
            case color9YellowOrange
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0BluishCyan:    return ICSRGBA(  0,  63,  76)
                    case .color1CyanGreen:     return ICSRGBA( 18,  74,  66)
                    case .color2GreenishBlue:  return ICSRGBA( 37,  87,  54)
                    case .color3GreenSapling:  return ICSRGBA( 58, 100,  42)
                    case .color4YellowGreen:   return ICSRGBA( 81, 116,  28)
                    case .color5LemonRipening: return ICSRGBA(113, 135,  10)
                    case .color6Yellow:        return ICSRGBA(150, 145,   6)
                    case .color7YellowOrange:  return ICSRGBA(196, 173,  49)
                    case .color8YellowOrange:  return ICSRGBA(230, 204, 104)
                    case .color9YellowOrange:  return ICSRGBA(254, 229, 152)
                }
            }
        }
    }
    
    struct Davos: AccessiblePalette {
        
        public let title = "Davos"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
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
            case color4BluishCyan
            case color5CyanGreen
            case color6YellowGreen
            case color7LemonRipening
            case color8Yellow
            case color9White
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Violet:        return ICSRGBA(  0,   5,  74)
                    case .color1BlueViolet:    return ICSRGBA( 17,  44, 113)
                    case .color2Blue:          return ICSRGBA( 40,  81, 145)
                    case .color3Blue:          return ICSRGBA( 67, 111, 157)
                    case .color4BluishCyan:    return ICSRGBA( 94, 132, 152)
                    case .color5CyanGreen:     return ICSRGBA(121, 150, 141)
                    case .color6YellowGreen:   return ICSRGBA(152, 172, 135)
                    case .color7LemonRipening: return ICSRGBA(200, 209, 157)
                    case .color8Yellow:        return ICSRGBA(242, 243, 210)
                    case .color9White:         return ICSRGBA(254, 254, 254)
                }
            }
        }
    }
    
    struct Bilbao: AccessiblePalette {
        
        public let title = "Bilbao"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0White
            case color1Gray
            case color2YellowOrange
            case color3YellowOrange
            case color4Orange
            case color5RedOrange
            case color6RedOrange
            case color7Red
            case color8Red
            case color9Red
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0White:        return ICSRGBA(255, 255, 254)
                    case .color1Gray:         return ICSRGBA(219, 219, 216)
                    case .color2YellowOrange: return ICSRGBA(196, 192, 175)
                    case .color3YellowOrange: return ICSRGBA(185, 174, 138)
                    case .color4Orange:       return ICSRGBA(174, 148, 108)
                    case .color5RedOrange:    return ICSRGBA(166, 122,  96)
                    case .color6RedOrange:    return ICSRGBA(158,  97,  84)
                    case .color7Red:          return ICSRGBA(141,  68,  65)
                    case .color8Red:          return ICSRGBA(110,  34,  34)
                    case .color9Red:          return ICSRGBA( 76,   0,   1)
                }
            }
        }
    }
    
    struct Nuuk: AccessiblePalette {
        
        public let title = "Nuuk"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Blue
            case color1BluishCyan
            case color2BluishCyan
            case color3BluishCyan
            case color4Turquoise
            case color5Yellow
            case color6Yellow
            case color7Yellow
            case color8Yellow
            case color9Yellow
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Blue:       return ICSRGBA(  4,  89, 140)
                    case .color1BluishCyan: return ICSRGBA( 41,  98, 131)
                    case .color2BluishCyan: return ICSRGBA( 74, 113, 131)
                    case .color3BluishCyan: return ICSRGBA(110, 134, 140)
                    case .color4Turquoise:  return ICSRGBA(145, 155, 150)
                    case .color5Yellow:     return ICSRGBA(171, 173, 149)
                    case .color6Yellow:     return ICSRGBA(185, 185, 140)
                    case .color7Yellow:     return ICSRGBA(198, 198, 131)
                    case .color8Yellow:     return ICSRGBA(224, 223, 141)
                    case .color9Yellow:     return ICSRGBA(254, 254, 179)
                }
            }
        }
    }
    
    struct Oslo: AccessiblePalette {
        
        public let title = "Oslo"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Green
            case color1Blue
            case color2Blue
            case color3Blue
            case color4Blue
            case color5Blue
            case color6BlueViolet
            case color7BlueViolet
            case color8Blue
            case color9White
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Green:      return ICSRGBA(  0,   1,   0)
                    case .color1Blue:       return ICSRGBA( 13,  26,  41)
                    case .color2Blue:       return ICSRGBA( 19,  50,  80)
                    case .color3Blue:       return ICSRGBA( 30,  76, 123)
                    case .color4Blue:       return ICSRGBA( 56, 104, 167)
                    case .color5Blue:       return ICSRGBA(101, 138, 198)
                    case .color6BlueViolet: return ICSRGBA(136, 160, 201)
                    case .color7BlueViolet: return ICSRGBA(170, 182, 202)
                    case .color8Blue:       return ICSRGBA(211, 214, 218)
                    case .color9White:      return ICSRGBA(254, 255, 254)
                }
            }
        }
    }
    
    struct GrayC: AccessiblePalette {
        
        public let title = "GrayC"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0White
            case color1Gray
            case color2Gray
            case color3Gray
            case color4Gray
            case color5Gray
            case color6Gray
            case color7Gray
            case color8Gray
            case color9Black
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0White: return ICSRGBA(254, 254, 254)
                    case .color1Gray:  return ICSRGBA(223, 223, 223)
                    case .color2Gray:  return ICSRGBA(191, 191, 191)
                    case .color3Gray:  return ICSRGBA(162, 162, 162)
                    case .color4Gray:  return ICSRGBA(133, 133, 133)
                    case .color5Gray:  return ICSRGBA(104, 104, 104)
                    case .color6Gray:  return ICSRGBA( 78,  78,  78)
                    case .color7Gray:  return ICSRGBA( 53,  53,  53)
                    case .color8Gray:  return ICSRGBA( 29,  29,  29)
                    case .color9Black: return ICSRGBA(  0,   0,   0)
                }
            }
        }
    }
    
    struct Hawaii: AccessiblePalette {
        
        public let title = "Hawaii"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Purple
            case color1Scarlet
            case color2Red
            case color3Brown
            case color4YellowOrange
            case color5LemonRipening
            case color6GreenSapling
            case color7Turquoise
            case color8CyanGreen
            case color9BluishCyan
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Purple:        return ICSRGBA(140,   1, 115)
                    case .color1Scarlet:       return ICSRGBA(145,  42,  88)
                    case .color2Red:           return ICSRGBA(149,  70,  66)
                    case .color3Brown:         return ICSRGBA(153,  98,  47)
                    case .color4YellowOrange:  return ICSRGBA(156, 130,  30)
                    case .color5LemonRipening: return ICSRGBA(150, 168,  41)
                    case .color6GreenSapling:  return ICSRGBA(127, 196,  94)
                    case .color7Turquoise:     return ICSRGBA(101, 216, 155)
                    case .color8CyanGreen:     return ICSRGBA(107, 234, 218)
                    case .color9BluishCyan:    return ICSRGBA(179, 241, 253)
                }
            }
        }
    }
    
    struct Lapaz: AccessiblePalette {
        
        public let title = "Lapaz"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0PurpleViolet
            case color1Violet
            case color2BlueViolet
            case color3Blue
            case color4Blue
            case color5BluishCyan
            case color6GreenishBlue
            case color7YellowOrange
            case color8Orange
            case color9Red
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0PurpleViolet: return ICSRGBA( 26,  12, 100)
                    case .color1Violet:       return ICSRGBA( 34,  45, 122)
                    case .color2BlueViolet:   return ICSRGBA( 42,  75, 142)
                    case .color3Blue:         return ICSRGBA( 53, 103, 156)
                    case .color4Blue:         return ICSRGBA( 75, 128, 163)
                    case .color5BluishCyan:   return ICSRGBA(109, 149, 160)
                    case .color6GreenishBlue: return ICSRGBA(147, 162, 151)
                    case .color7YellowOrange: return ICSRGBA(191, 177, 152)
                    case .color8Orange:       return ICSRGBA(238, 210, 192)
                    case .color9Red:          return ICSRGBA(254, 242, 242)
                }
            }
        }
    }
    
    struct Tokyo: AccessiblePalette {
        
        public let title = "Tokyo"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0PurpleViolet
            case color1PurpleMagenta
            case color2Purple
            case color3Crimson
            case color4Scarlet
            case color5LemonRipening
            case color6GreenSapling
            case color7GreenSapling
            case color8YellowGreen
            case color9Yellow
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0PurpleViolet:  return ICSRGBA( 26,  14,  51)
                    case .color1PurpleMagenta: return ICSRGBA( 68,  31,  76)
                    case .color2Purple:        return ICSRGBA(110,  62, 102)
                    case .color3Crimson:       return ICSRGBA(132,  94, 120)
                    case .color4Scarlet:       return ICSRGBA(140, 121, 129)
                    case .color5LemonRipening: return ICSRGBA(145, 147, 137)
                    case .color6GreenSapling:  return ICSRGBA(151, 174, 144)
                    case .color7GreenSapling:  return ICSRGBA(166, 205, 157)
                    case .color8YellowGreen:   return ICSRGBA(213, 241, 188)
                    case .color9Yellow:        return ICSRGBA(254, 254, 216)
                }
            }
        }
    }
    
    struct Buda: AccessiblePalette {
        
        public let title = "Buda"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
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
            case color3Scarlet
            case color4Red
            case color5RedOrange
            case color6Orange
            case color7YellowOrange
            case color8Yellow
            case color9Yellow
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Magenta:      return ICSRGBA(178,   0, 178)
                    case .color1Crimson:      return ICSRGBA(178,  42, 158)
                    case .color2Crimson:      return ICSRGBA(185,  71, 146)
                    case .color3Scarlet:      return ICSRGBA(193,  96, 137)
                    case .color4Red:          return ICSRGBA(201, 120, 129)
                    case .color5RedOrange:    return ICSRGBA(208, 145, 123)
                    case .color6Orange:       return ICSRGBA(214, 169, 116)
                    case .color7YellowOrange: return ICSRGBA(220, 195, 110)
                    case .color8Yellow:       return ICSRGBA(229, 222, 104)
                    case .color9Yellow:       return ICSRGBA(255, 255, 102)
                }
            }
        }
    }
    
    struct Acton: AccessiblePalette {
        
        public let title = "Acton"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0PurpleViolet
            case color1Purple
            case color2Purple
            case color3Purple
            case color4Scarlet
            case color5Scarlet
            case color6Scarlet
            case color7Crimson
            case color8Magenta
            case color9Violet
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0PurpleViolet: return ICSRGBA( 46,  33,  76)
                    case .color1Purple:       return ICSRGBA( 75,  58, 102)
                    case .color2Purple:       return ICSRGBA(110,  84, 128)
                    case .color3Purple:       return ICSRGBA(146,  99, 144)
                    case .color4Scarlet:      return ICSRGBA(177, 103, 149)
                    case .color5Scarlet:      return ICSRGBA(208, 123, 165)
                    case .color6Scarlet:      return ICSRGBA(212, 148, 183)
                    case .color7Crimson:      return ICSRGBA(212, 172, 200)
                    case .color8Magenta:      return ICSRGBA(219, 200, 220)
                    case .color9Violet:       return ICSRGBA(229, 229, 239)
                }
            }
        }
    }
    
    struct Turku: AccessiblePalette {
        
        public let title = "Turku"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Black
            case color1Yellow
            case color2Yellow
            case color3Yellow
            case color4Yellow
            case color5YellowOrange
            case color6Orange
            case color7RedOrange
            case color8Red
            case color9Red
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Black:        return ICSRGBA(  0,   0,   0)
                    case .color1Yellow:       return ICSRGBA( 35,  35,  32)
                    case .color2Yellow:       return ICSRGBA( 66,  66,  53)
                    case .color3Yellow:       return ICSRGBA( 95,  94,  68)
                    case .color4Yellow:       return ICSRGBA(126, 123,  81)
                    case .color5YellowOrange: return ICSRGBA(168, 152, 101)
                    case .color6Orange:       return ICSRGBA(207, 165, 123)
                    case .color7RedOrange:    return ICSRGBA(234, 173, 152)
                    case .color8Red:          return ICSRGBA(251, 199, 194)
                    case .color9Red:          return ICSRGBA(255, 229, 229)
                }
            }
        }
    }
    
    struct Imola: AccessiblePalette {
        
        public let title = "Imola"
        
        public let description = ICPalettes.FabioCrameri.sharedDescription
        public let tags: [ICPaletteUtilityTag] = [.sequentialData, .quantitative]
        
        public let author = ICPalettes.FabioCrameri.author
        public let license = ICPalettes.FabioCrameri.license
        public let licenseCopy = ICPalettes.FabioCrameri.licenseCopy
        public let link = ICPalettes.FabioCrameri.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0BlueViolet
            case color1BlueViolet
            case color2Blue
            case color3Blue
            case color4BluishCyan
            case color5Turquoise
            case color6Green
            case color7YellowGreen
            case color8LemonRipening
            case color9Yellow
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0BlueViolet:    return ICSRGBA( 25,  51, 178)
                    case .color1BlueViolet:    return ICSRGBA( 36,  70, 168)
                    case .color2Blue:          return ICSRGBA( 45,  89, 159)
                    case .color3Blue:          return ICSRGBA( 57, 106, 147)
                    case .color4BluishCyan:    return ICSRGBA( 72, 123, 133)
                    case .color5Turquoise:     return ICSRGBA( 96, 146, 122)
                    case .color6Green:         return ICSRGBA(122, 173, 116)
                    case .color7YellowGreen:   return ICSRGBA(152, 202, 108)
                    case .color8LemonRipening: return ICSRGBA(196, 233, 102)
                    case .color9Yellow:        return ICSRGBA(255, 254, 102)
                }
            }
        }
    }
    
}
