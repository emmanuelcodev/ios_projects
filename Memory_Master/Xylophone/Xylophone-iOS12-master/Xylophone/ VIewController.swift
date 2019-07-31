//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController{
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        let tag = sender.tag
        print(sender.tag)
        playSound(tag: tag)
        
        
    }
    
    func playSound(tag: Int){
        // pick random song, and play it
        let sounds = ["note1","note2","note3","note4","note5","note6","note7"]
        let soundURL = Bundle.main.url(forResource: sounds[tag-1], withExtension: "wav")
    
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
    
  

}

