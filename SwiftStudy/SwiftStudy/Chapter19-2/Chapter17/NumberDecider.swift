class NumberDecider {
    
    func makeRandomNum() -> Double {
        let randomDouble = Double.random(in: 0.0...100.0)
        return randomDouble
    }
    
    func decideAngle(percent: Double) -> Double {
        let endAngle = (2 * Double.pi * percent/100) - (Double.pi/2)
        return endAngle
    }
}
