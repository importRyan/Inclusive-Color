import Foundation

public extension ICSRGBA {
    
    /// Simulate a color's perception in a chosen vision type
    ///
    /// - Parameter visionType: a stereotypical color vision type
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: a framework-internal sRGB object
    ///
    func simulate(for visionType: ICColorVisionType,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> ICSRGBA {
        
        simulator.simulate(self, visionType)
    }
    
    /// Simulate a color's perception in vision types representing a target share of the human population
    ///
    /// - Parameter inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: A dictionary of framework-internal sRGB objects, keyed by vision type
    ///
    func simulate(for inclusivity: ICVisionInclusivity,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> [ICColorVisionType:ICSRGBA] {
        
        simulator.simulate(self, inclusivity)
    }
}

public extension Array where Element == ICSRGBA {

    /// Simulate color perception in a chosen vision type
    ///
    /// - Parameter visionType: a stereotypical color vision type
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: In-order framework-internal sRGB objects
    ///
    func simulate(for type: ICColorVisionType,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> [ICSRGBA] {
        
        simulator.simulate(self, type)
    }

    /// Simulate color perception in vision types representing a target share of the human population
    ///
    /// - Parameter inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
    /// - Parameter simulator: A default or customized color vision simulator
    ///
    /// - Returns: A dictionary of in-order framework-internal sRGB objects, keyed by vision type
    ///
    func simulate(for inclusivity: ICVisionInclusivity,
                  _ simulator: ICVisionSimulator = InclusiveColorTools.simulator)
    -> [ICColorVisionType:[ICSRGBA]] {
        
        simulator.simulate(self, inclusivity)
    }
}


