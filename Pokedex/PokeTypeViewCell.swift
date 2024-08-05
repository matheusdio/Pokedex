//
//  PokeTypeViewCell.swift
//  Pokedex
//
//  Created by Matheus Dionísio on 27/04/22.
//

import UIKit

class PokeTypeViewCell: UICollectionViewCell {

    @IBOutlet weak var pokeTypeView: UIView!
    @IBOutlet weak var pokeTypeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

static let identifier = "PokeTypeCollectionView"
    
}
