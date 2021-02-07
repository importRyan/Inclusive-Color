import Foundation

extension ICVisionSimulator_Machado: ICVisionSimulator {
    
    // MARK: - Methods for a Single Color Input
    
    public func simulate(_ color: ICSRGBA,
                  _ visionType: ICColorVisionType) -> ICSRGBA {
        
        ICSRGBA(srgb: render(color.rgb, for: visionType).clamped01(),
              color.a)
    }
    
    public func simulate(_ color: ICSRGBA) -> [ICColorVisionType : ICSRGBA] {
        
        var simulations: [ICColorVisionType : ICSRGBA] = [.typicalTrichromacy : color]
        
        ICColorVisionType.allCases.forEach { vision in
            guard vision != .typicalTrichromacy else { return }
            let simulated = render(color.rgb, for: vision).clamped01()
            let srgba = ICSRGBA(srgb: simulated, color.a)
            simulations.updateValue(srgba, forKey: vision)
        }
        
        return simulations
    }
    
    public func simulate(_ color: ICSRGBA,
                  _ inclusivity: ICVisionInclusivity) -> [ICColorVisionType : ICSRGBA] {
        
        var simulations: [ICColorVisionType : ICSRGBA] = [.typicalTrichromacy : color]
        
        inclusivity.visionTypes.forEach { vision in
            guard vision != .typicalTrichromacy else { return }
            let simulated = render(color.rgb, for: vision).clamped01()
            let srgba = ICSRGBA(srgb: simulated, color.a)
            simulations.updateValue(srgba, forKey: vision)
        }
        
        return simulations
    }

    // MARK: - Methods for Color Array Input
    
    public func simulate(_ colors: [ICSRGBA],
                  _ visionType: ICColorVisionType) -> [ICSRGBA] {
        
        colors.map { simulate($0, visionType) }
    }
    
    public func simulate(_ colors: [ICSRGBA]) -> [ICColorVisionType : [ICSRGBA]] {
        
        var simulations: [ICColorVisionType : [ICSRGBA]] = [.typicalTrichromacy : colors]
        
        ICColorVisionType.allCases.forEach { vision in
            guard vision != .typicalTrichromacy else { return }
            let simulation = simulate(colors, vision)
            simulations.updateValue(simulation, forKey: vision)
        }
        
        return simulations
    }
    
    public func simulate(_ colors: [ICSRGBA],
                  _ inclusivity: ICVisionInclusivity) -> [ICColorVisionType : [ICSRGBA]] {
        
        var simulations: [ICColorVisionType : [ICSRGBA]] = [.typicalTrichromacy : colors]
        
        inclusivity.visionTypes.forEach { vision in
            guard vision != .typicalTrichromacy else { return }
            let simulation = simulate(colors, vision)
            simulations.updateValue(simulation, forKey: vision)
        }
        
        return simulations
    }
    
}
