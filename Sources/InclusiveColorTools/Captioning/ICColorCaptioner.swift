
import Foundation

/// Label a color by its hue and value. Choose from multiple nomenclatures to fit your purpose.
///
public class ICColorCaptioner {
    
    private var nomenclature: ICNomenclature.Type = ICNomenclature_TheColorist.self

    internal static var `default` = { ICColorCaptioner() }
}

extension ICColorCaptioner: ICColorCaptioning {
    
    /// Set the default naming scheme used to caption colors both for your use of the captioner and for the debug descriptions of colors in this framework.
    ///
    /// - Parameter newNomenclature: Naming scheme adhering to the protocol ICNomenclature
    ///
    public func setNomenclature(_ newNomenclature: ICNomenclature.Type) {
        self.nomenclature = newNomenclature
    }
    
    /// Label a color by its hue and value.
    ///
    /// - Parameter color: Any native color object or framework-internal ICSRGBA object
    ///
    /// - Returns: Color label string
    ///
    public func caption<C>(_ color: C) -> String where C : ICAnyColor {
        let hsv = color.hsv
        let gray = isGrayscale(saturation: hsv.saturation01,
                               value: hsv.value01)
        guard gray == .isAColor
        else { return gray.name(in: nomenclature) }
        
        return nomenclature.getLabel(hsv)
    }
}

private extension ICColorCaptioner {

    func isGrayscale(saturation: ICColorChannel, value: ICColorChannel) -> GrayscaleOption {
        if value == 0 { return .black }
        if value > 0.98 && saturation < 0.02 { return .white }
        if saturation < 0.03 { return .gray }
        return .isAColor
    }
    
    enum GrayscaleOption {
        case black
        case white
        case gray
        case isAColor
        
        func name(in nomenclature: ICNomenclature.Type) -> String {
            switch self {
                case .black: return nomenclature.black
                case .white: return nomenclature.white
                case .gray: return nomenclature.gray
                case .isAColor: return "Grayscale error"
            }
        }
    }
}

