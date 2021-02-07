import Foundation
import InclusiveColor
import SwiftUI


extension ICTestCases {
    
    enum SystemColors: Identifiable, CaseIterable {
        case swiftUIFixed
        #if canImport(UIKit)
        case uiFixed
        #endif
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        case nsSystem
        case nsFixed
        case nsBackgrounds
        case nsText
        case nsLabels
        case nsElements
        #endif
        
        var id: String { sectionHeader }
        
        var sectionHeader: String {
            switch self {
                case .swiftUIFixed: return SwiftUIFixed.sectionLabel
                #if canImport(UIKit)
                case .uiFixed: return UIColorFixed.sectionLabel
                #endif
                #if canImport(AppKit) && !targetEnvironment(macCatalyst)
                case .nsSystem: return NSColorSystem.sectionLabel
                case .nsFixed: return NSColorFixed.sectionLabel
                case .nsBackgrounds: return NSColorUIElementBackgrounds.sectionLabel
                case .nsText: return NSColorUIElementText.sectionLabel
                case .nsLabels: return NSColorUIElementLabels.sectionLabel
                case .nsElements: return NSColorUIElements.sectionLabel
                #endif
            }
        }
        
        @available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
        var allInfo: [(Color,String)] {
            zip(allColors, allLabels)
                .map { ($0.0, $0.1) }
        }
        
        @available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
        var allColors: [Color] {
            switch self {
                case .swiftUIFixed: return SwiftUIFixed.allCases.map { $0.color }
                #if canImport(UIKit)
                case .uiFixed: return UIColorFixed.allCases.map { $0.color }
                #endif
                #if canImport(AppKit) && !targetEnvironment(macCatalyst)
                case .nsSystem: return NSColorSystem.allCases.map { $0.color }
                case .nsFixed: return NSColorFixed.allCases.map { $0.color }
                case .nsBackgrounds: return NSColorUIElementBackgrounds.allCases.map { $0.color }
                case .nsText: return NSColorUIElementText.allCases.map { $0.color }
                case .nsLabels: return NSColorUIElementLabels.allCases.map { $0.color }
                case .nsElements: return NSColorUIElements.allCases.map { $0.color }
                #endif
            }
        }
        
        var allLabels: [String] {
            switch self {
                case .swiftUIFixed: return SwiftUIFixed.allCases.map { $0.label }
                #if canImport(UIKit)
                case .uiFixed: return UIColorFixed.allCases.map { $0.label }
                #endif
                #if canImport(AppKit) && !targetEnvironment(macCatalyst)
                case .nsSystem: return NSColorSystem.allCases.map { $0.label }
                case .nsFixed: return NSColorFixed.allCases.map { $0.label }
                case .nsBackgrounds: return NSColorUIElementBackgrounds.allCases.map { $0.label }
                case .nsText: return NSColorUIElementText.allCases.map { $0.label }
                case .nsLabels: return NSColorUIElementLabels.allCases.map { $0.label }
                case .nsElements: return NSColorUIElements.allCases.map { $0.label }
                #endif
            }
        }
        
        enum SwiftUIFixed: Identifiable, CaseIterable {
            case ColorBlue
            case ColorGreen
            case ColorOrange
            case ColorPink
            case ColorPurple
            case ColorRed
            case ColorYellow
            case ColorWhite
            case ColorGray
            case ColorBlack
            case ColorPrimary
            case ColorSecondary
            
            var id: String { label }
            
            static let sectionLabel = "SwiftUI Color Fixed"
            
            @available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
            var color: Color {
                switch self {
                    
                    case .ColorBlue: return Color.blue
                    case .ColorGreen: return Color.green
                    case .ColorOrange: return Color.orange
                    case .ColorPink: return Color.pink
                    case .ColorPurple: return Color.purple
                    case .ColorRed: return Color.red
                    case .ColorYellow: return Color.yellow
                    case .ColorWhite: return Color.white
                    case .ColorGray: return Color.gray
                    case .ColorBlack: return Color.black
                    case .ColorPrimary: return Color.primary
                    case .ColorSecondary: return Color.secondary
                }
            }
            
