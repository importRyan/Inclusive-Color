import Foundation

internal func colorImportFailure(_ line: Int = #line) {
    NSLog("\(line) Inclusive Color could not extract an input color's components. Textured colors are not supported. If you see this message for a non-textured color, please kindle report at github.com/importRyan/InclusiveColor. Thanks.")
}
