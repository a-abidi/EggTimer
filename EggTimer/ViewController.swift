//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    var timer = Timer()
    var secondsPassed = 0
    
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
   
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        print(eggTimes[sender.currentTitle!]!)
        startTimer(seconds: eggTimes[sender.currentTitle!]!)
    }
    
    func startTimer(seconds: Int) {
        self.secondsPassed = 0
        self.progressBar.progress = 0
        timer.invalidate()
        self.titleLabel.text = "How do you like your eggs?"
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if (self.secondsPassed < seconds) {
                print ("\(self.secondsPassed) seconds")
                self.secondsPassed += 1
                self.progressBar.progress = Float(self.secondsPassed) / Float(seconds)
            } else {
                self.timer.invalidate()
                self.titleLabel.text = "Your eggs are ready!"
                self.progressBar.progress = 1.0
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()
            }
        }
    }
}
