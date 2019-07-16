//
//  ViewController.swift
//  DICEE
//
//  Created by Emmanuel on 7/9/19.
//  Copyright © 2019 emmanuel-codes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Player 1 label
    @IBOutlet weak var player1Label: UILabel!
    
    //player 1 dice
    @IBOutlet weak var diceImageView3: UIImageView!
    @IBOutlet weak var diceImageView4: UIImageView!
    
    //Player 2 label
    @IBOutlet weak var player2Label: UILabel!
    
    //player 2 dice
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        updateDiceImages()
        
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
       
    }
    
    func updateDiceImages(){
        //player 2 dice
        let d1 = randInt()
        let d2 = randInt()
        
        diceImageView1.image = retrieveDiceImage(randomIndex: d1)
        diceImageView2.image = retrieveDiceImage(randomIndex: d2)
        
        
        
        //player 1 dice
        let d3 = randInt()
        let d4 = randInt()
        diceImageView3.image = retrieveDiceImage(randomIndex: d3)
        diceImageView4.image = retrieveDiceImage(randomIndex: d4)
        
        
        
        //get user dices strings
        let diffPlay1 = abs(d3-d4)
        let diffPlay2 = abs(d1-d2)
        
        if (diffPlay1 > diffPlay2){
            resetPlayerLabels()
            updatePlayerLabels(winner: player1Label, loser: player2Label)
        }else if (diffPlay1 < diffPlay2) {
            resetPlayerLabels()
            updatePlayerLabels(winner: player2Label, loser: player1Label)
        }else{
            resetPlayerLabels()
            draw()
        }
        
    }
    //randomly select image
    func retrieveDiceImage(randomIndex: Int)-> UIImage{
        let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
        let randomDiceImage = UIImage(named: diceArray[randomIndex])
        return randomDiceImage!
    }
    
    
    func updatePlayerLabels(winner: UILabel, loser: UILabel){
        winner.text = winner.text! + " wins !"
        loser.text =  loser.text! + " lost :("
    }
    
    func resetPlayerLabels(){
        player1Label.text = "Player"
        player2Label.text = "Player"
        
    }
    func draw(){
        player1Label.text = "Player 1 draws"
        player2Label.text = "Player 2 draws"
        
    }
    
    func randInt()->Int{
        return Int.random(in: 0 ... 5)
    }
    
    

}

