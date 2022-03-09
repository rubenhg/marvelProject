//
//  MarvelDetailWireframe.swift
//  MarvelProject
//
//  Created by Ruben Higuera on 8/3/22.
//
import UIKit

public enum MarvelDetailWireframe{
     static func build(character: Character) -> UIViewController {
        let viewController = MarvelDetailViewController()
        let presenter = MarvelDetailPresenter(viewController: viewController)
        let interactor = MarvelDetailInteractor(presenter: presenter, character: character)
        
        viewController.interactor = interactor
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}
