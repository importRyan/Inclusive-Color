import Foundation

/// Five general human vision types
///
/// Several hundred million people — about 8% of men and 0.5% of women — are deutans and protans. Contrary to the name "color blindness", most people do not have a total loss of response, but rather a diminished response to certain wavelengths of light. Nevertheless, discriminating certain colors can be frustrating or impossible.
///
/// ## Why leave out vision types like "-anomalies"?
/// A partial shift in cone sensitivity is suffixed with "-anomaly". Full loss is suffixed "-opia". For UX testing, this framework assumes the worst and thus most inclusive scenario. Since an "anomaly" reprents a spectrum of responses, a definite threshold cannot be defined.
///
/// Monochromats are also a diverse group, but simulated as one stereotypic representation due to lack of a peer-reviewed model.
///
public enum ICColorVisionType: CaseIterable {
    
    /// Average human color vision with three color receptors and monochromatic rods. Compared to species of birds with four to perhaps 12 color receptors, typical human color perception provides a limited view of the natural world.
    ///
    case typicalTrichromacy
    
    /// About 6% of men and 0.4% of women have atypical medium-wavelength "green" cones. While adjacent pure red and greens are somewhat differentiable by perceptual luminosity, unpure reds and greens are harder.
    ///
    /// # Example confusing colors:
    /// * yellow vs. green
    /// * red vs. orange
    /// * purples vs. blues
    ///
    case deuteranopia

    /// About 2.5% of men and 0.05% of women have atypical long-wavelength "red" cones. Color perception is similar to deuteranopia.
    ///
    case protanopia
    
    /// About 0.04% of women and 0.01% of men have atypical short-wavelength "blue" cones, leading to confusion between bluish and yellowish hues. Greens may appear similar, but brighter, compared to blues and purples. While empirical tests for tritanopia simulations are less robust due to its rarity, some open source algorithms [may actually incorrectly simulate tritanopia](https://ixora.io/projects/colorblindness/color-blindness-simulation-research/).
    ///
    case tritanopia
    
    /// A potential depiction of achromatopsia. Color discrimination is based upon brightness, with sensitivity to bright light. Forms of monochromacy affect an rare fraction of people, perhaps 0.003%, but in isolated populations this can be more prevalent. Some people have slight function in some cones, enabling some color perception at extremes.
    ///
    /// Note: I am not aware of an evidence-based simulation of monochromatic vision. This framework temporarily uses XYZ Y luminance desaturation as seen in some popular color manipulation R libraries.
    ///
    /// # Example confusing colors:
    /// * green vs. blue
    /// * red vs. black
    /// * yellow vs. white
    /// * isoluminants
    ///
    case monochromacy
}
