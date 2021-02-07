#if canImport(UIKit)
import UIKit


public extension UIColor {

    /// Simulate a color's perception in a chosen vision type
    ///
    /// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
    ///
    /// - Parameter type: a stereotypical color vision type
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: an sRGB UIColor object
    ///
    func simulate(for type: ICColorVisionType,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator) -> UIColor {
        
        guard type != .typicalTrichromacy,
              let cgcolor = sRGBA else { return self }
        return UIColor(simulator.simulate(cgcolor, type))
    }

    /// Simulate a color's perception in vision types representing a target share of the human population
    ///
    /// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
    ///
    /// - Parameter inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: A dictionary of sRGB UIColor objects, keyed by vision type
    ///
    func simulate(for inclusivity: ICVisionInclusivity,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator) -> [ICColorVisionType : UIColor] {
        
        guard let cgcolor = sRGBA else { return [.typicalTrichromacy:self] }
        return simulator.simulate(cgcolor, inclusivity)
            .mapValues { UIColor($0) }
    }

    /// Simulate a color's perception across seven human vision types
    ///
    /// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
    ///
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: A dictionary of sRGB UIColor objects, keyed by vision type
    ///
    func simulate(_ simulator: ICVisionSimulator = InclusiveColorTools.simulator) -> [ICColorVisionType : UIColor] {
        
        guard let cgcolor = sRGBA else { return [.typicalTrichromacy:self] }
        return simulator.simulate(cgcolor)
            .mapValues { UIColor($0) }
    }

}

public extension Collection where Element == UIColor {

    /// Simulate color perception in a chosen vision type
    ///
    /// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
    ///
    /// - Parameter type: a stereotypical color vision type
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: In-order sRGB UIColor objects
    ///
    func simulate(for type: ICColorVisionType,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator) -> [UIColor] {
        
        simulator.simulate(sRGBA, type).uiColors
    }

    /// Simulate color perception in vision types representing a target share of the human population
    ///
    /// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
    ///
    /// - Parameter inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: A dictionary of in-order sRGB UIColor objects, keyed by vision type
    ///
    func simulate(for inclusivity: ICVisionInclusivity,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator) -> [ICColorVisionType : [UIColor]] {

        simulator.simulate(sRGBA, inclusivity)
            .mapValues { $0.uiColors }
    }

    /// Simulate color perception across seven human vision types
    ///
    /// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
    ///
    /// - Parameter type: a stereotypical color vision type
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: A dictionary of in-order sRGB UIColor objects, keyed by vision type
    ///
    func simulate(_ simulator: ICVisionSimulator = InclusiveColorTools.simulator) -> [ICColorVisionType : [UIColor]] {

        simulator.simulate(sRGBA)
            .mapValues { $0.uiColors }
    }

}
#endif

