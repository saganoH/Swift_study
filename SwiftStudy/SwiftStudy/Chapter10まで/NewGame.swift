//p227 プロトコルを採用するクラス
class NewGame: GameProtocol {
    private var total = 0
    
    //プロトコルに従って実装するプロパティ
    var gamePoint: Int {
        get {
            return total
        }
    }
    
    //プロトコルに従って実装するメソッド
    func hit() {
        total += 10
        print("ヒットしました。　+10")
    }
    
    func miss() {
        total /= 2
        print("ミスった！半減")
    }
}
