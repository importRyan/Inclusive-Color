import Foundation

public enum ICVisionInclusivity {
    
    /// Evaluates typical trichromatic vision only, excluding color blind people.
    ///
    case max94percent
    
    /// Inclusive of 99% of color blind people, but excluding tritanopes and monochromats who are still a good number of us humans. Aging and many medical conditions can also reduce hue and contrast discrimination.
    ///
    case max99percent
    
    /// Inclusive of all simulated vision types.
    ///
    case maxInclusivity
    
    
    internal var visionTypes: [ICColorVisionType] {
        switch self {
            
            case .max94percent:
                return [.typicalTrichromacy]

            case .max99percent:
                return [.typicalTrichromacy,
                        .deuteranopia,
                        .protanopia]
                
            case .maxInclusivity:
                return ICColorVisionType.allCases
        }
    }
}

