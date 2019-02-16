//
//  Set.swift
//  Set
//
//  Created by Teo on 2/15/19.
//  Copyright © 2019 Teo. All rights reserved.
//

import Foundation

class Set {
    
    private(set) var cards = [Card]()
    
    private(set) var selectedCards = [Card]()
    
    private let colorChoices = ["Red", "Blue", "Green"]
    private let shapeChoices = ["■", "●", "▲"]
    private let stripChoices = ["a", "b", "c"]
    private let numberChoices = [1 ,2, 3]
    
    func chooseCard(index: Int) {
        if selectedCards.count < 3 {
            self.selectedCards += [self.cards[index]]
        }
    }
    
    init() {
        var identifierFactory = 1
        while self.cards.count < 12{
            let card = Card(strip: stripChoices[3.arc4random], shape: shapeChoices[3.arc4random], number: numberChoices[3.arc4random], color: colorChoices[3.arc4random], identifier: identifierFactory)
            if !(self.cards.contains(card)){
                self.cards += [card]
                identifierFactory += 1
            }
        }
    }
    
    func chooseCard(at index: Int){
        if !cards[index].isSelected {
            if self.selectedCards.count < 3{
                self.selectedCards += [cards[index]]
                cards[index].isSelected = true
            }
        }
        else {
            self.selectedCards = self.selectedCards.filter {$0 != cards[index]}
            cards[index].isSelected = false
        }
    }
    
    
//    func dealThreeCards() {
//
//    }
//
//    func isMatched() -> Bool {
//
//    }
//
}

extension Int {
    var arc4random: Int {
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0{
            return -Int(arc4random_uniform(UInt32(self)))
        }
        else {
            return 0
        }
    }
}
