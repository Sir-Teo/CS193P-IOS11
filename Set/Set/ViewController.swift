//
//  ViewController.swift
//  Set
//
//  Created by Teo on 2/15/19.
//  Copyright © 2019 Teo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Set()
    private var usingButtonsIndices = [Int]()
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        let buttonIndex = cardButtons.firstIndex(of: sender)!
        if let cardIndex = usingButtonsIndices.firstIndex(of: buttonIndex){
            if game.cards[cardIndex].isSelected == true{
                print("true")
                game.cards[cardIndex].isSelected = false
                cardButtons[buttonIndex].layer.borderWidth = 0
                game.selectedCards = game.selectedCards.filter {$0 != game.cards[cardIndex] }
            }
            else{
                print("false")
                game.cards[cardIndex].isSelected = true
                cardButtons[buttonIndex].layer.borderWidth = 3.0
                cardButtons[buttonIndex].layer.borderColor = UIColor.blue.cgColor
                cardButtons[buttonIndex].layer.cornerRadius = 8.0
                game.selectedCards += [game.cards[cardIndex]]
                if game.selectedCards.count > 3{
                    let removedSelectionCard = game.selectedCards.remove(at: 0)
                    removedSelectionCard.isSelected = false
                    let removedSelectionCardIndex = game.cards.firstIndex(of: removedSelectionCard)!
                    cardButtons[usingButtonsIndices[removedSelectionCardIndex]].layer.borderWidth = 0
                }
            }
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        for button in cardButtons{
            button.layer.borderWidth = 0
            button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            button.setTitle(" ", for: UIControl.State.normal)
        }
        usingButtonsIndices = [Int]()
        game = Set()
        while usingButtonsIndices.count < 12 {
            let randomIndex = cardButtons.count.arc4random
            if !usingButtonsIndices.contains( randomIndex ){
                cardButtons[randomIndex].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                usingButtonsIndices += [randomIndex]
            }
        }
        for i in 0...11{
            let shape = game.cards[i].shape
            var color: UIColor
            var alpha: CGFloat
            switch game.cards[i].strip{
            case "a":
                alpha = 0.2
            case "b":
                alpha = 0.8
            default:
                alpha = 1.0
            }
            switch game.cards[i].color{
            case "Red":
                color = UIColor(red: 222/255.0, green: 0/255.0, blue: 0/255.0, alpha: alpha)
            case "Blue":
                color = UIColor(red: 0/255.0, green: 0/255.0, blue: 222/255.0, alpha: alpha)
            default:
                color = UIColor(red: 76/255.0, green: 170/255.0, blue: 0/255.0, alpha: alpha)
            }
            cardButtons[usingButtonsIndices[i]].setTitle(shape, for: UIControl.State.normal)
            cardButtons[usingButtonsIndices[i]].setTitleColor(color, for: UIControl.State.normal)
        }
    }
    
    @IBAction func dealThreeCards(_ sender: UIButton) {
    }
    
    @IBAction func cheat(_ sender: UIButton) {
        
    }
    
    func updateViewFromModel() {
        
    }
    
}

