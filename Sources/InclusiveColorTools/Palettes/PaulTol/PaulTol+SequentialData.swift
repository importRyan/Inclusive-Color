import Foundation

public extension ICPalettes.PaulTol.SequentialData {
    
    /// See Figure 20 for a curated selection [for maps from 1 to 23 colors](https://personal.sron.nl/~pault/data/colourschemes.pdf).
    ///
    struct DiscreteRainbow_UseMakeRainbowFunc: AccessiblePalette {
        
        public let title = "Discrete Rainbow"
        
        public let description = """
Maximum 23 colors for maps, inspired by the temperature map in the de Volkskrant newspaper. Grey for data gaps. Do not interpolate yourself. Paul's pre-interpolated rainbows for maximum contrast are available by the makeRainbowMax23 function in its enum.
"""
        
        public let tags: [ICPaletteUtilityTag] = [.quantitative,
                                                   .sequentialData]
        
        public let author = ICPalettes.PaulTol.author
        public let license = ICPalettes.PaulTol.license
        public let licenseCopy = ICPalettes.PaulTol.licenseCopy
        public let link = ICPalettes.PaulTol.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public static var recommendedRainbow14: [ICSRGBA] {
            SourceColors.makeRainbowMax23(colors: 14)
        }
        public static var recommendedRainbow23: [ICSRGBA] {
            SourceColors.makeRainbowMax23(colors: 23)
        }
        
        public static func makeRainbowMax23(colors: Int) -> [ICSRGBA] {
            SourceColors.makeRainbowMax23(colors: colors)
        }
        
        public func makeRainbowMax23(colors: Int) -> [ICSRGBA] {
            SourceColors.makeRainbowMax23(colors: colors)
        }
        
        public enum SourceColors: ICSourceColorSet {
            case n1OffWhite
            case n2
            case n3
            case n4
            case n5
            case n6
            case n7
            case n8
            case n9Purple
            case n10Blue
            case n11
            case n12
            case n13
            case n14
            case n15Green
            case n16
            case n17
            case n18Yellow
            case n19
            case n20
            case n21
            case n22
            case n23
            case n24
            case n25Orange
            case n26Red
            case n27
            case n28
            case n29Brown
            case badDataGrey
            
