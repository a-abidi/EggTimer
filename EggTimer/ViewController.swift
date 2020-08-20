//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    var timer = Timer()
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        print(eggTimes[sender.currentTitle!]!)
        startTimer(minutes: eggTimes[sender.currentTitle!]!)
    }
    
    func startTimer(minutes: Int) {
        timer.invalidate()
        var seconds = minutes * 60
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if seconds > 0 {
                print ("\(seconds) seconds")
                seconds -= 1
            }
        }
    }
}
