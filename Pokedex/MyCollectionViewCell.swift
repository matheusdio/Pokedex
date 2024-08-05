//
//  MyCollectionViewCell.swift
//  Pokedex
//
//  Created by Matheus Dionísio on 18/04/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelPoke: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var idPoke: UILabel!
    
    @IBOutlet weak var bottomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    static let identifier = "MyCollectionView"
    
    public func configure(with image: UIImage) {
        imageView?.image = image
    }
    
}
