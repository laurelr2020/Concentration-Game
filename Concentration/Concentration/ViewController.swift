//
//  ViewController.swift
//  Concentration
//
//  Created by Regan Laurell on 1/19/19.
//  Copyright © 2019 University of Mount Union. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    lazy var game = Concentration(numberOfPairsOfCards: ((cardButtons.count + 1) / 2 ))
    
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
   
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("chosen card is not in cardButtons")
        }
    }
 
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card) , for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("" , for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0) : #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["😍","🥰","😘","🤗","💋","🌹","❤️","💘","💖","💝"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String{
        if emoji[card.identifier]  == nil{
            if emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count-1)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

