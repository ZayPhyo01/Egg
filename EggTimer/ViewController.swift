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
    
    @IBOutlet weak var remainProgress: UIProgressView!
    let dict = ["Soft" : 3 , "Medium" : 4 , "Hard" : 7]
    
    @IBOutlet weak var hardnessEgg: UIImageView!
    
    var time = Timer()
    var currentTime = 0
    
    override func viewDidLoad() {
      //  remainProgress.progress = 1
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf : url!)
        
    }
    
    var player : AVAudioPlayer?
    
    @IBAction func onTapHardnessEgg(_ sender: UIButton) {
        let hardness = sender.currentTitle
    
        totalTime = dict[hardness!]!
        time.invalidate()
        currentTime = 0
        
        
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeStart), userInfo: nil, repeats: true)
        
    }
    
    var totalTime = 0
    
    @objc func timeStart() {
        if currentTime < totalTime {
        
            currentTime += 1
            remainProgress.progress = Float(currentTime) / Float(totalTime)
        }else {
            time.invalidate()
            print("Done")
            player?.play()
        }
        
        
    }
    
    
    
    
    
}