            var label: String {
                switch self {
                    case .ColorBlue: return ".blue"
                    case .ColorGreen: return ".green"
                    case .ColorOrange: return ".orange"
                    case .ColorPink: return ".pink"
                    case .ColorPurple: return ".purple"
                    case .ColorRed: return ".red"
                    case .ColorYellow: return ".yellow"
                    case .ColorWhite: return ".white"
                    case .ColorGray: return ".gray"
                    case .ColorBlack: return ".black"
                    case .ColorPrimary: return ".primary"
                    case .ColorSecondary: return ".secondary"
                }
            }
        }
        
        enum NSColorSystem: Identifiable, CaseIterable {
            case NSColorSystemBlue
            #if canImport(AppKit) && !targetEnvironment(macCatalyst)
            case NSColorSystemBrown
            #endif
            case NSColorSystemGray
            case NSColorSystemGreen
            case NSColorSystemIndigo
            case NSColorSystemOrange
            case NSColorSystemPink
            case NSColorSystemPurple
            case NSColorSystemRed
            case NSColorSystemTeal
            case NSColorSystemYellow
            
            var id: String { label }
            
            static let sectionLabel = "NSColor System Adaptive"
            
            @available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
            var color: Color {
                switch self {
                    
                    case .NSColorSystemBlue: return Color(.systemBlue)
                    #if canImport(AppKit) && !targetEnvironment(macCatalyst)
                    case .NSColorSystemBrown: return Color(.systemBrown)
                    #endif
                    case .NSColorSystemGray: return Color(.systemGray)
                    case .NSColorSystemGreen: return Color(.systemGreen)
                    case .NSColorSystemIndigo: return Color(.systemIndigo)
                    case .NSColorSystemOrange: return Color(.systemOrange)
                    case .NSColorSystemPink: return Color(.systemPink)
                    case .NSColorSystemPurple: return Color(.systemPurple)
                    case .NSColorSystemRed: return Color(.systemRed)
                    case .NSColorSystemTeal: return Color(.systemTeal)
                    case .NSColorSystemYellow: return Color(.systemYellow)
                }
            }
            
            var label: String {
                switch self {
         
                    case .NSColorSystemBlue: return ".systemBlue"
                    #if canImport(AppKit) && !targetEnvironment(macCatalyst)
                    case .NSColorSystemBrown: return ".systemBrown"
                    #endif
                    case .NSColorSystemGray: return ".systemGray"
                    case .NSColorSystemGreen: return ".systemGreen"
                    case .NSColorSystemIndigo: return ".systemIndigo"
                    case .NSColorSystemOrange: return ".systemOrange"
                    case .NSColorSystemPink: return ".systemPink"
                    case .NSColorSystemPurple: return ".systemPurple"
                    case .NSColorSystemRed: return ".systemRed"
                    case .NSColorSystemTeal: return ".systemTeal"
                    case .NSColorSystemYellow: return ".systemYellow"
                }
            }
        }
        
        enum UIColorFixed: Identifiable, CaseIterable {
            case UIColorFixedBlack
            case UIColorFixedBlue
            case UIColorFixedBrown
            case UIColorFixedCyan
            case UIColorFixedDarkGray
            case UIColorFixedGray
            case UIColorFixedGreen
            case UIColorFixedLightGray
            case UIColorFixedMagenta
            case UIColorFixedOrange
            case UIColorFixedPurple
            case UIColorFixedRed
            case UIColorFixedWhite
            case UIColorFixedYellow
            
            var id: String { label }
            
            static let sectionLabel = "NSColor Fixed"
            
            #if canImport(UIKit)
            @available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
            var color: Color {
                switch self {
                    case .UIColorFixedBlack: return Color(UIColor.black)
                    case .UIColorFixedBlue: return Color(UIColor.blue)
                    case .UIColorFixedBrown: return Color(UIColor.brown)
                    case .UIColorFixedCyan: return Color(UIColor.cyan)
                    case .UIColorFixedDarkGray: return Color(UIColor.darkGray)
                    case .UIColorFixedGray: return Color(UIColor.gray)
                    case .UIColorFixedGreen: return Color(UIColor.green)
                    case .UIColorFixedLightGray: return Color(UIColor.lightGray)
                    case .UIColorFixedMagenta: return Color(UIColor.magenta)
                    case .UIColorFixedOrange: return Color(UIColor.orange)
                    case .UIColorFixedPurple: return Color(UIColor.purple)
                    case .UIColorFixedRed: return Color(UIColor.red)
                    case .UIColorFixedWhite: return Color(UIColor.white)
                    case .UIColorFixedYellow: return Color(UIColor.yellow)
                }
            }
            #endif
            