            /// Rainbow sans .badDataGrey
            public static func makeRainbowMax23(colors: Int) -> [ICSRGBA] {
                var selection: [SourceColors]
                
                switch colors {
                    case 1: selection = [.n10Blue]
                    case 2: selection = [.n10Blue, .n26Red]
                    case 3: selection = [.n10Blue, .n18Yellow, .n26Red]
                    case 4: selection = [.n10Blue, .n15Green, .n18Yellow, .n26Red]
                    case 5: selection = [.n10Blue, .n14, .n15Green, .n18Yellow, .n26Red]
                    case 6: selection = [.n10Blue, .n14, .n15Green, .n17, .n18Yellow, .n26Red]
                    case 7: selection = [.n9Purple, .n10Blue, .n14, .n15Green, .n17, .n18Yellow, .n26Red]
                    case 8: selection = [.n9Purple, .n10Blue, .n14, .n15Green, .n17, .n18Yellow, .n23, .n26Red]
                    case 9: selection = [.n9Purple, .n10Blue, .n14, .n15Green, .n17, .n18Yellow, .n23, .n26Red, .n28]
                    case 10: selection = [.n9Purple, .n10Blue, .n14, .n15Green, .n17, .n18Yellow, .n21, .n24, .n26Red, .n28]
                    case 11: selection = [.n9Purple, .n10Blue, .n12, .n14, .n15Green, .n17, .n18Yellow, .n21, .n24, .n26Red, .n28]
                    case 12: selection = [.n3, .n6, .n9Purple, .n10Blue, .n12, .n14, .n15Green, .n17, .n18Yellow, .n21, .n24, .n26Red]
                    case 13: selection = [.n3, .n6, .n9Purple, .n10Blue, .n12, .n14, .n15Green, .n16, .n17, .n18Yellow, .n21, .n24, .n26Red]
                    case 14: selection = [.n3, .n6, .n9Purple, .n10Blue, .n12, .n14, .n15Green, .n16, .n17, .n18Yellow, .n20, .n22, .n24, .n26Red]
                    case 15: selection =  [.n3, .n6, .n9Purple, .n10Blue, .n12, .n14, .n15Green, .n16, .n17, .n18Yellow, .n20, .n22, .n24, .n26Red, .n28]
                    case 16: selection = [.n3, .n5, .n7, .n9Purple, .n10Blue, .n12, .n14, .n15Green, .n16, .n17, .n18Yellow, .n20, .n22, .n24, .n26Red, .n28]
                    case 17: selection = [.n3, .n5, .n7, .n8, .n9Purple, .n10Blue, .n12, .n14, .n15Green, .n16, .n17, .n18Yellow, .n20, .n22, .n24, .n26Red, .n28]
                    case 18: selection = [.n3, .n5, .n7, .n8, .n9Purple, .n10Blue, .n12, .n14, .n15Green, .n16, .n17, .n18Yellow, .n20, .n22, .n24, .n26Red, .n27, .n28]
                    case 19: selection = [.n2, .n4, .n5, .n7, .n8, .n9Purple, .n10Blue, .n12, .n14, .n15Green, .n16, .n17, .n18Yellow, .n20, .n22, .n24, .n26Red, .n27, .n28]
                    case 20: selection = [.n2, .n4, .n5, .n7, .n8, .n9Purple, .n10Blue, .n11, .n13, .n14, .n15Green, .n16, .n17, .n18Yellow, .n20, .n22, .n24, .n26Red, .n27, .n28]
                    case 21: selection = [.n2, .n4, .n5, .n7, .n8, .n9Purple, .n10Blue, .n11, .n13, .n14, .n15Green, .n16, .n17, .n18Yellow, .n19, .n21, .n23, .n25Orange, .n26Red, .n27, .n28]
                        
                    case 22: selection = [.n2, .n4, .n5, .n7, .n8, .n9Purple, .n10Blue, .n11, .n13, .n14, .n15Green, .n16, .n17, .n18Yellow, .n19, .n21, .n23, .n25Orange, .n26Red, .n27, .n28, .n28]
                    case 23: selection = [.n1OffWhite, .n2, .n4, .n5, .n7, .n8, .n9Purple, .n10Blue, .n11, .n13, .n14, .n15Green, .n16, .n17, .n18Yellow, .n19, .n21, .n23, .n25Orange, .n26Red, .n27, .n28, .n28]
                        
                    default: selection = []
                }
                
                return selection.map { $0.srgba }
            }
            
            public var srgba: ICSRGBA {
                switch self {
                    case .n1OffWhite: return ICSRGBA(232,236,251)
                    case .n2: return ICSRGBA(217, 204, 227)
                    case .n3: return ICSRGBA(209, 187, 215)
                    case .n4: return ICSRGBA(202, 172, 203)
                    case .n5: return ICSRGBA(186, 141, 180)
                    case .n6: return ICSRGBA(174, 118, 163)
                    case .n7: return ICSRGBA(170, 111, 158)
                    case .n8: return ICSRGBA(153, 79, 136)
                    case .n9Purple: return ICSRGBA(136, 46, 114)
                    case .n10Blue: return ICSRGBA(25, 101, 176)
                    case .n11: return ICSRGBA(67, 125, 191)
                    case .n12: return ICSRGBA(82, 137, 199)
                    case .n13: return ICSRGBA(97, 149, 207)
                    case .n14: return ICSRGBA(123, 175, 222)
                    case .n15Green: return ICSRGBA(78, 178, 101)
                    case .n16: return ICSRGBA(144, 201, 135)
                    case .n17: return ICSRGBA(202, 224, 171)
                    case .n18Yellow: return ICSRGBA(247, 240, 86)
                    case .n19: return ICSRGBA(247, 203, 69)
                    case .n20: return ICSRGBA(246, 193, 65)
                    case .n21: return ICSRGBA(244, 167, 54)
                    case .n22: return ICSRGBA(241, 147, 45)
                    case .n23: return ICSRGBA(238, 128, 38)
                    case .n24: return ICSRGBA(232, 96, 28)
                    case .n25Orange: return ICSRGBA(230, 85, 24)
                    case .n26Red: return ICSRGBA(220, 5, 12)
                    case .n27: return ICSRGBA(165, 23, 14)
                    case .n28: return ICSRGBA(114, 25, 14)
                    case .n29Brown: return ICSRGBA(66,21,10)
                    case .badDataGrey: return ICSRGBA(119)
                }
            }
        }
    }
    
