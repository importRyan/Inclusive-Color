import Foundation

/// These published color blindness-friendly palettes are free, with licenses for inclusion in your app. A visual browser is available on the Mac App Store as "Inclusive Color".
///
public struct ICPalettes {
    
    /// These published color blindness-friendly palettes are free, with licenses for inclusion in your app. A visual browser is available on the Mac App Store as "Inclusive Color".
    ///
    public enum AllPalettes: CaseIterable, Identifiable {
        case AllieOfisher_SixPalette1
        case AllieOfisher_SixPalette2
        case AllieOfisher_SixPalette3
        case BangWong
        case BrewerHarrower_Diverging_BrownGreen
        case BrewerHarrower_Diverging_PinkYellowGreen
        case BrewerHarrower_Diverging_PurpleGreen
        case BrewerHarrower_Diverging_PurpleOrange
        case BrewerHarrower_Diverging_RedBlue
        case BrewerHarrower_Sequential_Reds
        case BrewerHarrower_Sequential_Blues
        case BrewerHarrower_Sequential_Greens
        case BrewerHarrower_Sequential_Grays
        case BrewerHarrower_Sequential_Oranges
        case BrewerHarrower_Sequential_Purples
        case BrewerHarrower_Sequential_BluePurple
        case BrewerHarrower_Sequential_OrangeRed
        case BrewerHarrower_Sequential_PurpleBlue
        case BrewerHarrower_Sequential_RedPurple
        case BrewerHarrower_Sequential_YellowGreenBlue
        case BrewerHarrower_Sequential_YellowOrangeBrown
        case BrewerHarrower_Sequential_YellowOrangeRed
        case FabioCrameri_Cyclic_RomaO
        case FabioCrameri_Cyclic_BamO
        case FabioCrameri_Cyclic_BrocO
        case FabioCrameri_Cyclic_CorkO
        case FabioCrameri_Cyclic_VikO
        case FabioCrameri_Diverging_Broc
        case FabioCrameri_Diverging_Cork
        case FabioCrameri_Diverging_Vik
        case FabioCrameri_Diverging_Lisbon
        case FabioCrameri_Diverging_Tofino
        case FabioCrameri_Diverging_Berlin
        case FabioCrameri_Diverging_Roma
        case FabioCrameri_Diverging_Bam
        case FabioCrameri_Diverging_Vanimo
        case FabioCrameri_Multisequential_Oleron
        case FabioCrameri_Multisequential_Bukavu
        case FabioCrameri_Multisequential_Fes
        case FabioCrameri_Sequential_Batlow
        case FabioCrameri_Sequential_BatlowW
        case FabioCrameri_Sequential_BatlowK
        case FabioCrameri_Sequential_Devon
        case FabioCrameri_Sequential_LaJolla
        case FabioCrameri_Sequential_Bamako
        case FabioCrameri_Sequential_Davos
        case FabioCrameri_Sequential_Bilbao
        case FabioCrameri_Sequential_Nuuk
        case FabioCrameri_Sequential_Oslo
        case FabioCrameri_Sequential_GrayC
        case FabioCrameri_Sequential_Hawaii
        case FabioCrameri_Sequential_Lapaz
        case FabioCrameri_Sequential_Tokyo
        case FabioCrameri_Sequential_Buda
        case FabioCrameri_Sequential_Acton
        case FabioCrameri_Sequential_Turku
        case FabioCrameri_Sequential_Imola
        case IBMDataVisStarter
        case JamieNunez_Cividis5
        case JamieNunez_Cividis6
        case JamieNunez_Cividis10
        case MasatakaOkabeKeiIto_Qualitative
        case PaulTol_Diverging_Sunset
        case PaulTol_Diverging_BuRd
        case PaulTol_Diverging_PRGn
        case PaulTol_Qualitative_Bright
        case PaulTol_Qualitative_HighContrast
        case PaulTol_Qualitative_Vibrant
        case PaulTol_Qualitative_Muted
        case PaulTol_Qualitative_PaleTextBackground
        case PaulTol_Qualitative_DarkText
        case PaulTol_Qualitative_Light
        case PaulTol_Sequential_DiscreteRainbow14
        case PaulTol_Sequential_DiscreteRainbow23
        case PaulTol_Sequential_SmoothRainbow34
        case PaulTol_Sequential_Iridescent23
        case PaulTol_Sequential_YellowOrBrown9
        
