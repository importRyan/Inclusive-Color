import Foundation

internal extension ICTextColorsMetrics {
    
    func evaluate(_ combos: [ICTextBGFontTriplet]
    ) -> [ICTextColorsComparison<ICSRGBA>] {
        
        combos.map { combo in
            
            let score = scoreContrast(text: combo.text.rgb, bg: combo.bg.rgb)
            let pass = didPass(score: score, font: combo.font)
            
            return ICTextColorsComparison(text: combo.text,
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
