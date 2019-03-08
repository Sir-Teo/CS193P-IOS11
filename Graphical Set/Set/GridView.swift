//
//  GridView.swift
//  Set
//
//  Created by Teo on 3/8/19.
//  Copyright © 2019 Teo. All rights reserved.
//

import UIKit

class GridView: UIView {
    
    private lazy var game = Graphical_Set()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        
    }
    


}
