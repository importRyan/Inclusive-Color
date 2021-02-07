import Foundation

public extension ICAssessment {
    
    /// An error during a contrast assessment typically results from an NSColor or UIColor object that lacks channel components.
    ///
    enum Error<C: ICAnyColor> {
        
        /// Some UI framework color objects only provide optional components. This may result in a failed conversion to a framework-internal sRGB representation needed for calculations.
        ///
        case failedConversions([C])
    }
}
