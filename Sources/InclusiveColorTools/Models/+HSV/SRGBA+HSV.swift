import Foundation


public typealias HueDegrees = ICColorChannel

public typealias ICHSV = (hue01: HueDegrees, saturation01: ICColorChannel, value01: ICColorChannel)

public extension ICSRGBA {
    
    
    /// Hue Saturation and Value for an sRGB color, reported with hue degrees represented, like saturation and value, in a 0...1 decimal scale.
    var hsv: ICHSV {
        
        if rgb.red == 0 && rgb.green == 0 && rgb.blue == 0 {
            return HSV(hue01: 0, saturation01: 0, value01: 0)
        } else if rgb.red == 1 && rgb.green == 1 && rgb.blue == 1 {
            return HSV(hue01: 0, saturation01: 0, value01: 1)
        }
        
        let channelMax = max(rgb.red, rgb.green, rgb.blue)
        let channelMin = min(rgb.red, rgb.green, rgb.blue)
        let delta = channelMax - channelMin
        
        var degrees = HueDegrees(0)
       
        guard delta > 0 && delta.isFinite else {
            return (hue01: 0,
                    saturation01: channelMax == 0 ? 0 : delta / channelMax,
                    value01: channelMax)
        }
        if rgb.red == channelMax {
            let dividend = (rgb.green - rgb.blue) / delta
            degrees = trueModulo(dividend: dividend, divisor: 6)
            
        } else if rgb.green == channelMax {
            degrees = (rgb.blue - rgb.red) / delta + 2
            
        } else {
            degrees = (rgb.red - rgb.green) / delta + 4
        }
        
        degrees *= 60
        
        return (hue01: clampHueTo01(degrees),
                saturation01: channelMax == 0 ? 0 : delta / channelMax,
                value01: channelMax)
    }
    
    private func clampHueTo01(_ hue360: HueDegrees) -> HueDegrees {
        
        var corrected = hue360
        
        if hue360.isNaN { return 0 }
        while corrected > 360 { corrected -= 360 }
        while corrected < 0 { corrected += 360 }
        
        return corrected / 360
    }
}


func trueModulo(dividend: ICColorChannel, divisor: ICColorChannel) -> ICColorChannel {
    let r = dividend.remainder(dividingBy: divisor)
    return r >= 0 ? r : r + divisor
}


