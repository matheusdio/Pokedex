//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Matheus Dionísio on 19/04/22.
//

import Foundation
import UIKit

struct Poke {
    var id:String
    var title, imageUrl:String
    var color:UIColor
    
    //About Labels.
    var weightValue:String
    var heightLabel:String
    var movesValue:String
    var descriptionValue:String
    
    //Base Stats.
    var atkValue:String
    var defValue:String
    var hpValue:String
    var satkValue:String
    var sdefValue:String
    var spdValue:String
    
    //
    
    var Natures: [Nature]?

}

struct Nature {
    var pokeType:String?
    var typeColor: UIColor?
    
}

