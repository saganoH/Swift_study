//p200 イニシャライザ
class ClassSample {
    let msg: String
    let name: String?
    
    init (msg: String, name: String) {
        self.msg = msg
        self.name = name
    }
    
    convenience init (msg: String = "ハロー") {
        self.init(msg: msg, name: "匿名")
    }
    
    func hello() {
        var helloMsg: String
        if let user = name {
            helloMsg = user + "さん。" + msg
        } else {
            helloMsg = msg
        }
        print(helloMsg)
    }
}
