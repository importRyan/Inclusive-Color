import Foundation

/// Protocol for a vision simulator. A global singelton is used by assessment and contrast metric evaluations, which you can replace.
///
/// # Default
/// This framework simulates color blindness using the model published by Gustavo Machado, Manuel Oliveira, and Leandro Fernandes.
///
/// The "Machado" model, published in 2009, is widely cited and adopted, including in the Colorspacious and Colorspace R packages, Chrome, Firefox, and several accessiblity tools. The model aims to account for both opponent color and cone response theories of color vision. You can [read the full paper and browse supplementary material](https://www.inf.ufrgs.br/~oliveira/pubs_files/CVD_Simulation/CVD_Simulation.html).
///
public protocol ICVisionSimulator {
    
    // MARK - Single Input
    
    /// Simulate an sRGB color's perception for the specified vision type
    ///
    /// - Parameters:
    ///   - color: sRGB color (as a framework-internal color object)
    ///   - visionType: A stereotypical color vision type
    ///
    /// - Returns: sRGB color (as a framework-internal color object)
    ///
    func simulate(_ color: ICSRGBA,
                  _ visionType: ICColorVisionType) -> ICSRGBA
    
    /// Simulate a color's perception across seven human vision types
    ///
    /// - Parameters:
    ///   - color: sRGB color (as a framework-internal color object)
    ///
    /// - Returns: sRGB color (as a framework-internal color object)
    ///
    func simulate(_ color: ICSRGBA,
                  _ inclusivity: ICVisionInclusivity) -> [ICColorVisionType : ICSRGBA]
    
    /// Simulate a color's perception in vision types representing a target share of the human population
    ///
    /// - Parameters:
    ///   - color: sRGB color (as a framework-internal color object)
    ///   - inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
    ///
    /// - Returns: A dictionary of sRGB colors (as a framework-internal object), keyed by vision type
    ///
    func simulate(_ color: ICSRGBA) -> [ICColorVisionType : ICSRGBA]
    
    // MARK - Array Inputs
    
    /// Simulate sRGB color perception for the specified vision type
    ///
    /// - Parameters:
    ///   - colors: sRGB colors (as framework-internal color objects)
    ///   - visionType: A stereotypical color vision type
    ///
    /// - Returns: In-order sRGB colors (as framework-internal color objects)
    ///
    func simulate(_ colors: [ICSRGBA],
                  _ visionType: ICColorVisionType) -> [ICSRGBA]
    
    /// Simulate color perception across seven human vision types
    ///
    /// - Parameter colors: sRGB colors (as framework-internal color objects)
    ///
    /// - Returns: A dictionary of in-order sRGB colors (as framework-internal color objects), keyed by vision type
    ///
    func simulate(_ colors: [ICSRGBA]) -> [ICColorVisionType : [ICSRGBA]]
    
    /// Simulate color perception in vision types representing a target share of the human population
    ///
    /// - Parameters:
    ///   - colors: sRGB colors (as framework-internal color objects)
    ///   - inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
    ///
    /// - Returns: A dictionary of in-order sRGB colors (as framework-internal color objects), keyed by vision type
    ///
    func simulate(_ colors: [ICSRGBA],
                  _ inclusivity: ICVisionInclusivity) -> [ICColorVisionType : [ICSRGBA]]
}