        public var title: String { reference.title }
        public var description: String { reference.description }
        public var tags: [ICPaletteUtilityTag] { reference.tags }
        public var author: String { reference.author }
        public var license: String { reference.license }
        public var licenseCopy: String { reference.licenseCopy }
        public var link: URL { reference.link }
        
        /// Some color sets, such as Paul Tol's Discrete Rainbow, have a higher source color count than the maximum number of differentiable colors. Those color sets have functions to generate usable subsets of the palette.
        ///
        public var colorCount: Int { reference.colorCount }
        
        /// Formed by String(title + author + colorCount)
        ///
        public var id: String {
            switch self {
                case .PaulTol_Sequential_DiscreteRainbow14:
                    return reference.id + "14"
                    
                case .PaulTol_Sequential_DiscreteRainbow23:
                    return reference.id + "23"
                    
                default: return reference.id + String(reference.colorCount)
            }
        }
        
        /// Color set expressed as a framework-internal sRGBA object. Versions for UIKit, AppKit, and SwiftUI are also provided.
        ///
        public var colors_SRGBA: [ICSRGBA] {
            switch self {
                
                case .PaulTol_Sequential_DiscreteRainbow14:
                    return ICPalettes.PaulTol.SequentialData.DiscreteRainbow_UseMakeRainbowFunc.recommendedRainbow14
                    
                case .PaulTol_Sequential_DiscreteRainbow23:
                    return ICPalettes.PaulTol.SequentialData.DiscreteRainbow_UseMakeRainbowFunc.recommendedRainbow23
                    
                default: return reference.srgba
            }
        }
        
