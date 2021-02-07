import Foundation

/// Gamma-compressed 0...1 channels
public typealias sRGBColor = SIMD3<ICColorChannel>

public extension sRGBColor {
    var red: ICColorChannel {
        self[0]
    }
    var green: ICColorChannel {
        self[1]
    }
    var blue: ICColorChannel {
        self[2]
    }
}

public extension sRGBColor {
    init(r255: Int, g: Int, b: Int) {
        self.init(r255.div255(), g.div255(), b.div255())
    }
    
    init(gray255: Int) {
        self.init(repeating: gray255.div255())
    }
}
