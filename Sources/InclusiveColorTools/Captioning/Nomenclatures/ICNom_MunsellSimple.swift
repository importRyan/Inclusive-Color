import Foundation

/// Adapted Source: [Adobe Technical Guide](https://web.archive.org/web/20030813092028/http://www.adobe.com/support/techguides/color/colormodels/munsell.html)
///
public enum ICNomenclature_MunsellSimple: Int, Identifiable, CaseIterable, ICNomenclature {
     
    public var id: Int { rawValue }

    public static let segmentCount: Int = 10
    
    public static let black = "Black"
    public static let white = "White"
    public static let gray = "Gray"
    
    case red
    case yellowRed
    case yellow
    case greenYellow
    case green
    case blueGreen
    case blue
    case purpleBlue
    case purple
    case redPurple
    
    public var name: String {
        switch self {
            case .red: return "Red"
            case .yellowRed: return "Yellow-Red"
            case .yellow: return "Yellow"
            case .greenYellow: return "Green-Yellow"
            case .green: return "Green"
            case .blueGreen: return "Blue-Green"
            case .blue: return "Blue"
            case .purpleBlue: return "Purple-Blue"
            case .purple: return "Purple"
            case .redPurple: return "Red-Purple"
        }
    }
    
    public static func handleExceptions(_ input: HSV) -> String? {

        let brownHue: ClosedRange<HueDegrees> = (0.06...0.10)
        let brownSaturation: ClosedRange<ICColorChannel> = (0.5...0.7)
        let brownValue: ClosedRange<ICColorChannel> = (0.5...0.7)
        
        if brownHue.contains(input.hue01)
            && brownSaturation.contains(input.saturation01)
            && brownValue.contains(input.value01) {
            return "Brown"
        }
        
        return nil
    }
}