        private var reference: AccessiblePalette {
            switch self {
                case .AllieOfisher_SixPalette1:
                    return ICPalettes.AllieOfisher.SixPalette1()
                
                case .AllieOfisher_SixPalette2:
                    return ICPalettes.AllieOfisher.SixPalette2()
                
                case .AllieOfisher_SixPalette3:
                    return ICPalettes.AllieOfisher.SixPalette3()
                
                case .BangWong:
                    return ICPalettes.BangWong.WongNatureMethods()
                
                case .IBMDataVisStarter:
                    return ICPalettes.IBM.DataVisStarter()
                
                case .MasatakaOkabeKeiIto_Qualitative:
                    return ICPalettes.MasatakaOkabeKeiIto.Vivid()
                
                case .PaulTol_Diverging_Sunset:
                    return ICPalettes.PaulTol.DivergingData.Sunset()
                
                case .PaulTol_Diverging_BuRd:
                    return ICPalettes.PaulTol.DivergingData.BuRd()
                
                case .PaulTol_Diverging_PRGn:
                    return ICPalettes.PaulTol.DivergingData.PRGn()
                
                case .PaulTol_Qualitative_Bright:
                    return ICPalettes.PaulTol.QualitativeData.Bright()
                
                case .PaulTol_Qualitative_HighContrast:
                    return ICPalettes.PaulTol.QualitativeData.HighContrast()
                
                case .PaulTol_Qualitative_Vibrant:
                    return ICPalettes.PaulTol.QualitativeData.Vibrant()
                
                case .PaulTol_Qualitative_Muted:
                    return ICPalettes.PaulTol.QualitativeData.Muted()
                
                case .PaulTol_Qualitative_PaleTextBackground:
                    return ICPalettes.PaulTol.QualitativeData.PaleTextBackground()
                
                case .PaulTol_Qualitative_DarkText:
                    return ICPalettes.PaulTol.QualitativeData.DarkText()
                
                case .PaulTol_Qualitative_Light:
                    return ICPalettes.PaulTol.QualitativeData.Light()
                
                case .PaulTol_Sequential_DiscreteRainbow14:
                    return ICPalettes.PaulTol.SequentialData.DiscreteRainbow_UseMakeRainbowFunc()
                
                case .PaulTol_Sequential_DiscreteRainbow23:
                    return ICPalettes.PaulTol.SequentialData.DiscreteRainbow_UseMakeRainbowFunc()
                
                case .PaulTol_Sequential_SmoothRainbow34:
                    return ICPalettes.PaulTol.SequentialData.SmoothLinearInterpolationRainbow()
                
                case .PaulTol_Sequential_Iridescent23:
                    return ICPalettes.PaulTol.SequentialData.Iridescent()
                
                case .PaulTol_Sequential_YellowOrBrown9:
                    return ICPalettes.PaulTol.SequentialData.YellowOrBrown()
                    
                case .BrewerHarrower_Diverging_BrownGreen: return ICPalettes.BrewerHarrower.Diverging.BrownGreen()
                case .BrewerHarrower_Diverging_PinkYellowGreen: return ICPalettes.BrewerHarrower.Diverging.PinkYellowGreen()
                case .BrewerHarrower_Diverging_PurpleGreen: return ICPalettes.BrewerHarrower.Diverging.PurpleGreen()
                case .BrewerHarrower_Diverging_PurpleOrange: return ICPalettes.BrewerHarrower.Diverging.PurpleOrange()
                case .BrewerHarrower_Diverging_RedBlue: return ICPalettes.BrewerHarrower.Diverging.RedBlue()
                case .BrewerHarrower_Sequential_Reds: return ICPalettes.BrewerHarrower.Sequential.Reds()
                case .BrewerHarrower_Sequential_Blues: return ICPalettes.BrewerHarrower.Sequential.Blues()
                case .BrewerHarrower_Sequential_Greens: return ICPalettes.BrewerHarrower.Sequential.Greens()
                case .BrewerHarrower_Sequential_Grays: return ICPalettes.BrewerHarrower.Sequential.Grays()
                case .BrewerHarrower_Sequential_Oranges: return ICPalettes.BrewerHarrower.Sequential.Oranges()
                case .BrewerHarrower_Sequential_Purples: return ICPalettes.BrewerHarrower.Sequential.Purples()
                case .BrewerHarrower_Sequential_BluePurple: return ICPalettes.BrewerHarrower.Sequential.BluePurple()
                case .BrewerHarrower_Sequential_OrangeRed: return ICPalettes.BrewerHarrower.Sequential.OrangeRed()
                case .BrewerHarrower_Sequential_PurpleBlue: return ICPalettes.BrewerHarrower.Sequential.PurpleBlue()
                case .BrewerHarrower_Sequential_RedPurple: return ICPalettes.BrewerHarrower.Sequential.RedPurple()
                case .BrewerHarrower_Sequential_YellowGreenBlue: return ICPalettes.BrewerHarrower.Sequential.YellowGreenBlue()
                case .BrewerHarrower_Sequential_YellowOrangeBrown: return ICPalettes.BrewerHarrower.Sequential.YellowOrangeBrown()
                case .BrewerHarrower_Sequential_YellowOrangeRed: return ICPalettes.BrewerHarrower.Sequential.YellowOrangeRed()
                case .FabioCrameri_Cyclic_RomaO: return ICPalettes.FabioCrameri.Cyclic.RomaO()
                case .FabioCrameri_Cyclic_BamO: return ICPalettes.FabioCrameri.Cyclic.BamO()
                case .FabioCrameri_Cyclic_BrocO: return ICPalettes.FabioCrameri.Cyclic.BrocO()
                case .FabioCrameri_Cyclic_CorkO: return ICPalettes.FabioCrameri.Cyclic.CorkO()
                case .FabioCrameri_Cyclic_VikO: return ICPalettes.FabioCrameri.Cyclic.VikO()
                case .FabioCrameri_Diverging_Broc: return ICPalettes.FabioCrameri.Diverging.Broc()
                case .FabioCrameri_Diverging_Cork: return ICPalettes.FabioCrameri.Diverging.Cork()
                case .FabioCrameri_Diverging_Vik: return ICPalettes.FabioCrameri.Diverging.Vik()
                case .FabioCrameri_Diverging_Lisbon: return ICPalettes.FabioCrameri.Diverging.Lisbon()
                case .FabioCrameri_Diverging_Tofino: return ICPalettes.FabioCrameri.Diverging.Tofino()
                case .FabioCrameri_Diverging_Berlin: return ICPalettes.FabioCrameri.Diverging.Berlin()
                case .FabioCrameri_Diverging_Roma: return ICPalettes.FabioCrameri.Diverging.Roma()
                case .FabioCrameri_Diverging_Bam: return ICPalettes.FabioCrameri.Diverging.Bam()
                case .FabioCrameri_Diverging_Vanimo: return ICPalettes.FabioCrameri.Diverging.Vanimo()
                case .FabioCrameri_Multisequential_Oleron: return ICPalettes.FabioCrameri.Multisequential.Oleron()
                case .FabioCrameri_Multisequential_Bukavu: return ICPalettes.FabioCrameri.Multisequential.Bukavu()
                case .FabioCrameri_Multisequential_Fes: return ICPalettes.FabioCrameri.Multisequential.Fes()
                case .FabioCrameri_Sequential_Batlow: return ICPalettes.FabioCrameri.Sequential.Batlow()
                case .FabioCrameri_Sequential_BatlowW: return ICPalettes.FabioCrameri.Sequential.BatlowW()
                case .FabioCrameri_Sequential_BatlowK: return ICPalettes.FabioCrameri.Sequential.BatlowK()
                case .FabioCrameri_Sequential_Devon: return ICPalettes.FabioCrameri.Sequential.Devon()
                case .FabioCrameri_Sequential_LaJolla: return ICPalettes.FabioCrameri.Sequential.LaJolla()
                case .FabioCrameri_Sequential_Bamako: return ICPalettes.FabioCrameri.Sequential.Bamako()
                case .FabioCrameri_Sequential_Davos: return ICPalettes.FabioCrameri.Sequential.Davos()
                case .FabioCrameri_Sequential_Bilbao: return ICPalettes.FabioCrameri.Sequential.Bilbao()
                case .FabioCrameri_Sequential_Nuuk: return ICPalettes.FabioCrameri.Sequential.Nuuk()
                case .FabioCrameri_Sequential_Oslo: return ICPalettes.FabioCrameri.Sequential.Oslo()
                case .FabioCrameri_Sequential_GrayC: return ICPalettes.FabioCrameri.Sequential.GrayC()
                case .FabioCrameri_Sequential_Hawaii: return ICPalettes.FabioCrameri.Sequential.Hawaii()
                case .FabioCrameri_Sequential_Lapaz: return ICPalettes.FabioCrameri.Sequential.Lapaz()
                case .FabioCrameri_Sequential_Tokyo: return ICPalettes.FabioCrameri.Sequential.Tokyo()
                case .FabioCrameri_Sequential_Buda: return ICPalettes.FabioCrameri.Sequential.Buda()
                case .FabioCrameri_Sequential_Acton: return ICPalettes.FabioCrameri.Sequential.Acton()
                case .FabioCrameri_Sequential_Turku: return ICPalettes.FabioCrameri.Sequential.Turku()
                case .FabioCrameri_Sequential_Imola: return ICPalettes.FabioCrameri.Sequential.Imola()
                case .JamieNunez_Cividis5: return ICPalettes.JamieNunezEtAl.Sequential.Cividis5Step()
                case .JamieNunez_Cividis6: return ICPalettes.JamieNunezEtAl.Sequential.Cividis6Step()
                case .JamieNunez_Cividis10: return ICPalettes.JamieNunezEtAl.Sequential.Cividis10Step()
            }
        }
    }
}
