//
//  PokeInfoView.swift
//  Pokedex
//
//  Created by Matheus Dionísio on 20/04/22.
//

import Foundation
import UIKit

class PokeinfoView: UIViewController {
    
    @IBOutlet weak var pokeTypeCollectionView: UICollectionView!
   
    
    
    //Head.
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeIdLabel: UILabel!
    @IBOutlet weak var pokeballColor: UIImageView!
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var pokeBackground: UIView!
    @IBOutlet weak var viewInfo: UIView!
    
    //Label infos.
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //Sliders.
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var atkSlider: UISlider!
    @IBOutlet weak var defSlider: UISlider!
    @IBOutlet weak var satkSlider: UISlider!
    @IBOutlet weak var sdefSlider: UISlider!
    @IBOutlet weak var spdSlider: UISlider!
    //Stats numbers.
    @IBOutlet weak var hpNum: UILabel!
    @IBOutlet weak var atkNum: UILabel!
    @IBOutlet weak var defNum: UILabel!
    @IBOutlet weak var satkNum: UILabel!
    @IBOutlet weak var sdefNum: UILabel!
    @IBOutlet weak var spdNum: UILabel!
    
    
    var pokemon: Poke?
    var pokeTypeViewCell = PokeTypeViewCell()
    
    override func viewDidLoad() {
        configureViewWithPokemon(pokemon: pokemon)
    }
    
    
    func configureViewWithPokemon(pokemon: Poke?){
        
        viewInfo.layer.cornerRadius = 16
        pokeImage.image = UIImage(named: pokemon?.imageUrl ?? "")
        aboutLabel.textColor = pokemon?.color
        pokeBackground.backgroundColor = pokemon?.color
        pokeNameLabel.text = pokemon?.title
        pokeIdLabel.text = pokemon?.id
        weightLabel.text = pokemon?.weightValue
        heightLabel.text = pokemon?.heightLabel
        movesLabel.text = pokemon?.movesValue
        descriptionLabel.text = pokemon?.descriptionValue
        hpNum.text = pokemon?.hpValue
        atkNum.text = pokemon?.atkValue
        defNum.text = pokemon?.defValue
        satkNum.text = pokemon?.satkValue
        sdefNum.text = pokemon?.sdefValue
        spdNum.text = pokemon?.spdValue
        
        
        configureSlider(slider: slider, current: Int(pokemon?.hpValue ?? "0") ?? 0, min: 0, max: 100)
        configureSlider(slider: atkSlider, current:Int(pokemon?.atkValue ?? "0") ?? 0, min: 0, max: 100)
        configureSlider(slider: defSlider, current:Int( pokemon?.defValue ?? "0") ?? 0 , min: 0, max: 100)
        configureSlider(slider: satkSlider, current:Int( pokemon?.satkValue ?? "0") ?? 0, min: 0, max: 100)
        configureSlider(slider: sdefSlider, current:Int( pokemon?.sdefValue ?? "0") ?? 0, min: 0, max: 100)
        configureSlider(slider: spdSlider, current:Int( pokemon?.spdValue ?? "0") ?? 0, min: 0, max: 100)
    }
    
    func configureSlider(slider: UISlider, current: Int, min: Int, max: Int) {
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        slider.value = Float(current)
    }
    
}
