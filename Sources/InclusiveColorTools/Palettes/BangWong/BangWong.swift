import Foundation

public extension ICPalettes {
    struct BangWong { }
}

public extension ICPalettes.BangWong {
    
    struct WongNatureMethods: AccessiblePalette {
        
        public let title = "Wong Nature Methods"
        
        public let description = "Differing shades for similar perception and differentiation by protan/deutan red-green color blind individuals"
        
        public let author = "Bang Wong"
        
        public let license = "Copyright Nature Publishing Group. All Rights Reserved."
        public let licenseCopy = "Copyright Nature Publishing Group. All Rights Reserved."
        
        public let link = URL(string: "https://doi.org/10.1038/nmeth.1618")!
        
        public let tags: [ICPaletteUtilityTag] = [.qualitative]
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        /// Potential challenge for tritanopes (https://twitter.com/neivet2/status/492829617188007937)
        public enum SourceColors: ICSourceColorSet {
            case black
            case blue
            case blueSky
            case bluishGreen
            case reddishPurple
            case orange
            case yellow
            case vermillion
            
            public var srgba: ICSRGBA {
                switch self {
                    case .black: return ICSRGBA(0, 0, 0)
                    case .blue: return ICSRGBA(0, 114, 178)
                    case .blueSky: return ICSRGBA(86, 180, 233)
                    case .bluishGreen: return ICSRGBA(0, 158, 115)
                    case .orange: return ICSRGBA(230, 159, 0)
                    case .reddishPurple: return ICSRGBA(204, 121, 167)
                    case .yellow: return ICSRGBA(240, 228, 66)
                    case .vermillion: return ICSRGBA(213, 94, 0)
                }
            }
        }
        
    }
}
