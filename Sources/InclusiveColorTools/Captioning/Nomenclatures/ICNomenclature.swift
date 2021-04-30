import Foundation

public protocol ICNomenclature {
    
    /// Color name
    var name: String { get }
    
    /// Number of colors represented. Segments are assigned equal degree arcs within the hue circle, starting with red *centered* at 0 degrees.
    static var segmentCount: Int { get }
    
    /// Name for black
    static var black: String { get }

    /// Name for white
    static var white: String { get }
    
    /// Name for gray
    static var gray: String { get }
    
    /// Represents the index of a segment
    var rawValue: Int { get }
    
    /// Handles color names that involve more than just a hue value (e.g., brown)
    static func handleExceptions(_ input: ICHSV) -> String?

    /// Initialize the requested segment, starting at segment 0 for red and ending at the position adjacent to red's anticlockwise side (e.g., -7.5 degrees in a 24 color nomenclature with 15 degree segments).
    /// - Parameter rawValue: Requested segment index
    ///
    init?(rawValue: Int)

}

extension ICNomenclature {
    
    /// Returns a string for the segment corresponding to the input hue (e.g., 359 degrees would likely correspond to "red").
    ///
    /// - Parameter hue01: Hue in decimal 0...1 format
    ///
    /// - Returns: String representing the hue
    ///
    public static func getLabel(_ color: ICHSV) -> String {
        
        guard !hueIsInRedOriginRange(color.hue01) else { return self.init(rawValue: 0)!.name }
        
        if let exceptionalName = handleExceptions(color) {
            return exceptionalName
        }
        
        let centeredHue = (color.hue01 - (stride / 2))
        let strides = (centeredHue / stride).rounded(.towardZero) + 1
        guard let label = self.init(rawValue: Int(strides))?.name
        else { return "Unknown hue" }
        
        return label
    }

    private static var stride: ICColorChannel {
        (360 / ICColorChannel(segmentCount)) / 360
    }
    
    private static func hueIsInRedOriginRange(_ hue01: HueDegrees) -> Bool {
        let upper = 0...(stride / 2).nextDown
        let lower = (1 - stride / 2)...1
        return upper.contains(hue01) || lower.contains(hue01)
    }
}
