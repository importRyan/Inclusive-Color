import Foundation

public extension ICPalettes {
    
    /// Jamie Nuñez, Christpher Anderton, and Ryan Renslow developed cividis as a refinement of the matplotlib viridis scheme for uniform CVD perception.
    ///
    /// [PLOS ONE 2018](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0199239)
    ///
    struct JamieNunezEtAl {
        
        public struct Sequential {}
        
        internal static var author: String = { "Jamie Nuñez, Christpher Anderton, Ryan Renslow" }()
        internal static var link: URL = { URL(string: "https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0199239")! }()
        internal static var license: String = { "Free with citation from Battelle Memorial Institute" }()
        internal static var licenseCopy: String = {
            """
Copyright (c) 2017, Battelle Memorial Institute

1.  Battelle Memorial Institute (hereinafter Battelle) hereby grants
permission to any person or entity lawfully obtaining a copy of this software
and associated documentation files (hereinafter “the Software”) to
redistribute and use the Software in source and binary forms, with or without
modification. Such person or entity may use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and may permit
others to do so, subject to the following conditions:

+ Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimers.

+ Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

+ Other than as used herein, neither the name Battelle Memorial Institute or
Battelle may be used in any form whatsoever without the express written
consent of Battelle.

2.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL BATTELLE OR CONTRIBUTORS BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"""
        }()
        internal static var cividisDescription: String = { "Cividis refines the matplotlib viridis scheme for uniform CVD perception. See the R library cmaputil or colorspacious for finer interpolations." }()
    }
}

extension ICPalettes.JamieNunezEtAl.Sequential {
    
    struct Cividis5Step: AccessiblePalette {
        
        public let title = "Cividis 5-Step"
        
        public let description = ICPalettes.JamieNunezEtAl.cividisDescription
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .sequentialData]
        
        public let author = ICPalettes.JamieNunezEtAl.author
        public let license = ICPalettes.JamieNunezEtAl.license
        public let licenseCopy = ICPalettes.JamieNunezEtAl.licenseCopy
        public let link = ICPalettes.JamieNunezEtAl.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Blue
            case color1BlueViolet
            case color2YellowOrange
            case color3YellowOrange
            case color4YellowOrange
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Blue:         return ICSRGBA(  0,  32,  76)
                    case .color1BlueViolet:   return ICSRGBA( 64,  76, 107)
                    case .color2YellowOrange: return ICSRGBA(123, 122, 119)
                    case .color3YellowOrange: return ICSRGBA(186, 172, 111)
                    case .color4YellowOrange: return ICSRGBA(255, 230,  66)
                }
            }
        }
    }
    
    struct Cividis6Step: AccessiblePalette {
        
        public let title = "Cividis 6-Step"
        
        public let description = ICPalettes.JamieNunezEtAl.cividisDescription
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .sequentialData]
        
        public let author = ICPalettes.JamieNunezEtAl.author
        public let license = ICPalettes.JamieNunezEtAl.license
        public let licenseCopy = ICPalettes.JamieNunezEtAl.licenseCopy
        public let link = ICPalettes.JamieNunezEtAl.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Blue
            case color1BlueViolet
            case color2BlueViolet
            case color3YellowOrange
            case color4YellowOrange
            case color5YellowOrange
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Blue:         return ICSRGBA(  0,  32,  78)
                    case .color1BlueViolet:   return ICSRGBA( 49,  68, 107)
                    case .color2BlueViolet:   return ICSRGBA(101, 103, 111)
                    case .color3YellowOrange: return ICSRGBA(147, 141, 120)
                    case .color4YellowOrange: return ICSRGBA(199, 183, 106)
                    case .color5YellowOrange: return ICSRGBA(255, 229,  66)
                }
            }
        }
    }
    
    struct Cividis10Step: AccessiblePalette {
        
        public let title = "Cividis 10-Step"
        
        public let description = ICPalettes.JamieNunezEtAl.cividisDescription
        public let tags: [ICPaletteUtilityTag] = [.quantitative, .sequentialData]
        
        public let author = ICPalettes.JamieNunezEtAl.author
        public let license = ICPalettes.JamieNunezEtAl.license
        public let licenseCopy = ICPalettes.JamieNunezEtAl.licenseCopy
        public let link = ICPalettes.JamieNunezEtAl.link
        
        public var id: String { title + author }
        public var srgba: [ICSRGBA] { SourceColors.allCases.map { $0.srgba} }
        public init() {}
        
        public enum SourceColors: ICSourceColorSet {
            case color0Blue
            case color1Blue
            case color2BlueViolet
            case color3BlueViolet
            case color4Gray
            case color5YellowOrange
            case color6YellowOrange
            case color7YellowOrange
            case color8YellowOrange
            case color9YellowOrange
            
            public var srgba: ICSRGBA {
                switch self {
                    case .color0Blue:         return ICSRGBA(  0,  32,  76)
                    case .color1Blue:         return ICSRGBA(  0,  51, 110)
                    case .color2BlueViolet:   return ICSRGBA( 55,  71, 107)
                    case .color3BlueViolet:   return ICSRGBA( 85,  91, 108)
                    case .color4Gray:         return ICSRGBA(111, 111, 114)
                    case .color5YellowOrange: return ICSRGBA(136, 133, 120)
                    case .color6YellowOrange: return ICSRGBA(164, 155, 117)
                    case .color7YellowOrange: return ICSRGBA(193, 178, 108)
                    case .color8YellowOrange: return ICSRGBA(224, 203,  93)
                    case .color9YellowOrange: return ICSRGBA(255, 230,  66)
                }
            }
        }
    }
    
    
}
