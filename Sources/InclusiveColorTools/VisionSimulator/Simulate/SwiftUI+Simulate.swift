#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14.0, tvOS 14, macOS 11.0, macCatalyst 14, watchOS 7, *)
public extension Color {
    
    /// Simulate a color's perception in a chosen vision type
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    /// - Parameter type: a stereotypical color vision type
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: an sRGB SwiftUI Color object
    ///
    func simulate(for type: ICColorVisionType,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> Color {
        
        guard type != .typicalTrichromacy,
              let isAColor = sRGBA else { return self }
        return Color(simulator.simulate(isAColor, type))
    }
    
    /// Simulate a color's perception in vision types representing a target share of the human population
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    /// - Parameter inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: A dictionary of sRGB SwiftUI Color objects, keyed by vision type
    ///
    func simulate(for inclusivity: ICVisionInclusivity,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> [ICColorVisionType : Color] {
        
        guard let isAColor = sRGBA else { return [.typicalTrichromacy:self] }
        return simulator.simulate(isAColor, inclusivity)
            .mapValues { Color($0) }
    }
    
    /// Simulate a color's perception across seven human vision types
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: A dictionary of sRGB SwiftUI Color objects, keyed by vision type
    ///
    func simulate(_ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> [ICColorVisionType : Color] {
        
        guard let isAColor = sRGBA else { return [.typicalTrichromacy:self] }
        return simulator.simulate(isAColor)
            .mapValues { Color($0) }
    }
}

@available(iOS 14.0, tvOS 14, macOS 11.0, macCatalyst 14, watchOS 7, *)
public extension Collection where Element == Color {
    
    /// Simulate color perception in a chosen vision type
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    /// - Parameter type: a stereotypical color vision type
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: In-order sRGB SwiftUI Color objects
    ///
    func simulate(for type: ICColorVisionType,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> [Color] {
        
        simulator.simulate(sRGBA, type).swiftUIcolors
    }
    
    /// Simulate color perception in vision types representing a target share of the human population
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    /// - Parameter inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: A dictionary of in-order sRGB SwiftUI Color objects, keyed by vision type
    ///
    func simulate(for inclusivity: ICVisionInclusivity,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> [ICColorVisionType : [Color]] {
        
        simulator.simulate(sRGBA, inclusivity)
            .mapValues { $0.swiftUIcolors }
    }
    
    /// Simulate color perception across seven human vision types
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    /// - Parameter type: a stereotypical color vision type
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: A dictionary of in-order sRGB SwiftUI Color objects, keyed by vision type
    ///
    func simulate(_ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> [ICColorVisionType : [Color]] {
        
        simulator.simulate(sRGBA)
            .mapValues { $0.swiftUIcolors }
    }
    
}
#endif

