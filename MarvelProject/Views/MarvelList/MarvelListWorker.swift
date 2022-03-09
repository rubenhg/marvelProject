//
//  MarvelListWorker.swift
//  MarvelProject
//
//  Created by Ruben Higuera on 8/3/22.
//

import Foundation
import CryptoKit

protocol MarvelListWorkerProtocol{
    func getCharacters(url: String , completion: @escaping(Result<Data, Error>) -> Void)
}

final class MarvelListWorker: MarvelListWorkerProtocol{
    private let client = Client()
    private let publicKey = "906504309dcf1eed50079cc7903cac3e"
    private let privateKey = "f0f09e48930c17a7fdc2ff965301d7906edb146c"
    
    
    func getCharacters(url: String ,completion: @escaping (Result<Data, Error>) -> Void) {
            let url = MD5Auth.buildURl(url: url)
                    
            if let apiUrl = URL(string: url) {
                client.get(url: apiUrl) { result -> Void in
                    completion(result)
                }
            }
        }
    
}

