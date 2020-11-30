import Foundation

//p215 アクセス権
class Game {
    //他のクラスからアクセス不可
    fileprivate var point = 0.0
    //リードオンリー
    fileprivate(set) var level = 0
    
    //得点を加算する
    func addPoint(value: Double) {
        point += value
        level = Int(floor(point / 3))
    }
}
