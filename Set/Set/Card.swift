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
    var identifier = 0
    
    init(strip: String, shape: String, number: Int, color: String, identifier: Int) {
        self.strip = strip
        self.shape = shape
        self.number = number
        self.color = color
        self.identifier = identifier
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return
            lhs.number == rhs.number &&
                lhs.strip == rhs.strip &&
                lhs.shape == rhs.shape && lhs.color == rhs.color
    }
}
