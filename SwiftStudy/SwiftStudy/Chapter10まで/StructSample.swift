class StructSample {
    //p247 構造体の値の参照と変更
    func makeColorBox() {
        var redBox = ColorBox(width: 100, height: 100, color: "red")
        print("幅\(redBox.width)、高さ\(redBox.height)、色\(redBox.color)")
        
        //値の変更
        redBox.width = 90
        redBox.color = "blue"
        print("幅\(redBox.width)、高さ\(redBox.height)、色\(redBox.color)")
    }
    
    //p250 イニシャライザがある構造体
    func makeBox() {
        let box1 = Box(width: 120, height: 80)
        let box2 = Box(width: 150, height: 120)
        print(box1.size)
        print(box2.size)
    }
    
    //p251 メソッドがある構造体
    func makeGoods() {
        let myGoods = Goods(tanka: 700, kosu: 4)
        //１個１０円引に設定
        let sellingPrice = myGoods.sellPrice(nebiki: 10)
        print("１個\(myGoods.tanka)円、\(myGoods.kosu)個入り、定価\(myGoods.price)円")
        print("販売価格\(sellingPrice)円")
    }
    
    //p252 構造体自身のプロパティを変更する
    func moveLine() {
        let point1 = Point(x: 100, y: 100)
        let point2 = Point(x: 300, y: 200)
        
        var theLine = Line(p1: point1, p2: point2)
        
        print("移動前のp1 \(theLine.p1)")
        print("移動前のp2 \(theLine.p2)")
        print("------------")
        
        //並行移動
        theLine.move(h: 50, v: 60)
        
        print("移動後のp1 \(theLine.p1)")
        print("移動後のp2 \(theLine.p2)")
    }
    
    //p253 サブスクリプトを定義した構造体
    func stockCheck() {
        var shoes = Stock(name: "Tiger")
        shoes["green", 24.5] = 3
        shoes["green", 25.0] = 5
        
        //在庫を更新
        shoes["green", 24.5] -= 2
        shoes["green", 25.0] += 1
        shoes["red", 26.0] = 5
        
        print(shoes.name)
        print(shoes["green", 24.5])
        print(shoes["green", 25.0])
        print(shoes["red", 26.0])
        //データがないものは0になる
        print(shoes["red", 25.5])
        print(shoes["yellow", 25.0])
    }
    
    //p255 プロトコルを採用した構造体
    func makeMonster() {
        var monster1 = Bokemon(monsterName: "ピカチュウ", hp: 200)
        print(monster1.monsterName)
        print("HPポイント \(monster1.hp)")
        print("進化!")
        monster1.updateHP(pt: 30)
        print("HPポイント \(monster1.hp)")
    }
}

struct ColorBox {
    var width: Int
    var height: Int
    var color: String
}

struct Box {
    let width: Int
    let height: Int
    let size: String
    
    //イニシャライザ
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        //sizeを設定
        if (width + height) < 250 {
            size = "M"
        } else {
            size = "L"
        }
    }
}

struct Goods {
    let tanka: Int
    let kosu: Int
    //定価
    var price: Int {
        return tanka * kosu
    }
    
    //売値
    func sellPrice(nebiki: Int = 0) -> Int {
        //値引きする
        return price - nebiki * kosu
    }
}

struct Point {
    var x: Double
    var y: Double
}

struct Line {
    //両端の座標
    var p1: Point
    var p2: Point
    
    //両端を動かして線を平行移動する
    mutating func move(h: Double, v: Double) {
        p1.x += h
        p1.y += v
        p2.x += h
        p2.y += v
    }
}

struct Stock {
    var name: String
    var data: [String: Int] = [:]
    
    //イニシャライザ
    init(name: String) {
        self.name = name
    }
    
    //サブスクリプト
    subscript(color: String, size: Double) -> Int {
        //値の取り出し
        get {
            let key = color + String(size)
            if let value = data[key] {
                return value
            } else {
                return 0
            }
        }
        
        //値の設定
        set {
            let key = color + String(size)
            data[key] = newValue //新しい値を設定
        }
    }
}

protocol Monster {
    var monsterName: String { get }
    var hp: Int { get set }
    mutating func updateHP(pt: Int)
}

struct Bokemon: Monster {
    private(set) var monsterName: String
    var hp: Int
    mutating func updateHP(pt: Int) {
        hp += pt
    }
}
