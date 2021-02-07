import Foundation

public enum ICPaletteUtilityTag {
    case qualitative
    case quantitative
    case divergingData
    case sequentialData
    
    public var name: String {
        switch self {
            case .sequentialData: return "Sequential Data"
            case .divergingData: return "Diverging Data"
            case .qualitative: return "Qualitative"
            case .quantitative: return "Quantitative"
        }
    }
    
    public var explanation: String {
        switch self {
            case .sequentialData: return "Ordered low to high"
            case .divergingData: return "Deviation from the midpoint is important. For clarity, use only one scheme per screen."
            case .qualitative: return "Nominal or categorical data, where magnitude differences are irrelevant. This includes lines in plots and text in presentations."
            case .quantitative: return ""
        }
    }
}
