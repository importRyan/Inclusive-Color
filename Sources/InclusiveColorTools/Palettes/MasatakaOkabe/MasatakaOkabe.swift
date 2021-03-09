import Foundation

public extension ICPalettes {
    struct MasatakaOkabeKeiIto { }
}

public extension ICPalettes.MasatakaOkabeKeiIto {
    
    struct Vivid: AccessiblePalette {
        
        public let title = "Vivid"
        
        public let description = "The use of this palette is supported by others (Wong, 2011; Levine, 2009) and it is the default scale for the book “Fundamentals of Data Visualization” by Claus Wilke. Republished in Nature Methods by Bang Wong. (doi.org/10.1038/nmeth.1618) Review by Joachim Goedhart at https://thenode.biologists.com/data-visualization-with-flying-colors/research/."
        
        public let author = "Masataka Okabe, Kei Ito"
        public let license = "Awaiting Response"
        public let licenseCopy = "Kohei Musha. Ask for permission"
        public let link = URL(string: "https://jfly.uni-koeln.de/color/")!
        
        public let tags: [ICPaletteUtilityTag] = [.qualitative]
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case black
            case orange
            case blueSky
            case bluishGreen
            case blue
            case yellow
            case vermillion
            case reddishPurple
            
            public var srgba: ICSRGBA {
                switch self {
                    case .black: return ICSRGBA(0)
                    case .orange: return ICSRGBA(230, 159, 0)
                    case .blueSky: return ICSRGBA(86, 180, 233)
                    case .bluishGreen: return ICSRGBA(0, 158, 115)
                    case .blue: return ICSRGBA(0, 114, 178)
                    case .yellow: return ICSRGBA(240, 228, 66)
                    case .vermillion: return ICSRGBA(213, 94, 0)
                    case .reddishPurple: return ICSRGBA(204, 121, 167)
                }
            }
        }
    }
}
