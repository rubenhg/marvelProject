//
//  MarvelDetailInteractor.swift
//  MarvelProject
//
//  Created by Ruben Higuera on 8/3/22.
//

import Foundation

protocol MarvelDetailInteractorProtocol {
    func getDetail()
}

final class MarvelDetailInteractor: MarvelDetailInteractorProtocol {

    private let presenter: MarvelDetailPresenterProtocol
    private let character: Character
    
    init(presenter: MarvelDetailPresenterProtocol,character: Character){
        self.presenter = presenter
        self.character = character
    }
    
    func getDetail() {
        presenter.showDetail(character: self.character)
        
    }
}
