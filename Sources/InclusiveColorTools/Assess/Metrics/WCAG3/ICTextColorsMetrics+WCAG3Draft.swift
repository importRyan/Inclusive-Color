import Foundation

public extension ICTextColorsMetrics {
    
    /// Evaluate text using the draft WCAG3 perceptual text contrast metric. Commit: b206f4de40b3c98b1c9bc9a9b4af98de8990f9d1. [Repo](https://github.com/Myndex/SAPC-APCA)
    ///
    /// Algorithm author's note: Darker color pairs that WCAG2 incorrectly pass will fail under APCA, and light text on dark backgrounds that WCAG incorrectly fail will now pass under APCA. Ultimately, APCA will provide 50% more colors, and do so correctly.
    ///
    /// WCAG3 draft perceptual text contrast metric will immediately fail certain point size and font weight combinations, regardless of contrast score. For example, a 100 weight thin font will fail unless larger than font size 27.
    ///
    enum WCAG3ContrastDraft {
        
        /// Minimum contrast score of 80 or, if higher, the minimum passing score for a given font weight, size, and purpose
        ///
        case acpa80_SimilarTo7
        
        /// Minimum contrast score of 60 or, if higher, the minimum passing score for a given font weight, size, and purpose
        ///
        case acpa60_SimilarTo45
        
        /// Minimum contrast score of 40 or, if higher, the minimum passing score for a given font weight, size, and purpose
        ///
        case acpa40_SimilarTo3
        
        /// Passes on the absolute minimum for a given font weight, size, and purpose
        ///
        case acpaAbsoluteMinimum
    }
}

public extension ICTextColorsMetrics.WCAG3ContrastDraft {
    
    func scoreContrast(text: sRGBColor, bg: sRGBColor) -> ICContrastRatio {
        scoreWCAG3TextBGPair(text, bg)
    }
    
    func didPass(score: ICContrastRatio, font: ICFontStyle) -> Bool {
        didWCAG3TextScorePass(abs(score), font, minimum)
    }
    
    var minimum: ICContrastRatio {
        switch self {
            case .acpa80_SimilarTo7: return 80
            case .acpa60_SimilarTo45: return 60
            case .acpa40_SimilarTo3: return 40
            case .acpaAbsoluteMinimum: return 0
        }
    }
}


// MARK: - Methods for Contrast Scoring

/// 8 d12e Commit: b206f4de40b3c98b1c9bc9a9b4af98de8990f9d1 [Repo](https://github.com/Myndex/SAPC-APCA)
///
fileprivate func scoreWCAG3TextBGPair(_ text: sRGBColor, _ bg: sRGBColor)
-> ICContrastRatio {
    
    var textValue = decodeGammaAPCA(sRGB: text)
    var bgValue = decodeGammaAPCA(sRGB: bg)
    
    let h = abs(bgValue - textValue)
    
    (textValue, bgValue) = encodeLuminanceByDarkerColor(text: textValue, bg: bgValue)
    
    return 100 * getWCAG3TextLc(text: textValue, bg: bgValue, h: h)
}

/// 8 d12e Commit: b206f4de40b3c98b1c9bc9a9b4af98de8990f9d1 [Repo](https://github.com/Myndex/SAPC-APCA)
///
fileprivate func decodeGammaAPCA(sRGB: sRGBColor) -> ICColorChannel {
    let exp: ICColorChannel = 2.4
    let linear = (x: pow(sRGB[0], exp),
                  y: pow(sRGB[1], exp),
                  z: pow(sRGB[2], exp))
    
    let rec709 = SIMD3.rec709luma
    let y = linear.x * rec709.x + linear.y * rec709.y + linear.z * rec709.z
    return y
}

fileprivate func encodeLuminanceByDarkerColor(text: ICColorChannel, bg: ICColorChannel)
-> (text: ICColorChannel, bg: ICColorChannel) {
    
    let SnormBG: ICColorChannel = 0.55
    let SnormText: ICColorChannel = 0.58
    let SrevBG: ICColorChannel = 0.62
    let SrevText: ICColorChannel = 0.57
    
    // Encode luminance in light and dark text scenarios differently
    if text < bg {
        return (
            pow(clampDarkerColor(text), SnormText),
            pow(bg, SnormBG)
        )
    } else if bg < text {
        return (
            pow(text, SrevText),
            pow(clampDarkerColor(bg), SrevBG)
        )
    }
    
    return (text, bg)
}

/// 8 d12e Commit: b206f4de40b3c98b1c9bc9a9b4af98de8990f9d1 [Repo](https://github.com/Myndex/SAPC-APCA)
///
fileprivate func clampDarkerColor(_ y: ICColorChannel) -> ICColorChannel {
    let needsClampUnlabeledNotInLatex: ICColorChannel = 0.02
    let Bthresh: ICColorChannel = 0.03
    let Bexp: ICColorChannel = 1.45
    
    guard y < needsClampUnlabeledNotInLatex else { return y }
    return y + pow(Bthresh - y, Bexp)
}

