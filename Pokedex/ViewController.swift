

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var pokemons: [Poke] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 104, height: 112)
        collectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCollectionView")

        collectionView.delegate = self
        collectionView.dataSource = self
        createPokemon()
    }
    
    func createPokemon() {
        

        let poke1: Poke = Poke(id: "#001", title: "Bulbassaur", imageUrl: "icon-bulbassaur", color: UIColor.systemGreen, weightValue: "6,9 Kg", heightLabel: "0,7 M", movesValue: "Chlorophyll Overgrow", descriptionValue: "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.", atkValue: "045", defValue: "049", hpValue: "049", satkValue: "065", sdefValue: "065", spdValue: "045", Natures: [Nature(pokeType: "Grass", typeColor: UIColor.systemGreen), Nature(pokeType: "Grass", typeColor: UIColor.systemGreen)])
        let poke2: Poke = Poke(id: "#004", title: "Charmander", imageUrl: "icon-charmander", color: UIColor.systemOrange, weightValue: "8,5 Kg", heightLabel: "0,6 M", movesValue: "Mega Punch Fire Punch", descriptionValue: "It has a preference for hot things. When it rains, steam is said to spout from the tip of its tail.", atkValue: "052", defValue: "043", hpValue: "039", satkValue: "060", sdefValue: "050", spdValue: "065", Natures: [Nature(pokeType: "Fire", typeColor: UIColor.systemOrange)] )
        let poke3: Poke = Poke(id: "#007", title: "Squirtle", imageUrl: "icon-squirtle", color: UIColor.systemBlue, weightValue: "9,0 Kg", heightLabel: "0,5 M", movesValue: "torrent rain-dish", descriptionValue: "When it retracts its long neck into its shell, it squirts out water with vigorous force.", atkValue: "048", defValue: "065", hpValue: "044", satkValue: "050", sdefValue: "064", spdValue: "043", Natures: [Nature(pokeType: "Water", typeColor: UIColor.systemBlue)] )

        pokemons.append(poke1)
        pokemons.append(poke2)
        pokemons.append(poke3)
        print("\(pokemons.count)")
        collectionView.reloadData()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goPokeInfo" {
            guard let controller = segue.destination as? PokeinfoView else { return }
            
            guard let pokemonId = sender as? Int else { return }
            controller.pokemon = pokemons[pokemonId]
        }
    }

}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        performSegue(withIdentifier: "goPokeInfo", sender: indexPath.item)
    }
}

extension ViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return pokemons.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = pokemons[indexPath.item].color.cgColor
        cell.layer.borderWidth = 1
        cell.idPoke?.textColor = pokemons[indexPath.item].color
        cell.idPoke?.text = pokemons[indexPath.item].id
        cell.labelPoke?.text = pokemons[indexPath.item].title
        cell.bottomView?.backgroundColor = pokemons[indexPath.item].color
        cell.configure(with: UIImage(named: pokemons[indexPath.item].imageUrl)!)
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 104, height: 112)
    }
}

