import Foundation

/// Source: [The Colorist](https://www.google.com/books/edition/The_Colorist/qFa_qP780RQC?hl=en&gbpv=1&pg=PR19&printsec=frontcover)
/// By J A H Hatt
/// 1908
///
/// Nomenclature Chart 2
///
public enum ICNomenclature_TheColorist: Int, Identifiable, CaseIterable, ICNomenclature {
    
    public var id: Int { rawValue }
    
    public static let segmentCount: Int = 24
    
    public static let black = "Black"
    public static let white = "White"
    public static let gray = "Gray"
    
    case red
    case redOrange
    case orange
    case yellowOrange
    case yellow
    case lemonYellow
    case yellowGreen
    case saplingGreen
    case green
    case bluishGreen
    case turquoise
    case greenishCyan
    case cyanBlue
    case bluishCyan
    case blue
    case blueViolet
    case violet
    case purpleViolet
    case purple
    case purpleMagenta
    case magenta
    case crimson
    case scarlet
    case scarletRed
    
    public var name: String {
        switch self {
            case .red: return "Red"
            case .redOrange: return "Red orange"
            case .orange: return "Orange"
            case .yellowOrange: return "Yellow orange"
            case .yellow: return "Yellow"
            case .lemonYellow: return "Lemon, ripening"
            case .yellowGreen: return "Yellow green"
            case .saplingGreen: return "Green sapling"
            case .green: return "Green"
            case .bluishGreen: return "Greenish blue"
            case .turquoise: return "Turquoise"
            case .greenishCyan: return "Cyan green"
            case .cyanBlue: return "Cyan"
            case .bluishCyan: return "Bluish cyan"
            case .blue: return "Blue"
            case .blueViolet: return "Blue violet"
            case .violet: return "Violet"
            case .purpleViolet: return "Purple violet"
            case .purple: return "Purple"
            case .purpleMagenta: return "Purple magenta"
            case .magenta: return "Magenta"
            case .crimson: return "Crimson"
            case .scarlet: return "Scarlet"
            case .scarletRed: return "Scarlet red"
        }
    }
    
    public static func handleExceptions(_ input: HSV) -> String? {
        
        let purpleHue: ClosedRange<HueDegrees> = (0.79...0.87)
        let purpleValue: ClosedRange<ICColorChannel> = (0.4...0.6)
        
        if purpleHue.contains(input.hue01)
            && purpleValue.contains(input.value01) {
            return "Purple"
        }

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
