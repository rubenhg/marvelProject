//
//  MarvelListViewController.swift
//  MarvelProject
//
//  Created by Ruben Higuera on 8/3/22.
//

import UIKit
import UIKit

class MarvelListViewController:
    UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var charTable: UITableView!
    
    
    var characters: [Character] = []
    var interactor : MarvelListInteractorProtocol?
    var presenter: MarvelListPresenterProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        if characters.isEmpty{interactor?.getCharacters()}
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        charTable.register(UINib(nibName: "MarvelListTableViewCell", bundle: nil), forCellReuseIdentifier: "marvelListTableViewCell")
        charTable.delegate = self
        charTable.dataSource = self
        setUpScreen()
        // Do any additional setup after loading the view.
    }
    
    func setUpScreen(){
        titleLabel.text = "Listado de Personajes"
    }
    
    func show(chars: [Character]){
        self.characters = chars
        DispatchQueue.main.sync{
            self.charTable.reloadData()
        }
    }
    
    func showError(title: String, text: String){
        let alert = UIAlertController(title: title, message: text, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }

}

extension MarvelListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "marvelListTableViewCell", for: indexPath) as! MarvelListTableViewCell
        cell.setData(url: characters[indexPath.row].getCharacterImage(), name: characters[indexPath.row].name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = MarvelDetailWireframe.build(character: characters[indexPath.row])
        self.navigationController?.present(detailView, animated: true, completion: nil)
    }
}
