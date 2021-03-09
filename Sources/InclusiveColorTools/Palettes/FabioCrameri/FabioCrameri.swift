import Foundation

public extension ICPalettes {
    
    /// Suite of scientific, color-vision deficiency friendly and perceptually uniform color maps
    ///
    /// Scientific color maps v 7.0 release date 2021 February 2. [Zenodo archive](https://zenodo.org/record/4491293#.YCv6ai1h1zU)
    ///
    struct FabioCrameri {
        
        public struct Sequential {}
        public struct Diverging {}
        public struct Multisequential {}
        public struct Cyclic {}
        
        internal static var author: String = { "Fabio Crameri" }()
        internal static let link: URL = { URL(string: "http://www.fabiocrameri.ch/colourmaps.php")! }()
        internal static var license: String = { "MIT License" }()
        internal static var licenseCopy: String = { """
Copyright (c) 2021, Fabio Crameri

Permission is hereby granted, free of charge, to any person ob- taining a copy of this software and associated documentation files (the ”Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ”AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"""
        }()
        
        internal static var sharedDescription: String = { "Fabio's scientific color maps are perceptually uniform to portray linear data without visual distortions, which are common for rainbow-based schemes. His maps work well in black and white presentation. For continuous plots or finer interpolations, use Fabio's python repo." }()
    }
}

