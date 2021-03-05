import Foundation

internal extension ICTextColorsMetrics {
    
    func evaluate(_ combos: [ICTextBGFontTriplet]
    ) -> [ICAssessment.TextColors<ICSRGBA>.Comparison] {
        
        combos.map { combo in
            
            let text = combo.text.a == 1
                ? combo.text.rgb
                : layer(foreground: combo.text.rgb,
                        onTopOf: combo.bg.rgb,
                        with: combo.text.a)
            
            let score = scoreContrast(text: text, bg: combo.bg.rgb)
            let pass = didPass(score: score, font: combo.font)
            
            return ICAssessment.TextColors.Comparison(text: combo.text,
                                                      bg: combo.bg,
                                                      font: combo.font,
                                                      score: score,
                                                      didPass: pass,
                                                      indexText: combo.indexText,
                                                      indexBG: combo.indexBG,
                                                      indexFont: combo.indexFont)
        }
    }
}
