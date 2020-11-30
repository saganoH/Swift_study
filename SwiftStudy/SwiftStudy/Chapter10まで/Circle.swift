import Foundation

class Circle {
    //半径
    var radius: Double = 1.0
    //面積
    var area: Double {
        get {
            return radius * radius * Double.pi
        }
        set(menseki) {
            radius = sqrt(menseki / Double.pi)
        }
    }
}