            var label: String {
                switch self {
                    case .UIColorFixedBlack: return ".black"
                    case .UIColorFixedBlue: return ".blue"
                    case .UIColorFixedBrown: return ".brown"
                    case .UIColorFixedCyan: return ".cyan"
                    case .UIColorFixedDarkGray: return ".darkGray"
                    case .UIColorFixedGray: return ".gray"
                    case .UIColorFixedGreen: return ".green"
                    case .UIColorFixedLightGray: return ".lightGray"
                    case .UIColorFixedMagenta: return ".magenta"
                    case .UIColorFixedOrange: return ".orange"
                    case .UIColorFixedPurple: return ".purple"
                    case .UIColorFixedRed: return ".red"
                    case .UIColorFixedWhite: return ".white"
                    case .UIColorFixedYellow: return ".yellow"
                     
                }
            }
            
            
        }
        
        enum NSColorFixed: Identifiable, CaseIterable {
            case NSColorFixedBlack
            case NSColorFixedBlue
            case NSColorFixedBrown
            case NSColorFixedCyan
            case NSColorFixedDarkGray
            case NSColorFixedGray
            case NSColorFixedGreen
            case NSColorFixedLightGray
            case NSColorFixedMagenta
            case NSColorFixedOrange
            case NSColorFixedPurple
            case NSColorFixedRed
            case NSColorFixedWhite
            case NSColorFixedYellow
            
            var id: String { label }
            
            static let sectionLabel = "NSColor Fixed"
            
            #if canImport(AppKit) && !targetEnvironment(macCatalyst)
            @available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
            var color: Color {
                switch self {
                    case .NSColorFixedBlack: return Color(NSColor.black)
                    case .NSColorFixedBlue: return Color(NSColor.blue)
                    case .NSColorFixedBrown: return Color(NSColor.brown)
                    case .NSColorFixedCyan: return Color(NSColor.cyan)
                    case .NSColorFixedDarkGray: return Color(NSColor.darkGray)
                    case .NSColorFixedGray: return Color(NSColor.gray)
                    case .NSColorFixedGreen: return Color(NSColor.green)
                    case .NSColorFixedLightGray: return Color(NSColor.lightGray)
                    case .NSColorFixedMagenta: return Color(NSColor.magenta)
                    case .NSColorFixedOrange: return Color(NSColor.orange)
                    case .NSColorFixedPurple: return Color(NSColor.purple)
                    case .NSColorFixedRed: return Color(NSColor.red)
                    case .NSColorFixedWhite: return Color(NSColor.white)
                    case .NSColorFixedYellow: return Color(NSColor.yellow)
                }
            }
            #endif
            
            var label: String {
                switch self {
                    case .NSColorFixedBlack: return ".black"
                    case .NSColorFixedBlue: return ".blue"
                    case .NSColorFixedBrown: return ".brown"
                    case .NSColorFixedCyan: return ".cyan"
                    case .NSColorFixedDarkGray: return ".darkGray"
                    case .NSColorFixedGray: return ".gray"
                    case .NSColorFixedGreen: return ".green"
                    case .NSColorFixedLightGray: return ".lightGray"
                    case .NSColorFixedMagenta: return ".magenta"
                    case .NSColorFixedOrange: return ".orange"
                    case .NSColorFixedPurple: return ".purple"
                    case .NSColorFixedRed: return ".red"
                    case .NSColorFixedWhite: return ".white"
                    case .NSColorFixedYellow: return ".yellow"
                     
                }
            }
        }
        
        enum NSColorUIElementBackgrounds: Identifiable, CaseIterable {
            case NSColorUIElementBackgroundAlternatingContent0
            case NSColorUIElementBackgroundAlternatingContent1
            case NSColorUIElementBackgroundControl
            case NSColorUIElementBackgroundSelectedContent
            case NSColorUIElementBackgroundText
            case NSColorUIElementBackgroundTextSelected
            case NSColorUIElementBackgroundTextUnemphasizedSelected
            case NSColorUIElementBackgroundUnderPage
            case NSColorUIElementBackgroundUnemphasizedSelectedContent
            case NSColorUIElementBackgroundWindow
            
            var id: String { label }
            
            static let sectionLabel = "NSColor Backgrounds"
            
