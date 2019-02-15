//
//  Card.swift
//  Set
//
//  Created by Teo on 2/15/19.
//  Copyright © 2019 Teo. All rights reserved.
//

import Foundation

class Card {
    
    var strip: String
    var shape: String
    var number: String
    var color: String
    
    init(strip: String, shape: String, number: String, color: String) {
        self.strip = strip
        self.shape = shape
        self.number = number
        self.color = color
    }
    
}
