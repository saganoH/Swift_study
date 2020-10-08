import UIKit

class WhileSample {
    //p89List while文
    func whileLoop() {
        var tickets = 5
        var power = 30
        while (tickets > 0) && (power < 100) {
            tickets -= 1
            power += 20
        }
        print("power \(power)、残チケット\(tickets)")
    }
    
    //p90List repeat-while文
    func repeatWhileLoop() {
        var a: UInt32, b: UInt32, c: UInt32
        var total: UInt32
        repeat {
            a = arc4random_uniform(13) + 1
            b = arc4random_uniform(13) + 1
            c = arc4random_uniform(13) + 1
            total = a + b + c
        } while (total != 21)
        print("\(a), \(b), \(c)")
    }
}
