//
//  MarvelListWireframe.swift
//  MarvelProject
//
//  Created by Ruben Higuera on 8/3/22.
//

import Foundation
import UIKit

public enum MarvelListWireframe{
    public static func build() -> UIViewController {
        let viewController = MarvelListViewController()
        let presenter = MarvelListPresenter(viewController: viewController)
        let worker = MarvelListWorker()
        let interactor = MarvelListInteractor(presenter: presenter, worker: worker)
        
        viewController.interactor = interactor
        return viewController
    }
}
