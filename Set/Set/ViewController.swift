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
            
        
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        for button in cardButtons{
            button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
    }
    
    @IBAction func dealThreeCards(_ sender: UIButton) {
    }
    
    @IBAction func cheat(_ sender: UIButton) {
        
    }
    
    func updateViewFromModel() {
        
    }
    
}

