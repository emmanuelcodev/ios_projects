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
    var isUserTurn = false
    var level = 1
    var currentGuesses = 0
    
    var colorMemory = [0]
    var colorMemoryUser = [0]
    
    var audioPlayer: AVAudioPlayer!
    
    
    //functions
    
    func playSound(tag: Int){
        // pick random song, and play it
        let sounds = ["red","orange","yellow","green","darkGreen","blue","purple"]
        let soundURL = Bundle.main.url(forResource: sounds[tag-1], withExtension: "m4a")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }catch{
            print(error)
        }
        audioPlayer.play()
    }
    
    func compTurn(){
        // computer shows sequence random based on level
        
            for _ in 1...(level){
                let randomNum = Int.random(in: 1 ... 7)
                print("comp randomNum is \(randomNum-1)")
                colorMemory.append(randomNum)//adds all sounds to array to compare with user guesses
                sleep(2)
                playSound(tag: randomNum)
            }
            isUserTurn = true
        
    }
    
    
    func playGameStatus(marker: Int){
        let status = ["gameStarts","nextLevel","youWon","youLost"]
        sleep(2)
        
        let soundURL = Bundle.main.url(forResource: status[marker-1], withExtension: "m4a")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }catch{
            print(error)
        }
        audioPlayer.play()
        
    }
    
    func printStatus(){
        print("\nlevel is \(level)")
        print("Guesses is \(currentGuesses)")
        print("Turn of \(isUserTurn)")
    }
    
    
    func userTurn(tag: Int){
        // check if number of guesses outweighs level
        currentGuesses += 1
        colorMemoryUser.append(tag)
        printStatus()
    
      
        if currentGuesses == level {
            print("guesses have run out")
            if colorMemory == colorMemoryUser{
                print("You won")
                playGameStatus(marker: 3)
                playGameStatus(marker: 2)
                // if they guessed correctly, reset number of guessses and increase level
                currentGuesses = 0
                level += 1
                colorMemoryUser = [0]
                colorMemory = [0]
                isUserTurn = false
                
            }else{
                print("sorry you lost")
                playGameStatus(marker: 4)
                playGameStatus(marker: 1)
                sleep(4)
                // else reset the number of guesses and levelss, arrays
                currentGuesses = 0
                level = 1
                isUserTurn = false
                colorMemory = [0]
                colorMemoryUser = [0]
                
                
            }
            // regardless change to comp turn, let comp play
            isUserTurn = false
            compTurn()
            print("user turn done")
            
        }
    }//end func
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playGameStatus(marker: 1)
        sleep(2)
        compTurn()

    }



    @IBAction func notePressed(_ sender: UIButton) {
        let tag2 = sender.tag
        userTurn(tag: tag2)
    }
    
}

