//
//  MarvelListInteractor.swift
//  MarvelProject
//
//  Created by Ruben Higuera on 8/3/22.
//

import Foundation
import UIKit

protocol MarvelListInteractorProtocol {
    func getCharacters()
}

final class MarvelListInteractor: MarvelListInteractorProtocol {
    private let presenter: MarvelListPresenterProtocol
    private let worker: MarvelListWorkerProtocol
    private var marvelURL: String = "http://gateway.marvel.com/v1/public/characters"
    private var chars: [Character]
    
    init(presenter: MarvelListPresenterProtocol,
         worker: MarvelListWorkerProtocol){
        self.presenter = presenter
        self.worker = worker
        self.chars = []
    }
    
    
    func getCharacters() {
        worker.getCharacters(url: marvelURL) { result in
            switch result {
            case .success(let response):
                let characters = try? JSONDecoder().decode(CharacterDataWrapper.self, from: response)
                
                if self.chars.isEmpty{
                    self.chars = (characters?.data?.results)!
                    self.presenter.show(char: (characters?.data?.results)!)
                } else {
                    self.chars.append(contentsOf: (characters?.data?.results)!)
                    self.presenter.show(char: self.chars)
                }
            case .failure(let error):
                self.presenter.showError(title: "Se ha producido un error", text: error.localizedDescription)
                
            }
        }
    }
}

