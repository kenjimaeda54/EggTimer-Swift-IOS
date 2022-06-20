# Aplicativo Egg
Aplicativo para alertar quando seu ovo está pronto, são três opções de dureza: leve, medio e alto

## Motivação
Aprender novos recursos ao desenvolver um aplicativo em Swfit para IOS e reforçar recursos aprendeu anteriormente


## Feature
- Aprendi o uso de dicionários
- Com dicionários podemos reduzir bastante if, switch no código
- Abaixo criei uma lógica para reduzir o uso de if ou switch com [dicionário](https://www.tutorialspoint.com/swift/swift_dictionaries.htm)
- Consigo acessar os valores da chave do dicionário como acesso o array


```swift
    //consigo os valoes acessando as  chaves com [] 
    
    let hardness:String = sender.currentTitle!
    let allTimesHeToughness = ["Soft":5,"Medium":7,"Hard":12]
    totalTime = allTimesHeToughness[hardness]!

```

## 
- Aprendi o uso de [closure](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)  e timer no desenvolvimento de IOS
- Closure e um recurso de swift, para algumas linguagens  são conhecidas como lambda
- Para acessar variáveis no escopo de uma closure usamos a palavra reservada self
- Para uso de [timer](https://developer.apple.com/documentation/foundation/timer) em Apple e bem simples
- Utilizei closure, pois facilita a escrita 
- Para o progress bar apliquei um conceito interessante
- Iniciei uma variável ela era somada a cada vez que e passada na condição, enquanto ela for menor tempo total continuara sendo somada
- Então se o tempo total e 5 ela passara 5 vezes e conseguente mente pintando o progress bar
- Progress bar utiliza 0 a 1, ou seja, 1 e o 100%. Para realizar essa conta foi simples a partir dessa abordagem dividi o tempo passado pelo total

```swift

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


```
