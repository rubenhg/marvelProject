//
//  MarvelDetailViewController.swift
//  MarvelProject
//
//  Created by Ruben Higuera on 8/3/22.
//

import UIKit

class MarvelDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var backButton: UIButton!
    
    var interactor: MarvelDetailInteractorProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getDetail()

    }

    func showDetail(character: Character){
        titleLabel.text = "Detalle de Personaje"
        nameLabel.text = "Nombre: \(character.name ?? "Sin Nombre")"
        imageView.setImage(url: character.getCharacterImage())
        if character.description != "" {
            descriptionTextView.text = character.description
        }else{ descriptionTextView.text = "No hay descripción disponible del personaje seleccionado."}
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
