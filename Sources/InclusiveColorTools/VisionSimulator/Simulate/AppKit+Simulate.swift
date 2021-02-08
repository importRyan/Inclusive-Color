#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

public extension NSColor {
    
    /// Simulate a color's perception in a chosen vision type
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    /// - Parameter type: A stereotypical color vision type
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: An sRGB NSColor object
    ///
    func simulate(for type: ICColorVisionType,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> NSColor {
        
        guard type != .typicalTrichromacy,
              let cgcolor = sRGBA else { return self }
        return NSColor(simulator.simulate(cgcolor, type))
    }
    
    
    /// Simulate a color's perception in vision types representing a target share of the human population
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    /// - Parameter inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: A dictionary of sRGB NSColor objects, keyed by vision type
    ///
    func simulate(for inclusivity: ICVisionInclusivity,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> [ICColorVisionType : NSColor] {
        
        guard let cgcolor = sRGBA else { return [.typicalTrichromacy:self] }
        return simulator
            .simulate(cgcolor, inclusivity)
            .mapValues { NSColor($0) }
    }
    
    /// Simulate a color's perception across seven human vision types
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: A dictionary of sRGB NSColor objects, keyed by vision type
    ///
    func simulate(_ simulator: ICVisionSimulator = InclusiveColorTools.simulator) -> [ICColorVisionType : NSColor] {
        
        guard let cgcolor = sRGBA else { return [.typicalTrichromacy:self] }
        return simulator.simulate(cgcolor)
            .mapValues { NSColor($0) }
    }
    
}

public extension Collection where Element == NSColor {
    
    /// Simulate color perception in a chosen vision type
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    /// - Parameter type: A stereotypical color vision type
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: In-order sRGB NSColor objects
    ///
    func simulate(for type: ICColorVisionType,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> [NSColor] {
        
        simulator.simulate(sRGBA, type).nscolors
    }
    
    /// Simulate color perception in vision types representing a target share of the human population
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    /// - Parameter inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: A dictionary of in-order sRGB NSColor objects, keyed by vision type
    ///
    func simulate(for inclusivity: ICVisionInclusivity,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> [ICColorVisionType : [NSColor]] {
        
        simulator.simulate(sRGBA, inclusivity)
            .mapValues { $0.nscolors }
    }
    
    /// Simulate color perception across seven human vision types
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    /// - Parameter type: A stereotypical color vision type
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: A dictionary of in-order sRGB NSColor objects, keyed by vision type
    ///
    func simulate(_ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> [ICColorVisionType : [NSColor]] {
        
        simulator.simulate(sRGBA)
            .mapValues { $0.nscolors }
    }
    
}
#endif