/// 8 d12e Commit: b206f4de40b3c98b1c9bc9a9b4af98de8990f9d1
/// Using Myndex's constant names
fileprivate func getWCAG3TextLc(text: ICColorChannel, bg: ICColorChannel, h: ICColorChannel) -> ICColorChannel {
    let Pin: ICColorChannel = 0.0005
    let Pout: ICColorChannel = 0.001
    let Dscale: ICColorChannel = 1.25
    let Gthresh: ICColorChannel = 0.078
    let Goffset: ICColorChannel = 0.06
    let Gfactor: ICColorChannel = 1 / Gthresh
    
    var c = (bg - text) * Dscale
    if text == bg || h < Pin {
        c = 0
    }
    
    if abs(c) < Pout {
        return 0
    }

    if abs(c) <= Gthresh {
        return c - (c * Gfactor) * Goffset
    }
    
    if c > Gthresh {
        return c - Goffset
    }
    
    if c < -Gthresh {
        return c + Goffset
    }
    
    return 0
}


// MARK: - Method for Pass / No Pass Determination


/// WCAG3 draft perceptual text contrast metric will immediately fail certain point size and font weight combinations, regardless of contrast score. For example, a 100 weight thin font will fail unless larger than font size 27. This ridiculously long function encodes those irregularities in a table, with emphasis on reducing typos rather than minimizing code length.
///
/// 8 d12e Commit: b206f4de40b3c98b1c9bc9a9b4af98de8990f9d1 [Repo](https://github.com/Myndex/SAPC-APCA)
///
/// Not implemented: "Linear interpolation is approved provided that it is between immediately adjacent levels, and always rounded up (ceiling). Fonts may be rounded up to the nearest 0.5px when less than 24px, or to the nearest 1px for larger fonts."
///
/// - Parameters:
///   - score: WCAG3 contrast score
///   - font: Includes font size, CSS weight, and font's purpose, such as a headline, body paragph or copyright notice.
///   - minimum: Minimum contrast score that must be met, even if a lower ratio would be allowed. This minimum is superceded by any requirements for a higher contrast ratio given a font's properties.
///
/// - Returns: Boolean for whether the contrast score passed requirements
///
fileprivate func didWCAG3TextScorePass(_ score: ICContrastRatio,
                                _ font: ICFontStyle,
                                _ minimum: ICContrastRatio) -> Bool {
    
    guard score >= minimum else { return false }
    
    var didPass = false

    switch font.weight {
        case 1:

            switch font.pointSize {
                case ..<36:
                    break
                case 36..<45:
                    didPass = score >= 100
                    break
                case 45..<54:
                    didPass = score >= 90
                    break
                case 54..<72:
                    didPass = score >= 80
                    break
                case 72..<90:
                    didPass = score >= 70
                    break
                case 90...:
                    didPass = score >= 60
                    break
                    
                default:
                    didPass = score >= 60
                    break
            }
                
        case 2:

            switch font.pointSize {
                case ..<18:
                    break
                case 18..<22.5:
                    didPass = score >= 100
                    break
                case 22.5..<27:
                    didPass = score >= 90
                    break
                case 27..<36:
                    didPass = score >= 80
                    break
                case 36..<45:
                    didPass = score >= 70
                    break
                case 45..<54:
                    didPass = score >= 60
                    break
                case 54..<72:
                    didPass = score >= 55
                    break
                case 72..<90:
                    didPass = score >= 50
                    break
                case 90...:
                    didPass = score >= 40
                    break
                    
                default:
                    didPass = score >= 40
                    break
            }
            
        case 3:

            switch font.pointSize {
                case ..<9:
                    break
                case 9..<12:
                    didPass = font.purpose == .copyright
                    break
                case 12..<13.5:
                    didPass = score >= 100
                    break
                case 13.5..<18:
                    didPass = score >= 90
                    break
                case 18..<22.5:
                    didPass = score >= 80
                    break
                case 22.5..<27:
                    didPass = score >= 70
                    break
                case 27..<36:
                    didPass = score >= 60
                    break
                case 36..<45:
                    didPass = score >= 55
                    break
                case 45..<54:
                    didPass = score >= 50
                    break
                case 54..<72:
                    didPass = score >= 40
                    break
                case 72..<90:
                    didPass = score >= 35
                    break
                case 90...:
                    didPass = score >= 30
                    break
                    
                default:
                    didPass = score >= 30
                    break
            }
            
        case 4:
            
            switch font.pointSize {
                case ..<7.5:
                    break
            
                case 7.5..<10.5:
                    didPass = font.purpose == .copyright
                    break
                case 10.5..<12:
                    didPass = score >= 100
                    break
                case 12..<13.5:
                    didPass = score >= 90
                    break
                case 13.5..<18:
                    didPass = score >= 80
                    break
                case 18..<22.5:
                    didPass = score >= 60
                    break
                case 22.5..<27:
                    didPass = score >= 55
                    break
                case 27..<36:
                    didPass = score >= 50
                    break
                case 36..<45:
                    didPass = score >= 40
                    break
                case 45..<54:
                    didPass = score >= 38
                    break
                case 54..<72:
                    didPass = score >= 35
                    break
                case 72..<90:
                    didPass = score >= 30
                    break
                case 90...:
                    didPass = score >= 25
                    break
                    
                default:
                    didPass = score >= 25
                    break
            }
            
        case 5:
            
            switch font.pointSize {
                case ..<7.5:
                    break
            
                case 7.5..<9:
                    didPass = font.purpose == .copyright
                    break
                case 9..<10.5:
                    didPass = font.purpose != .body && score >= 100
                    break
                case 10.5..<12:
                    didPass = score >= 90
                    break
                case 12..<13.5:
                    didPass = score >= 80
                    break
                case 13.5..<18:
                    didPass = score >= 60
                    break
                case 18..<22.5:
                    didPass = score >= 55
                    break
                case 22.5..<27:
                    didPass = score >= 50
                    break
                case 27..<36:
                    didPass = score >= 40
                    break
                case 36..<45:
                    didPass = score >= 38
                    break
                case 45..<54:
                    didPass = score >= 35
                    break
                case 54..<72:
                    didPass = score >= 30
                    break
                case 72..<90:
                    didPass = score >= 25
                    break
                case 90...:
                    didPass = score > 20
                    break
                    
                default:
                    didPass = score > 20
                    break
            }
            
        case 6:
            switch font.pointSize {
                case ..<7.5:
                    break
            
                case 7.5..<9:
                    didPass = font.purpose == .copyright
                    break
                case 9..<10.5:
                    didPass = font.purpose != .body && score >= 90
                    break
                case 10.5..<12:
                    didPass = score >= 80
                    break
                case 12..<13.5:
                    didPass = score >= 60
                    break
                case 13.5..<18:
                    didPass = score >= 55
                    break
                case 18..<22.5:
                    didPass = score >= 50
                    break
                case 22.5..<27:
                    didPass = score >= 40
                    break
                case 27..<36:
                    didPass = score >= 38
                    break
                case 36..<45:
                    didPass = score >= 35
                    break
                case 45..<54:
                    didPass = score >= 30
                    break
                case 54..<72:
                    didPass = score >= 25
                    break
                case 72...:
                    didPass = score > 20
                    break
                    
                default:
                    didPass = score > 20
                    break
            }
            
        case 7:
            switch font.pointSize {
                case ..<7.5:
                    break
            
                case 7.5..<9:
                    didPass = font.purpose == .copyright
                    break
                case 9..<10.5:
                    didPass = font.purpose != .body && score >= 80
                    break
                case 10.5..<12:
                    didPass = score >= 60
                    break
                case 12..<13.5:
                    didPass = score >= 55
                    break
                case 13.5..<18:
                    didPass = score >= 50
                    break
                case 18..<22.5:
                    didPass = score >= 40
                    break
                case 22.5..<27:
                    didPass = score >= 38
                    break
                case 27..<36:
                    didPass = score >= 35
                    break
                case 36..<45:
                    didPass = score >= 30
                    break
                case 45..<54:
                    didPass = score >= 25
                    break
                case 54...:
                    didPass = score > 20
                    break
                    
                default:
                    didPass = score > 20
                    break
            }
            
        case 8:
            switch font.pointSize {
                case ..<10.5:
                    break
                case 10.5..<12:
                    didPass = font.purpose != .body && score >= 60
                    break
                case 12..<13.5:
                    didPass = font.purpose != .body && score >= 50
                    break
                case 13.5..<18:
                    didPass = font.purpose != .body && score >= 40
                    break
                case 18..<22.5:
                    didPass = score >= 38
                    break
                case 22.5..<27:
                    didPass = score >= 35
                    break
                case 27..<36:
                    didPass = score >= 30
                    break
                case 36..<45:
                    didPass = score >= 25
                    break
                case 45..<54:
                    didPass = score > 20
                    break
                    
                default:
                    didPass = score > 20
                    break
            }
            
        case 9:
            switch font.pointSize {
                case ..<12:
                    break
                case 12..<13.5:
                    didPass = font.purpose != .body && score >= 50
                    break
                case 13.5..<18:
                    didPass = font.purpose != .body && score >= 40
                    break
                case 18..<22.5:
                    didPass = font.purpose != .body && score >= 35
                    break
                case 22.5..<27:
                    didPass = score >= 30
                    break
                case 27..<36:
                    didPass = score >= 25
                    break
                case 36..<45:
                    didPass = score > 20
                    break
                    
                default:
                    didPass = score > 20
                    break
            }
            
        default: break
    }
    
    return didPass
}
