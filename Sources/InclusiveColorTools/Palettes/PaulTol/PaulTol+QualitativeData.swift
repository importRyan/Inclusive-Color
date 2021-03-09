import Foundation

public extension ICPalettes.PaulTol.QualitativeData {
    
    struct Bright: AccessiblePalette {
        
        public let title = "Bright"
        
        public let description = """
Recommended default. Bright qualitative color scheme that is color-blind safe. The main scheme for lines and their labels.
"""
        public let tags: [ICPaletteUtilityTag] = [.qualitative]
        
        public let author = ICPalettes.PaulTol.author
        public let license = ICPalettes.PaulTol.license
        public let licenseCopy = ICPalettes.PaulTol.licenseCopy
        public let link = ICPalettes.PaulTol.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case blue
            case cyan
            case green
            case grey
            case red
            case purple
            case yellow
            
            public var srgba: ICSRGBA {
                switch self {
                    case .blue: return ICSRGBA(69, 119, 170)
                    case .cyan: return ICSRGBA(102, 204, 34)
                    case .green: return ICSRGBA(34, 136, 51)
                    case .grey: return ICSRGBA(187)
                    case .red: return ICSRGBA(238, 102, 119)
                    case .purple: return ICSRGBA(170, 51, 119)
                    case .yellow: return ICSRGBA(204, 187, 68)
                }
            }
        }
    }
    
    struct HighContrast: AccessiblePalette {
        
        public let title = "High Contrast"
        
        public let description = """
Monochrome vision-safe, color-blind safe, optimized for contrast.
"""
        public let tags: [ICPaletteUtilityTag] = [.qualitative]
        
        public let author = ICPalettes.PaulTol.author
        public let license = ICPalettes.PaulTol.license
        public let licenseCopy = ICPalettes.PaulTol.licenseCopy
        public let link = ICPalettes.PaulTol.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case black
            case blue
            case red
            case white
            case yellow
            
            public var srgba: ICSRGBA {
                switch self {
                    case .black: return ICSRGBA(0)
                    case .blue: return ICSRGBA(0, 68, 136)
                    case .red: return ICSRGBA(187, 85, 102)
                    case .yellow: return ICSRGBA(221, 170, 51)
                    case .white: return ICSRGBA(255)
                }
            }
        }
    }
    
    struct Vibrant: AccessiblePalette {
        
        public let title = "Vibrant"
        
        public let description = """
Equally color- blind safe as Bright. It has been designed for data visualization framework TensorBoard, built around their signature orange FF7043. That color has been replaced here to make it print-friendly.
"""
        public let tags: [ICPaletteUtilityTag] = [.qualitative]
        
        public let author = ICPalettes.PaulTol.author
        public let license = ICPalettes.PaulTol.license
        public let licenseCopy = ICPalettes.PaulTol.licenseCopy
        public let link = ICPalettes.PaulTol.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case blue
            case cyan
            case teal
            case orange
            case red
            case magenta
            case grey
            
            public var srgba: ICSRGBA {
                switch self {
                    case .blue: return ICSRGBA(0, 119, 187)
                    case .cyan: return ICSRGBA(51, 187, 238)
                    case .teal: return ICSRGBA(0, 153, 136)
                    case .orange: return ICSRGBA(238, 119, 51)
                    case .red: return ICSRGBA(204, 51, 17)
                    case .magenta: return ICSRGBA(238, 51, 119)
                    case .grey: return ICSRGBA(187)
                }
            }
        }
    }
    
    struct Muted: AccessiblePalette {
        
        public let title = "Muted"
        
        public let description = """
Equally color- blind safe as Vibrant. Has more colors, but lacking a clear red or medium blue. Pale grey is meant for bad data in maps.
"""
        
        public let tags: [ICPaletteUtilityTag] = [.qualitative]
        
        public let author = ICPalettes.PaulTol.author
        public let license = ICPalettes.PaulTol.license
        public let licenseCopy = ICPalettes.PaulTol.licenseCopy
        public let link = ICPalettes.PaulTol.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case indigo
            case cyan
            case teal
            case green
            case olive
            case sand
            case rose
            case wine
            case purple
            case greyPale
            
            public var srgba: ICSRGBA {
                switch self {
                    case .indigo: return ICSRGBA(51, 34, 136)
                    case .cyan:  return ICSRGBA(136, 204, 238)
                    case .teal: return ICSRGBA(68, 170, 153)
                    case .green: return ICSRGBA(17, 119, 51)
                    case .olive: return ICSRGBA(153, 153, 51)
                    case .sand: return ICSRGBA(221, 204, 119)
                    case .rose: return ICSRGBA(204, 102, 119)
                    case .wine: return ICSRGBA(136, 34, 85)
                    case .purple: return ICSRGBA(170, 68, 153)
                    case .greyPale: return ICSRGBA(221)
                }
            }
        }
    }
    
    struct PaleTextBackground: AccessiblePalette {
        
        public let title = "Pale Text Backgrounds"
        
        public let description = """
Background for black text. Indistinct in either normal or color-blind vision. Meant for marking text such as cells in a table, not lines or maps.
"""
        
        public let tags: [ICPaletteUtilityTag] = [.qualitative]
        
        public let author = ICPalettes.PaulTol.author
        public let license = ICPalettes.PaulTol.license
        public let licenseCopy = ICPalettes.PaulTol.licenseCopy
        public let link = ICPalettes.PaulTol.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case blue
            case cyan
            case green
            case yellow
            case red
            case grey
            
            public var srgba: ICSRGBA {
                switch self {
                    case .blue: return ICSRGBA(187, 204, 238)
                    case .cyan: return ICSRGBA(204, 238, 255)
                    case .green: return ICSRGBA(204, 221, 170)
                    case .yellow: return ICSRGBA(238, 238, 187)
                    case .red: return ICSRGBA(255, 204, 204)
                    case .grey: return ICSRGBA(221)
                }
            }
        }
    }
    
    struct DarkText: AccessiblePalette {
        
        public let title = "Dark Text"
        
        public let description = """
For text on a white background. Indistinct in either normal or color-blind vision. Meant for marking large blocks of text, not lines or maps.
"""
        
        public let tags: [ICPaletteUtilityTag] = [.qualitative]
        
        public let author = ICPalettes.PaulTol.author
        public let license = ICPalettes.PaulTol.license
        public let licenseCopy = ICPalettes.PaulTol.licenseCopy
        public let link = ICPalettes.PaulTol.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case blue
            case cyan
            case green
            case yellow
            case red
            case grey
            
            public var srgba: ICSRGBA {
                switch self {
                    case .blue: return ICSRGBA(34, 34, 85)
                    case .cyan: return ICSRGBA(34, 85, 85)
                    case .green: return ICSRGBA(34, 85, 34)
                    case .yellow: return ICSRGBA(102, 102, 51)
                    case .red: return ICSRGBA(102, 51, 51)
                    case .grey: return ICSRGBA(85)
                }
            }
        }
    }
    
    struct Light: AccessiblePalette {
        
        public let title = "Light"
        
        public let description = """
Fill labelled cells with lighter colors than contained in Bright, and with more clearly readable labels for black text than Pale. Reasonably distinct in both normal and color-blind vision.
"""
        
        public let tags: [ICPaletteUtilityTag] = [.qualitative]
        
        public let author = ICPalettes.PaulTol.author
        public let license = ICPalettes.PaulTol.license
        public let licenseCopy = ICPalettes.PaulTol.licenseCopy
        public let link = ICPalettes.PaulTol.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case blue
            case cyan
            case mint
            case pear
            case olive
            case yellow
            case orange
            case pink
            case grey
            
            public var srgba: ICSRGBA {
                switch self {
                    case .blue: return ICSRGBA(119, 170, 221)
                    case .cyan: return ICSRGBA(153, 221, 255)
                    case .mint: return ICSRGBA(68, 187, 153)
                    case .pear: return ICSRGBA(187, 204, 51)
                    case .olive: return ICSRGBA(170, 170, 0)
                    case .yellow: return ICSRGBA(238, 221, 136)
                    case .orange: return ICSRGBA(238, 136, 102)
                    case .pink: return ICSRGBA(255, 170, 187)
                    case .grey: return ICSRGBA(221)
                }
            }
        }
    }
}
