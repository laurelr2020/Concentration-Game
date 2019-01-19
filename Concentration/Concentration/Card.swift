//
//  Card.swift
//  Concentration
//
//  Created by Regan Laurell on 1/19/19.
//  Copyright © 2019 University of Mount Union. All rights reserved.
//

import Foundation

struct Card
{
    
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    
    static var idFactory = 0
    
    static func getUniqueID() -> Int{
        idFactory += 1
        return idFactory
    }
    
    init(){
        self.identifier = Card.getUniqueID()
    }
}
