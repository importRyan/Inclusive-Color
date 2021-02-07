import Foundation

/// Order of the output array is the result of three nested loops: the outermost being text colors, followed by background colors, and finally fonts.
///
internal func getTextCombos(from text: [ICColorVisionType:[ICSRGBA]],
                            _ bgs: [ICColorVisionType:[ICSRGBA]],
                            _ fonts: [ICFontStyle]
) -> [ICColorVisionType : [ICTextBGFontTriplet]] {
    
    var combos: [ICColorVisionType : [ICTextBGFontTriplet]] = [:]
    
    // All keys assumed to be equal (set internally in framework)
    text.keys.forEach {
        
        if let texts = text[$0],
           let backgrounds = bgs[$0] {
            combos.updateValue(combine(texts, backgrounds, fonts),
                               forKey: $0)
        }
    }
    
    return combos
}

fileprivate func combine(_ text: [ICSRGBA],
                         _ bgs: [ICSRGBA],
                         _ fonts: [ICFontStyle]
) -> [ICTextBGFontTriplet] {
    
    var combos: [ICTextBGFontTriplet] = []
    
    for t in text.indices {
        for b in bgs.indices {
            for f in fonts.indices {
                combos.append((text: text[t], font: fonts[f], bg: bgs[b],
                              indexText: t, indexFont: f, indexBG: b))
            }
        }
    }
    
    return combos
}