    struct SmoothLinearInterpolationRainbow: AccessiblePalette {
        
        public let title = "Smooth Rainbow"
        
        public let description = """
Grey for data gaps. If lowest data value occurs often, start at off-white. Otherwise, start at purple and use off-white for bad data. If the highest value occurs often, end at red instead of brown. Light purples and light blues should not be mixed much for color blind people. Can be linearly interpolated, but is best to use a subset of colors.
"""
        public let tags: [ICPaletteUtilityTag] = [.quantitative,
                                                   .sequentialData]
        
        public let author = ICPalettes.PaulTol.author
        public let license = ICPalettes.PaulTol.license
        public let licenseCopy = ICPalettes.PaulTol.licenseCopy
        public let link = ICPalettes.PaulTol.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case offWhiteBadDataOrFrequentyLowExtreme
            case nMin1
            case nMin2
            case nMin3
            case nMin4
            case nMin5
            case nMin6
            case nMin7
            case nMin8PurpleStart
            case nMid0
            case nMid1
            case nMid2
            case nMid3
            case nMid4
            case nMid5
            case nMid6
            case nMid7
            case nMid8
            case nMid9
            case nMid10
            case nMid11
            case nMid12
            case nMid13
            case nMid14
            case nMid15
            case nMid16
            case nMid17
            case nMid18
            case nMid19
            case nMax0Red
            case nMax1
            case nMax2
            case nMax3
            case nMax4Brown
            case badDataGrey
            
