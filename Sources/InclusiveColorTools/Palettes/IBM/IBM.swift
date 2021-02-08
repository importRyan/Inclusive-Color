import Foundation

public extension ICPalettes {
    struct IBM { }
}

public extension ICPalettes.IBM {
    
    struct DataVisStarter: AccessiblePalette {
        
        public let title = "Data Vis Starter"
        
        public let description = "IBM Design Language Color Library"
        
        public let author = "IBM"
        public let license = "CC-BY-4.0"
        public var licenseCopy = {
            """
Copyright IBM Corporation 2017. IBM Design Colors by International Business Machines Corporation is licensed under a Creative Commons Attribution 4.0 International License.
            Based on a work at https://github.com/IBM-Design/colors.
""" + LicensesForAccessiblePalettes.ccby4
        }()
        public let link =  URL(string: "https://web.archive.org/web/20180808011442/https://www.ibm.com/design/language/resources/color-library/")!
        
        public let tags: [ICPaletteUtilityTag] = [.qualitative]
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case ultramarina40
            case indigo50
            case magenta50
            case orange40
            case gold20
            
            public var srgba: ICSRGBA {
                switch self {
                    case .ultramarina40: return ICSRGBA(100, 143, 255)
                    case .indigo50: return ICSRGBA(120, 94, 240)
                    case .magenta50: return ICSRGBA(220, 38, 127)
                    case .orange40: return ICSRGBA(254, 97, 0)
                    case .gold20: return ICSRGBA(255, 176, 0)
                }
            }
        }
    }
}
