import Foundation
import InclusiveColor

extension ICTestCases.RealWorld.Figma {
    
    static let cases = [gray1, gray2, gray3, gray4, gray5, gray6, red, orange, yellow, green1, green2, green3, blue1, blue2, blue3, purple1, purple2]

    static let gray1 = ICNativeAnyColor(red: 0.200000, green: 0.200000, blue: 0.200000, alpha: 1)
    static let gray2 = ICNativeAnyColor(red: 0.313726, green: 0.313726, blue: 0.313726, alpha: 1)
    static let gray3 = ICNativeAnyColor(red: 0.509804, green: 0.509804, blue: 0.509804, alpha: 1)
    static let gray4 = ICNativeAnyColor(red: 0.741176, green: 0.741176, blue: 0.741176, alpha: 1)
    static let gray5 = ICNativeAnyColor(red: 0.878431, green: 0.878431, blue: 0.878431, alpha: 1)
    static let gray6 = ICNativeAnyColor(red: 0.949020, green: 0.949020, blue: 0.949020, alpha: 1)

    static let red = ICNativeAnyColor(red: 0.921569, green: 0.341176, blue: 0.341176, alpha: 1)
    static let orange = ICNativeAnyColor(red: 0.949020, green: 0.600000, blue: 0.290196, alpha: 1)
    static let yellow = ICNativeAnyColor(red: 0.949020, green: 0.788235, blue: 0.298039, alpha: 1)

    static let green1 = ICNativeAnyColor(red: 0.125490, green: 0.588235, blue: 0.329412, alpha: 1)
    static let green2 = ICNativeAnyColor(red: 0.152941, green: 0.682353, blue: 0.376471, alpha: 1)
    static let green3 = ICNativeAnyColor(red: 0.435294, green: 0.811765, blue: 0.596078, alpha: 1)

    static let blue1 = ICNativeAnyColor(red: 0.184314, green: 0.501961, blue: 0.929412, alpha: 1)
    static let blue2 = ICNativeAnyColor(red: 0.176471, green: 0.615686, blue: 0.858824, alpha: 1)
    static let blue3 = ICNativeAnyColor(red: 0.333333, green: 0.800000, blue: 0.949020, alpha: 1)
    
    static let purple1 = ICNativeAnyColor(red: 0.607843, green: 0.317647, blue: 0.878431, alpha: 1)
    static let purple2 = ICNativeAnyColor(red: 0.733333, green: 0.419608, blue: 0.850980, alpha: 1)
    
    static let expectedPassingIndexPairs: [Set<Int>] = [[0, 2],
                                                        [0, 3],
                                                        [0, 4],
                                                        [0, 5],
                                                        [0, 7],
                                                        [0, 8],
                                                        [0, 10],
                                                        [0, 11],
                                                        [0, 13],
                                                        [0, 14],
                                                        [0, 16],
                                                        [1, 3],
                                                        [1, 4],
                                                        [1, 5],
                                                        [1, 8],
                                                        [1, 11],
                                                        [1, 14],
                                                        [2, 5],
                                                        [4, 15],
                                                        [5, 9],
                                                        [5, 12],
                                                        [5, 15],
                                                        [5, 16]]
}
