//
//  Card.swift
//  Set
//
//  Created by Teo on 2/15/19.
//  Copyright © 2019 Teo. All rights reserved.
//

import Foundation

class Card {
    
    // 3 * 3 * 3 * 3 = 81 possibilities
    var strip: String  
    var shape: String
    var number: Int
    var color: String
    var isSelected = false
    
    init(strip: String, shape: String, number: Int, color: String) {
        self.strip = strip
        self.shape = shape
        self.number = number
        self.color = color
        switch number {
        case 2:
            self.shape = "\(self.shape)\(self.shape)"
        case 3:
            self.shape = "\(self.shape)\(self.shape)\(self.shape)"
        default:
            break
        }
    }
    
    public var description: String { return "Card: strip:\(self.strip), shape:\(self.shape), number: \(self.number), color: \(self.color)" }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return
            lhs.number == rhs.number &&
                lhs.strip == rhs.strip &&
                lhs.shape == rhs.shape && lhs.color == rhs.color
    }
}