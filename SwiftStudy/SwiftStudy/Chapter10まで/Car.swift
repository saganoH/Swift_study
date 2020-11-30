//p210 クラスプロパティ
class Car {
    //クラスプロパティ
    static var count = 0
    
    //インスタンスプロパティ
    var isMoving = false
    
    //インスタンスメソッド
    func start() {
        Car.count += 1
        isMoving = true
    }
    
    func stop() {
        if Car.count > 0 {
            Car.count -= 1
            isMoving = false
        }
    }
}
