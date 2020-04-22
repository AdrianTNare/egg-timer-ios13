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
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]
    var totaTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        secondsPassed = 0
        progressBar.progress = 0.0
        timer.invalidate()
        let hardness = sender.currentTitle!
        appTitle.text = hardness
        totaTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

    }
    func playSound(soundName:String) {
        print(soundName)
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totaTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed)/Float(totaTime)
    
        }
        else {
            timer.invalidate()
            appTitle.text = "Done!"
            playSound(soundName:"alarm_sound")
        }
    }

}
