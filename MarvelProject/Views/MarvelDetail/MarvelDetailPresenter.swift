//
//  MarvelDetailPresenter.swift
//  MarvelProject
//
//  Created by Ruben Higuera on 8/3/22.
//

import Foundation
import UIKit

protocol MarvelDetailPresenterProtocol{
    func showDetail(character: Character)
}

final class MarvelDetailPresenter: MarvelDetailPresenterProtocol{
    private let viewController : MarvelDetailViewController
    
    init(viewController: MarvelDetailViewController){
        self.viewController = viewController
    }
    
    func showDetail(character: Character) {
        viewController.showDetail(character: character)
    }
}
