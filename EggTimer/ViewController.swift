import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let allTimesHeToughness = ["Soft":5,"Medium":7,"Hard":12]

    var totalTime = 0
    var timePassed = 0
    var player: AVAudioPlayer?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    @IBAction func handleKeyPress(_ sender: UIButton) {
    
       let hardness:String = sender.currentTitle!
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
       player  = try! AVAudioPlayer(contentsOf: url!)
       totalTime = allTimesHeToughness[hardness]!
       timePassed = 0
        titleLabel.textColor = UIColor.darkGray
       titleLabel.text = "Your chosse \(hardness)"
        
        
       Timer.scheduledTimer(withTimeInterval: 1.0,repeats: true) {(Timer) in
           
           if self.totalTime > self.timePassed {
               self.timePassed += 1
               self.progressView.progress =  Float(self.timePassed) / Float(self.totalTime)
            }else {
                self.titleLabel.text = "Done"
                self.titleLabel.textColor = UIColor.red
                self.player?.play()
                Timer.invalidate()
            }
        }
        
        
    }
    
   
    

}
