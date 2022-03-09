//
//  UIImageExtension.swift
//  MarvelProject
//
//  Created by Ruben Higuera on 8/3/22.
//

import Foundation
import UIKit

extension UIImageView {
    //needed to build image from URL
    func setImage(url: String){
        let client = Client()
        if let apiUrl = URL(string: url){
            client.get(url: apiUrl){result -> Void in
                switch result{
                case .success(let data):
                    DispatchQueue.main.async {
                        let imageToLoad = UIImage(data: data)
                        self.image = imageToLoad
                    }
                    break
                case .failure:
                    break
                }
            }
        }
            
    }
}
