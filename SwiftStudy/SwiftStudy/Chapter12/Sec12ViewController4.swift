import UIKit

class Sec12ViewController4: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var cafePickerView: UIPickerView!
    
    let cafeSets = [["珈琲と", "紅茶と", "緑茶と", "カフェオレと", "水と"], ["プリン", "クッキー", "ケーキ", "マフィン", "空気"]]
    
    //ピッカービューのコンポーネントの個数を返す
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return cafeSets.count
    }
    
    //各コンポーネントの行数を返す
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let cafeItems = cafeSets[component]
        return cafeItems.count
    }
    
    //複数のコンポーネントがあるので横幅を指定する
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            //ひとつ目のコンポーネント
            return 150
        } else {
            //ふたつ目のコンポーネント
            return 100
        }
    }
    
    //コンポーネントの指定行の項目名を返す
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = cafeSets[component][row]
        return item
    }
    
    //選ばれた項目を調べる
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //選ばれた項目
        let item = cafeSets[component][row]
        print("\(item)が選ばれた")
        
        //現在選択されている行番号
        let row1 = pickerView.selectedRow(inComponent: 0)
        let row2 = pickerView.selectedRow(inComponent: 1)
        print("現在選択されている行番号 \(row1), \(row2)")
        
        //現在選択されている項目名
        let item1 = self.pickerView(pickerView, titleForRow: row1, forComponent: 0)
        let item2 = self.pickerView(pickerView, titleForRow: row2, forComponent: 1)
        print("現在選択されている項目名 \(item1!)\(item2!)")
        print("---------------")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //drinkPickerViewのデリゲートになる
        cafePickerView.delegate = self
        //drinkPickerViewのデータソースになる
        cafePickerView.dataSource = self
    }
    
}
