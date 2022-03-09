//
//  MarvelListPresenter.swift
//  MarvelProject
//
//  Created by Ruben Higuera on 8/3/22.
//

import Foundation

protocol MarvelListPresenterProtocol{
    func show(char: [Character])
    func showError(title: String, text: String)
}

final class MarvelListPresenter: MarvelListPresenterProtocol {
    let viewController : MarvelListViewController
    
    init(viewController: MarvelListViewController){
        self.viewController = viewController
    }
    
    func show(char: [Character]){
        viewController.show(chars: char)
    }
    func showError(title: String, text: String){
        viewController.showError(title: title, text: text)
    }
}