            #if canImport(AppKit) && !targetEnvironment(macCatalyst)
            @available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
            var color: Color {
                switch self {
                    
                    case .NSColorUIElementBackgroundAlternatingContent0: return Color(NSColor.alternatingContentBackgroundColors[0])
                    case .NSColorUIElementBackgroundAlternatingContent1: return Color(NSColor.alternatingContentBackgroundColors[1])
                    case .NSColorUIElementBackgroundControl: return Color(NSColor.controlBackgroundColor)
                    case .NSColorUIElementBackgroundSelectedContent: return Color(NSColor.selectedContentBackgroundColor)
                    case .NSColorUIElementBackgroundText: return Color(NSColor.textBackgroundColor)
                    case .NSColorUIElementBackgroundTextSelected: return Color(NSColor.selectedTextBackgroundColor)
                    case .NSColorUIElementBackgroundTextUnemphasizedSelected: return Color(NSColor.unemphasizedSelectedTextBackgroundColor)
                    case .NSColorUIElementBackgroundUnderPage: return Color(NSColor.underPageBackgroundColor)
                    case .NSColorUIElementBackgroundUnemphasizedSelectedContent: return Color(NSColor.unemphasizedSelectedContentBackgroundColor)
                    case .NSColorUIElementBackgroundWindow: return Color(NSColor.windowBackgroundColor)
                    
                }
            }
            #endif
            
            var label: String {
                switch self {
         
                        
                    case .NSColorUIElementBackgroundAlternatingContent0: return ".alternatingContentBackgroundColors[0]"
                    case .NSColorUIElementBackgroundAlternatingContent1: return ".alternatingContentBackgroundColors[1]"
                    case .NSColorUIElementBackgroundControl: return ".controlBackgroundColor"
                    case .NSColorUIElementBackgroundSelectedContent: return ".selectedContentBackgroundColor"
                    case .NSColorUIElementBackgroundText: return ".textBackgroundColor"
                    case .NSColorUIElementBackgroundTextSelected: return ".selectedTextBackgroundColor"
                    case .NSColorUIElementBackgroundTextUnemphasizedSelected: return ".unemphasizedSelectedTextBackgroundColor"
                    case .NSColorUIElementBackgroundUnderPage: return ".underPageBackgroundColor"
                    case .NSColorUIElementBackgroundUnemphasizedSelectedContent: return ".unemphasizedSelectedContentBackgroundColor"
                    case .NSColorUIElementBackgroundWindow: return ".windowBackgroundColor"
                    
                }
            }
        }
        
        enum NSColorUIElementText: Identifiable, CaseIterable {
            case NSColorUIElementText
            case NSColorUIElementTextControl
            case NSColorUIElementTextControlDisabled
            case NSColorUIElementTextControlSelected
            case NSColorUIElementTextControlSelectedAlternate
            case NSColorUIElementTextHeader
            case NSColorUIElementTextPlaceholder
            case NSColorUIElementTextSelected
            case NSColorUIElementTextSelectedMenuItem
            case NSColorUIElementTextUnemphasizedSelected
            case NSColorUIElementTextWindowFrame
            
            var id: String { label }
            
            static let sectionLabel = "NSColor Text"
            
            #if canImport(AppKit) && !targetEnvironment(macCatalyst)
            @available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
            var color: Color {
                switch self {
                    
                    case .NSColorUIElementText: return Color(NSColor.textColor)
                    case .NSColorUIElementTextControl: return Color(NSColor.controlTextColor)
                    case .NSColorUIElementTextControlDisabled: return Color(NSColor.disabledControlTextColor)
                    case .NSColorUIElementTextControlSelected: return Color(NSColor.selectedControlTextColor)
                    case .NSColorUIElementTextControlSelectedAlternate: return Color(NSColor.alternateSelectedControlTextColor)
                    case .NSColorUIElementTextHeader: return Color(NSColor.headerTextColor)
                    case .NSColorUIElementTextPlaceholder: return Color(NSColor.placeholderTextColor)
                    case .NSColorUIElementTextSelected: return Color(NSColor.selectedTextColor)
                    case .NSColorUIElementTextSelectedMenuItem: return Color(NSColor.selectedMenuItemTextColor)
                    case .NSColorUIElementTextUnemphasizedSelected: return Color(NSColor.unemphasizedSelectedTextColor)
                    case .NSColorUIElementTextWindowFrame: return Color(NSColor.windowFrameTextColor)
                    
                }
            }
            #endif
            
