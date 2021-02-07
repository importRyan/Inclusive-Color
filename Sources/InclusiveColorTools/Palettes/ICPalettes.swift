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
        case IBMDataVisStarter
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
            }
        }
    }
}
