import Foundation

public extension ICPalettes {
    
    /// Colors by Cynthia A. Brewer and Mark Harrower, Pennsylvania State University [Website](http://www.ColorBrewer.org)
    ///
    struct BrewerHarrower {
        
        public struct Sequential {}
        public struct Diverging {}
        
        internal static var author: String = { "Cynthia Brewer and Mark Harrower" }()
        internal static var link: URL = { URL(string: "http://www.ColorBrewer.org")! }()
        internal static var description: String = { "Pennsylvania State University professor of geography Cynthia Brewer developed many palettes for cartography. Map designs require colors to be differentiable when not sequentially ordered and in complex patterns. Her color schemes were screened for colorblind readers by Steve Gardner in his masters thesis." }()
        internal static var license: String = { "Apache V2" }()
        internal static var licenseCopy: String = { """
Apache-Style Software License for ColorBrewer software and ColorBrewer Color Schemes

Copyright (c) 2002 Cynthia Brewer, Mark Harrower, and The Pennsylvania State University.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.

Permission is hereby granted, free of charge, to any person ob- taining a copy of this software and associated documentation files (the ”Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ”AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
""" + LicensesForAccessiblePalettes.apache2
        }()
    }
}