            var label: String {
                switch self {
      
                    case .NSColorUIElementText: return ".textColor"
                    case .NSColorUIElementTextControl: return ".controlTextColor"
                    case .NSColorUIElementTextControlDisabled: return ".disabledControlTextColor"
                    case .NSColorUIElementTextControlSelected: return ".selectedControlTextColor"
                    case .NSColorUIElementTextControlSelectedAlternate: return ".alternateSelectedControlTextColor"
                    case .NSColorUIElementTextHeader: return ".headerTextColor"
                    case .NSColorUIElementTextPlaceholder: return ".placeholderTextColor"
                    case .NSColorUIElementTextSelected: return ".selectedTextColor"
                    case .NSColorUIElementTextSelectedMenuItem: return ".selectedMenuItemTextColor"
                    case .NSColorUIElementTextUnemphasizedSelected: return ".unemphasizedSelectedTextColor"
                    case .NSColorUIElementTextWindowFrame: return ".windowFrameTextColor"
                    
                }
            }
        }
        
        enum NSColorUIElementLabels: Identifiable, CaseIterable {
            case NSColorUIElementLabel
            case NSColorUIElementLabelSecondary
            case NSColorUIElementLabelTertiary
            case NSColorUIElementLabelQuaternary
            
            var id: String { label }
            
            static let sectionLabel = "NSColor Labels"
            
            #if canImport(AppKit) && !targetEnvironment(macCatalyst)
            @available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
            var color: Color {
                switch self {
                    case .NSColorUIElementLabel: return Color(NSColor.labelColor)
                    case .NSColorUIElementLabelSecondary: return Color(NSColor.secondaryLabelColor)
                    case .NSColorUIElementLabelTertiary: return Color(NSColor.tertiaryLabelColor)
                    case .NSColorUIElementLabelQuaternary: return Color(NSColor.quaternaryLabelColor)
                }
            }
            #endif
            
            var label: String {
                switch self {
         
                    case .NSColorUIElementLabel: return ".labelColor"
                    case .NSColorUIElementLabelSecondary: return ".secondaryLabelColor"
                    case .NSColorUIElementLabelTertiary: return ".tertiaryLabelColor"
                    case .NSColorUIElementLabelQuaternary: return ".quaternaryLabelColor"
                }
            }
        }
        
        enum NSColorUIElements: Identifiable, CaseIterable {
            case NSColorUIElementControl
            case NSColorUIElementControlSelected
            case NSColorUIElementLink
            case NSColorUIElementGrid
            case NSColorUIElementKeyboardFocusIndicator
            case NSColorUIElementHighlightFind
            case NSColorUIElementHighlight
            case NSColorUIElementSeparator
            case NSColorUIElementShadow
            
            var id: String { label }
            
            static let sectionLabel = "NSColor UI Elements"
            
            #if canImport(AppKit) && !targetEnvironment(macCatalyst)
            @available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
            var color: Color {
                switch self {
                    
                    case .NSColorUIElementControl: return Color(NSColor.controlColor)
                    case .NSColorUIElementControlSelected: return Color(NSColor.selectedControlColor)
                    
                    case .NSColorUIElementLink: return Color(NSColor.linkColor)
                    case .NSColorUIElementGrid: return Color(NSColor.gridColor)
                    case .NSColorUIElementKeyboardFocusIndicator: return Color(NSColor.keyboardFocusIndicatorColor)
                    case .NSColorUIElementHighlightFind: return Color(NSColor.findHighlightColor)
                    case .NSColorUIElementHighlight: return Color(NSColor.highlightColor)
                    case .NSColorUIElementSeparator: return Color(NSColor.separatorColor)
                    case .NSColorUIElementShadow: return Color(NSColor.shadowColor)
                }
            }
            #endif
            
            var label: String {
                switch self {
                    case .NSColorUIElementControl: return ".controlColor"
                    case .NSColorUIElementControlSelected: return ".selectedControlColor"
                    
                    case .NSColorUIElementLink: return ".linkColor"
                    case .NSColorUIElementGrid: return ".gridColor"
                    case .NSColorUIElementKeyboardFocusIndicator: return ".keyboardFocusIndicatorColor"
                    case .NSColorUIElementHighlightFind: return ".findHighlightColor"
                    case .NSColorUIElementHighlight: return ".highlightColor"
                    case .NSColorUIElementSeparator: return ".separatorColor"
                    case .NSColorUIElementShadow: return ".shadowColor"
                }
            }
        }
    }

}
