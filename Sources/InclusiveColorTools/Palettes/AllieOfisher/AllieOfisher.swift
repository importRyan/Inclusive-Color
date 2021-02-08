import Foundation

public extension ICPalettes {
    struct AllieOfisher {
        internal static var author: String = { "Allie Ofisher" }()
        internal static var license: String = { "Awaiting Response" }()
        internal static var licenseCopy: String = { "Unclear, designed while at Cafe Pixo" }()
        internal static var link: URL = { URL(string: "https://medium.com/cafe-pixo/inclusive-color-palettes-for-the-web-bbfe8cf2410e")! }()
    }
}

public extension ICPalettes.AllieOfisher {
    
    struct SixPalette1: AccessiblePalette {
        
        public let title = "Six #1"
        
        public let description = "Six-color palette distinguishable in an artistically appealing manner"
        
        public let tags: [ICPaletteUtilityTag] = [.qualitative]
        
        public let author = ICPalettes.AllieOfisher.author
        public let license = ICPalettes.AllieOfisher.license
        public let licenseCopy = ICPalettes.AllieOfisher.licenseCopy
        public let link = ICPalettes.AllieOfisher.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case navy
            case blue
            case greyPurple
            case red
            case lime
            case yellowGreen
            
            public var srgba: ICSRGBA {
                switch self {
                    case .navy: return ICSRGBA(232, 240, 134)
                    case .blue: return ICSRGBA(111, 222, 110)
                    case .greyPurple: return ICSRGBA(255, 66, 66)
                    case .red: return ICSRGBA(166, 145, 174)
                    case .lime: return ICSRGBA(35, 95, 164)
                    case .yellowGreen: return ICSRGBA(10, 40, 75)
                }
            }
        }
    }
    
    struct SixPalette2: AccessiblePalette {
        
        public let title = "Six #2"
        
        public let description = "Six-color palette distinguishable in an artistically appealing manner"
        
        public let tags: [ICPaletteUtilityTag] = [.qualitative]
        
        public let author = ICPalettes.AllieOfisher.author
        public let license = ICPalettes.AllieOfisher.license
        public let licenseCopy = ICPalettes.AllieOfisher.licenseCopy
        public let link = ICPalettes.AllieOfisher.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case armyGreen
            case grayMedium
            case gold
            case purple
            case red
            case grayDark
            
            public var srgba: ICSRGBA {
                switch self {
                    case .armyGreen: return ICSRGBA(189, 217, 191)
                    case .grayMedium: return ICSRGBA(146, 144, 132)
                    case .gold: return ICSRGBA(255, 200, 87)
                    case .purple: return ICSRGBA(169, 151, 223)
                    case .red: return ICSRGBA(229, 50, 59)
                    case .grayDark: return ICSRGBA(46, 64, 82)
                }
            }
        }
    }
    
    struct SixPalette3: AccessiblePalette {
        
        public let title = "Six #3"
        
        public let description = "Six-color palette distinguishable in an artistically appealing manner"
        
        public let tags: [ICPaletteUtilityTag] = [.qualitative]
        
        public let author = ICPalettes.AllieOfisher.author
        public let license = ICPalettes.AllieOfisher.license
        public let licenseCopy = ICPalettes.AllieOfisher.licenseCopy
        public let link = ICPalettes.AllieOfisher.link
        
        public var id: String { title + author }

        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case yellowPale
            case orange
            case red
            case blue
            case grayMedium
            case grayDark
            
            public var srgba: ICSRGBA {
                switch self {
                    case .yellowPale: return ICSRGBA(225, 218, 174)
                    case .orange: return ICSRGBA(255, 147, 79)
                    case .red: return ICSRGBA(204, 45, 53)
                    case .blue: return ICSRGBA(5, 142, 217)
                    case .grayMedium: return ICSRGBA(132, 143, 162)
                    case .grayDark: return ICSRGBA(45, 49, 66)
                }
            }
        }
    }
}
