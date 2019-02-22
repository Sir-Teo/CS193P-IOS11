//
//  Set.swift
//  Set
//
//  Created by Teo on 2/15/19.
//  Copyright © 2019 Teo. All rights reserved.
//

import Foundation

class Set {
    
    var cards = [Card]()
    var usedCards = [Card]()
    var newThreeCards = [Card]()
    
    var selectedCards = [Card]()
    
    private let colorChoices = ["Red", "Blue", "Green"]
    private let shapeChoices = ["■", "●", "▲"]
    private let stripChoices = ["a", "b", "c"]
    private let numberChoices = [1 ,2, 3]
    
    var identifierFactory = 1
    
    func chooseCard(index: Int) {
        if selectedCards.count < 3 {
            self.selectedCards += [self.cards[index]]
        }
    }
    
    init() {
        while self.cards.count < 12{
            let card = Card(strip: stripChoices[3.arc4random], shape: shapeChoices[3.arc4random], number: numberChoices[3.arc4random], color: colorChoices[3.arc4random], identifier: identifierFactory)
            if !(self.cards.contains(card)){
                self.cards += [card]
                identifierFactory += 1
            }
        }
    }
    
    
    func dealThreeCards() {
        while self.newThreeCards.count < 3{
            let card = Card(strip: stripChoices[3.arc4random], shape: shapeChoices[3.arc4random], number: numberChoices[3.arc4random], color: colorChoices[3.arc4random], identifier: identifierFactory)
            if !(self.cards.contains(card) && self.usedCards.contains(card)){
                self.cards += [card]
                self.newThreeCards += [card]
                identifierFactory += 1
            }
        }
        self.newThreeCards.removeAll()
    }

    
    func isMatched(threeCards:[Card]) -> Bool {
        var colors = [String]()
        var shapes = [String]()
        var numbers = [Int]()
        var strips = [String]()
        if threeCards.count == 3{
            for card in threeCards{
                if !colors.contains(card.color){
                    colors += [card.color]
                }
                if !shapes.contains(card.shape){
                    shapes += [card.shape]
                }
                if !numbers.contains(card.number){
                    numbers += [card.number]
                }
                if !strips.contains(card.strip){
                    strips += [card.strip]
                }
            }
        }
        return (colors.count + shapes.count + numbers.count + strips.count == 10) && (colors.count == 1 || shapes.count == 1 || numbers.count == 1 || strips.count == 1)
    }

}

public extension Int {
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

extension Array {
    var combinations: [[Element]] {
        if count == 0 {
            return [self]
        }
        else {
            let tail = Array(self[1..<endIndex])
            let head = self[0]
            
            let first = tail.combinations
            let rest = first.map { $0 + [head] }
            
            return first + rest
        }
    }
}
