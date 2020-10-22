class OptionalSample {
    //p176 オプショナルバリュー
    func lastNumError() {
        let nums = [3, 4, 6]
        let lastNum = nums.last
        //let ans = lastNum *2 と書きたいが、オプショナルバリューのためエラーになる
        let ans = lastNum! * 2
        print(ans)
    }
    
    //p176 nilエラー
    func nilError() {
        var num: Int
        num = 5
        //num = nil エラーになる
        print(num)
        
        var num2: Int? //オプショナルバリューであると明示
        num2 = 5
        //print(num2) エラーは消えるが、オプショナル型にラップされている
        print(num2!) //アンラップ
    }
    
    //p180 オプショナルバリューの初期値
    func optionalDefault() {
        var count: Int?
        var price: Int
        
        price = 250 * (count ?? 2) //countがnilの場合、2で計算される
        print("\(price)円です。")
        
        count = 3
        price = 250 * (count ?? 2)
        print("\(price)円です。")
        
        let nameArray: [String] = []
        let userName: String = nameArray.first ?? "名無し"
        print(userName)
    }
    
    //p181 オプショナルバインディング
    func optionalBinding() {
        var str: String?
        str = "Swift"
        if let msg = str {
            //strがnilではないとき、msgに代入されて実行される
            print(msg + "ワールド")
        } else {
            //strがnilの時
            print("ハローワールド")
        }
    }
    
    //p182 forIn×オプショナルバインディング
    func optionalBindingForin() {
        var sum = 0
        let dic: [String: Int?] = ["a": 23, "b": nil, "c": 10, "d": nil]
        for (_, value) in dic {
            if let num = value {
                sum += num
            }
        }
        print("数値の合計は\(sum)")
    }
    
    //p182 while×オプショナルバインディング
    func optionalBindingWhile() {
        let str: String? = "★☆"
        var repeatString: String = ""
        var i = 0
        while let stamp = str {
            repeatString += stamp
            i += 1
            if i >= 10 {
                break
            }
        }
        print(repeatString)
    }
    
    //p183 guard文×オプショナルバインディング
    func optionalBindingGuard(_ who: String,_ level: Int?) {
        guard let thelevel = level else {
            return
        }
        
        if thelevel < 10 {
            print("ハロー、" + who + "隊員")
        } else {
            print("ハロー、" + who + "上級隊員")
        }
    }
    
    //p184 条件式×オプショナルバインディング
    func optionalBindingComma() {
        let year1: String = "2001"
        let year2: String = "2016"
        if let startYear = Int(year1), let endYear = Int(year2), startYear < endYear {
            let years = endYear - startYear
            print("\(years)年間です。")
        }
    }
    
    //p185　オプショナルチェーン
    func optionalChain() {
        var balls: [(size: Int, color: String)] = []
        //var ballSize = balls.first.size 空なのでnilとなりエラーが発生
        var ballSize = balls.first?.size
        print(ballSize) //nilはアンラップで取り出せない
        
        balls = [(size: 2, color: "red"), (size: 4, color: "green")]
        ballSize = balls.first?.size
        print(ballSize)
    }
    
    //p186 アンラップした値を安全に取り出す
    func optionalBindingChain() {
        var balls: [(size: Int, color: String)] = []
        balls = [(size: 2, color: "red"), (size: 4, color: "green")]
        if let ballSize = balls.first?.size {
            print(ballSize)
        }
    }
}
