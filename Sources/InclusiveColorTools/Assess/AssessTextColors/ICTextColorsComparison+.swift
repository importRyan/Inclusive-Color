//
//  File.swift
//  
//
//  Created by Ryan Ferrell on 2/3/21.
//

import Foundation

extension ICAssessment.TextColors.Comparison: CustomStringConvertible {
    public var description: String {
        "\(descriptionRGB888)"
    }
    
    public var descriptionRGB888: String {
        var textLabel = ""
        var bgLabel = ""
        
        if let text = text.sRGBA?.descriptionComponentsRGB888 {
            textLabel = "\(text.caption)  (\(text.r), \(text.g), \(text.b))"
        }
        
        if let bg = bg.sRGBA?.descriptionComponentsRGB888 {
            bgLabel = "\(bg.caption)  (\(bg.r), \(bg.g), \(bg.b))"
        }
        
        let fontLabel = "Pt \(font.pointSize) W \(font.weight * 100)"
        
        return """
        \n
        Text [\(indexText)]  \(textLabel)
        Bg.  [\(indexBG)]  \(bgLabel)
        Font [\(indexFont)] \(fontLabel)
        Score \(String(format: "%1.2f",score)) didPass \(didPass)
        """
    }
}

extension ICTextColorsComparison: Equatable {
    
    public static func == (lhs: ICTextColorsComparison<C>, rhs: ICTextColorsComparison<C>) -> Bool {
        
        guard
            lhs.didPass == rhs.didPass &&
                (lhs.score * 100).rounded() == (rhs.score  * 100).rounded() &&
                lhs.indexText == rhs.indexText &&
                lhs.indexBG == rhs.indexBG &&
                lhs.indexFont == rhs.indexFont
        else { return false }
        
        guard let leftText = lhs.text.sRGBA,
              let rightText = rhs.text.sRGBA,
              let leftBG = lhs.bg.sRGBA,
              let rightBG = rhs.bg.sRGBA
        else { return false }
        
        return leftText.descriptionComponentsRGB888 == rightText.descriptionComponentsRGB888 &&
            leftBG.descriptionComponentsRGB888 == rightBG.descriptionComponentsRGB888
    }
    
}
