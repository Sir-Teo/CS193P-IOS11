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
    private let shapeChoices = ["Square", "Circle", "Triangle"]
    private let stripChoices = ["a", "b", "c"]
    private let numberChoices = [1 ,2, 3]
    
    func chooseCard(index: Int) {
        if selectedCards.count < 3 {
            self.selectedCards += [self.cards[index]]
        }
    }
    
    init() {
        let card = Card(strip: stripChoices[3.arc4random], shape: shapeChoices[3.arc4random], number: 3.arc4random, color: colorChoices[3.arc4random])
        while self.cards.count <= 12{
            if !(self.cards.contains(card)){
                self.cards += [card]
            }
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
