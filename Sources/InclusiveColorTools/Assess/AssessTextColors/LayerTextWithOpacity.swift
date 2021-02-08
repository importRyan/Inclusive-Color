import Foundation

internal func layer(foreground: sRGBColor,
                    onTopOf bg: sRGBColor,
                    with opacity: Float) -> sRGBColor {
    
    sRGBColor(getChannelAfterOpacity(opacity, foreground[0], bg[0]),
              getChannelAfterOpacity(opacity, foreground[1], bg[1]),
              getChannelAfterOpacity(opacity, foreground[2], bg[2]))
}

internal func getChannelAfterOpacity(_ opacity: Float,
                                     _ foreground: ICColorChannel,
                                     _ background: ICColorChannel) -> ICColorChannel {
    
    opacity * foreground + (1 - opacity) * background
}