            public var srgba: ICSRGBA {
                switch self {
                    case .offWhiteBadDataOrFrequentyLowExtreme: return ICSRGBA(232, 236, 251)
                    case .nMin1: return ICSRGBA(221, 216, 239)
                    case .nMin2: return ICSRGBA(209, 193, 225)
                    case .nMin3: return ICSRGBA(195, 168, 209)
                    case .nMin4: return ICSRGBA(181, 143, 194)
                    case .nMin5: return ICSRGBA(167, 120, 180)
                    case .nMin6: return ICSRGBA(155, 98, 167)
                    case .nMin7: return ICSRGBA(140, 78, 153)
                    case .nMin8PurpleStart: return ICSRGBA(111, 76, 155)
                    case .nMid0: return ICSRGBA(96, 89, 169)
                    case .nMid1: return ICSRGBA(85, 104, 184)
                    case .nMid2: return ICSRGBA(78, 121, 197)
                    case .nMid3: return ICSRGBA(77, 138, 198)
                    case .nMid4: return ICSRGBA(78, 150, 188)
                    case .nMid5: return ICSRGBA(84, 158, 179)
                    case .nMid6: return ICSRGBA(89, 165, 169)
                    case .nMid7: return ICSRGBA(96, 171, 158)
                    case .nMid8: return ICSRGBA(105, 177, 144)
                    case .nMid9: return ICSRGBA(119, 183, 125)
                    case .nMid10: return ICSRGBA(140, 188, 104)
                    case .nMid11: return ICSRGBA(166, 190, 84)
                    case .nMid12: return ICSRGBA(190, 188, 72)
                    case .nMid13: return ICSRGBA(209, 181, 65)
                    case .nMid14: return ICSRGBA(221, 170, 60)
                    case .nMid15: return ICSRGBA(228, 156, 57)
                    case .nMid16: return ICSRGBA(231, 140, 53)
                    case .nMid17: return ICSRGBA(230, 121, 50)
                    case .nMid18: return ICSRGBA(228, 99, 45)
                    case .nMid19: return ICSRGBA(223, 72, 40)
                    case .nMax0Red: return ICSRGBA(218, 34, 34)
                    case .nMax1: return ICSRGBA(184, 34, 30)
                    case .nMax2: return ICSRGBA(149, 33, 27)
                    case .nMax3: return ICSRGBA(114, 30, 23)
                    case .nMax4Brown: return ICSRGBA(82, 26, 19)
                    case .badDataGrey: return ICSRGBA(102)
                }
            }
        }
    }
    
    struct Iridescent: AccessiblePalette {
        
        public let title = "Iridescent"
        
        public let description = """
Grey for data gaps. Good for monochrome vision. Colors can be linearly interpolated or pushed to white or black.
"""
        public let tags: [ICPaletteUtilityTag] = [.quantitative,
                                                   .sequentialData]
        
        public let author = ICPalettes.PaulTol.author
        public let license = ICPalettes.PaulTol.license
        public let licenseCopy = ICPalettes.PaulTol.licenseCopy
        public let link = ICPalettes.PaulTol.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Min
            case color1
            case color2
            case color3
            case color4
            case color5
            case color6
            case color7
            case color8
            case color9
            case color10
            case color11
            case color12
            case color13
            case color14
            case color15
            case color16
            case color17
            case color18
            case color19
            case color20
            case color21
            case color22Max
            case badDataGrey
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Min: return ICSRGBA(254, 251, 233)
                    case .color1: return ICSRGBA(252, 247, 213)
                    case .color2: return ICSRGBA(245, 243, 193)
                    case .color3: return ICSRGBA(234, 240, 181)
                    case .color4: return ICSRGBA(221, 236, 191)
                    case .color5: return ICSRGBA(208, 231, 202)
                    case .color6: return ICSRGBA(194, 227, 210)
                    case .color7: return ICSRGBA(181, 221, 216)
                    case .color8: return ICSRGBA(168, 216, 220)
                    case .color9: return ICSRGBA(155, 210, 225)
                    case .color10: return ICSRGBA(141, 203, 228)
                    case .color11: return ICSRGBA(129, 196, 231)
                    case .color12: return ICSRGBA(123, 188, 231)
                    case .color13: return ICSRGBA(126, 178, 228)
                    case .color14: return ICSRGBA(136, 165, 221)
                    case .color15: return ICSRGBA(147, 152, 210)
                    case .color16: return ICSRGBA(155, 138, 196)
                    case .color17: return ICSRGBA(157, 125, 178)
                    case .color18: return ICSRGBA(154, 112, 158)
                    case .color19: return ICSRGBA(144, 99, 136)
                    case .color20: return ICSRGBA(128, 87, 112)
                    case .color21: return ICSRGBA(104, 73, 87)
                    case .color22Max: return ICSRGBA(70, 53, 58)
                    case .badDataGrey: return ICSRGBA(153)
                }
            }
        }
    }
    
    struct YellowOrBrown: AccessiblePalette {
        
        public let title = "Yellow Or Brown"
        
        public let description = """
Grey for data gaps. Print-friendly. color0Min can be set to white for density histograms.
"""
        
        public let tags: [ICPaletteUtilityTag] = [.quantitative,
                                                   .sequentialData]
        
        public let author = ICPalettes.PaulTol.author
        public let license = ICPalettes.PaulTol.license
        public let licenseCopy = ICPalettes.PaulTol.licenseCopy
        public let link = ICPalettes.PaulTol.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Min
            case color1
            case color2
            case color3
            case color4
            case color5
            case color6
            case color7
            case color8Max
            case badDataGrey
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Min: return ICSRGBA(255, 255, 229)
                    case .color1: return ICSRGBA(255, 247, 188)
                    case .color2: return ICSRGBA(254, 227, 145)
                    case .color3: return ICSRGBA(254, 196, 79)
                    case .color4: return ICSRGBA(251, 154, 41)
                    case .color5: return ICSRGBA(236, 112, 20)
                    case .color6: return ICSRGBA(204, 76, 2)
                    case .color7: return ICSRGBA(153, 52, 4)
                    case .color8Max: return ICSRGBA(102, 37, 6)
                    case .badDataGrey: return ICSRGBA(136)
                }
            }
        }
    }
}
