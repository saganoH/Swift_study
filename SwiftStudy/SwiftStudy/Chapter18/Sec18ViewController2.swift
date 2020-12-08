import UIKit

class Sec18ViewController2: UIViewController {
    
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel! {
        didSet {
            sliderLabel.text = String(mySlider.value)
        }
    }
    @IBOutlet weak var myProgress: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel! {
        didSet {
            progressLabel.text = String(myProgress.progress)
        }
    }
    
    @IBAction func changeValue(_ sender: Any) {
        sliderLabel.text = String(mySlider.value)
    }
    
    @IBAction func saveValue(_ sender: Any) {
        let value = mySlider.value
        sliderLabel.text = String(value)
        UserDefaults.standard.set(value, forKey: "sliderValue")
    }
    
    @IBAction func readValue(_ sender: Any) {
        let value = UserDefaults.standard.float(forKey: "sliderValue")
        progressLabel.text = String(value)
        myProgress.progress = value
    }
    
    @IBAction func comeHome18_2(segue: UIStoryboardSegue) {
    }
}
