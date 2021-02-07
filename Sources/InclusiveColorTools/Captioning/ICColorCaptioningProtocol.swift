import Foundation

/// Protocol for labeling a color by its hue and other dimensions
///
public protocol ICColorCaptioning {
    
    /// Label a color by its hue and other dimensions
    ///
    /// - Parameter color: Any native color object or framework-internal ICSRGBA object
    ///
    /// - Returns: Color label string
    ///
    func caption<C: ICAnyColor>(_ color: C) -> String
    
    
    
    /// Set the default naming scheme used to caption colors both for your use of the captioner and for the debug descriptions of colors in this framework.
    ///
    /// - Parameter newNomenclature: Naming scheme adhering to the protocol ICNomenclature
    ///
    func setNomenclature(_ newNomenclature: ICNomenclature.Type)
}
