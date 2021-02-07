import Foundation

public typealias ICColorPair = (left: ICSRGBA, right: ICSRGBA,
                              indexLeft: Int, indexRight: Int)

public enum ICColorPairingStrategy {
    
    /// For palettes to be used in design order only. Compares only adjacent colors in an input array.
    ///
    case sequential
    
    /// For palettes whose colors are mixed and matched. Compares all possible non-repetitive pairwise combinations.
    ///
    case allPairs
    
    public func getPairs(from srgba: [ICSRGBA]) -> [ICColorPair] {
        switch self {
            case .sequential: return getSequentialPairs(srgba)
            case .allPairs: return getCombos(in: srgba, k: 2)
        }
    }
}

fileprivate extension ICColorPairingStrategy {
    
    func getSequentialPairs(_ sequence: [ICSRGBA]) -> [ICColorPair] {
        
        var pairs: [ICColorPair] = []
        guard sequence.indices.contains(1) else { return pairs }
        
        for index in 1..<sequence.endIndex {
            let pair = (left: sequence[index - 1],
                        right: sequence[index],
                        indexLeft: index - 1,
                        indexRight: index)
            
            pairs.append(pair)
        }
        
        return pairs
    }
    
    /// Returns all combinations in array. When *k* is larger than the array size, it returns the original array as the only option.
    ///
    /// - Parameters:
    ///   - k: Number of elements in a combination
    ///   - repeats: False (default) excludes self-self repeating combinations'
    ///
    /// - Returns: An ordered array of combinations, starting from index 0 and working outward.
    ///
    
    func getCombos(in array: [ICSRGBA], k: Int, repeats: Bool = false) -> [ICColorPair] {
        guard !array.isEmpty else { return [] }
        
        var indexed: [(index: Int, color: ICSRGBA)] = []
        for i in 0..<array.endIndex {
            indexed.append((i, array[i]))
        }
        
        let combinations = (indexed.endIndex) > k
            ? combos(ArraySlice(indexed),
                     size: k,
                     repeats: repeats)
            : [indexed]
        
        return combinations.compactMap { combo in
            guard combo.endIndex == 2 else { return nil }
            return ICColorPair(left: combo[0].color,
                             right: combo[1].color,
                             indexLeft: combo[0].index,
                             indexRight: combo[1].index)
            
        }
    }
    
    func combos<T>(_ elements: ArraySlice<T>, size: Int, repeats: Bool) -> [[T]] {
        guard size > 0 else { return [[]] }
        guard let head = elements.first else { return [] }
        
        var subcombos =
            combos(repeats ? elements : elements.dropFirst(),
                   size: size - 1,
                   repeats: repeats)
            .map { [head] + $0 }
        
        subcombos.append(contentsOf: combos(elements.dropFirst(),
                                            size: size,
                                            repeats: repeats))
        return subcombos
    }
    
}
