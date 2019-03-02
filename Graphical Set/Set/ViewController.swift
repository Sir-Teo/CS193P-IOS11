//
//  ViewController.swift
//  Set
//
//  Created by Teo on 2/15/19.
//  Copyright © 2019 Teo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Graphical_Set()
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of: sender){
            if game.cards.count > cardIndex{
            if game.cards[cardIndex].isSelected == true{
                game.cards[cardIndex].isSelected = false
                unChangeCardBorder(button: cardButtons[cardIndex])
                game.selectedCards = game.selectedCards.filter {$0 != game.cards[cardIndex] }
            }
            else{
                game.cards[cardIndex].isSelected = true
                changeCardBorder(button: cardButtons[cardIndex])
                game.selectedCards += [game.cards[cardIndex]]
                if game.selectedCards.count > 3{
                    let removedSelectionCard = game.selectedCards.remove(at: 0)
                    removedSelectionCard.isSelected = false
                    let removedSelectionCardIndex = game.cards.firstIndex(of: removedSelectionCard)!
                    cardButtons[removedSelectionCardIndex].layer.borderWidth = 0
                }
            }
            updateViewFromModel()
            }
        }
    }
    
    func changeCardBorder(button: UIButton){
        button.layer.borderWidth = 3.0
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.cornerRadius = 8.0
    }
    
    func unChangeCardBorder(button: UIButton){
        button.layer.borderWidth = 0
    }
    
    func drawCards(){
        for button in cardButtons{
            button.layer.borderWidth = 0
            button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            button.setTitle(" ", for: UIControl.State.normal)
            button.layer.cornerRadius = 0
        }
        var tempIndex = 0
        for card in game.cards{
            let shape = card.shape
            var color: UIColor
            var alpha: CGFloat
            switch card.strip{
            case "a":
                alpha = 0.15
            case "b":
                alpha = 0.5
            default:
                alpha = 1.0
            }
            switch card.color{
            case "Red":
                color = UIColor(red: 222/255.0, green: 0/255.0, blue: 0/255.0, alpha: alpha)
            case "Blue":
                color = UIColor(red: 0/255.0, green: 0/255.0, blue: 222/255.0, alpha: alpha)
            default:
                color = UIColor(red: 76/255.0, green: 170/255.0, blue: 0/255.0, alpha: alpha)
            }
            cardButtons[tempIndex].setTitle(shape, for: UIControl.State.normal)
            cardButtons[tempIndex].setTitleColor(color, for: UIControl.State.normal)
            cardButtons[tempIndex].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            tempIndex += 1
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game = Graphical_Set()
        drawCards()
    }
    
    
    @IBAction func dealThreeCards(_ sender: UIButton) {
        game.dealThreeCards()
        drawCards()
    }
    
    @IBAction func cheat(_ sender: UIButton) {
        var possible = [Card]()
        let combinations = game.cards.combinations.filter {$0.count == 3}
        for c in combinations{
            if game.isMatched(threeCards: c){
                possible = c
                break
            }
        }
        let indices = possible.map {game.cards.firstIndex(of: $0)}
        for index in indices{
            changeCardBorder(button: cardButtons[index!])
        }
    }
    
    func updateViewFromModel() {
        if game.isMatched(threeCards: game.selectedCards){
            let indices = game.selectedCards.map {game.cards.firstIndex(of: $0)}
            var cards = [Card]()
            for index in indices{
                unChangeCardBorder(button: cardButtons[index!])
                cardButtons[index!].setTitle(" ", for: UIControl.State.normal)
                cardButtons[index!].backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                cards += [game.cards[index!]]
            }
            game.selectedCards.removeAll()
            for card in cards{
                let index = game.cards.firstIndex(of: card)
                game.cards.remove(at: index!)
            }
            drawCards()
        }
    }
    
}

