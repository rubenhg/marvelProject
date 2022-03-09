//
//  MD5Auth.swift
//  MarvelProject
//
//  Created by Ruben Higuera on 8/3/22.
//

import Foundation
import CryptoKit

class MD5Auth{
    //ts - a timestamp (or other long string which can change on a request-by-request basis)
    //hash - a md5 digest of the ts parameter, your private key and your public key (e.g. md5(ts+privateKey+publicKey)
    //For example: http://gateway.marvel.com/v1/public/comics?ts=1&apikey=1234&hash=ffd275c5130566a2916217b101f26150 
    
    static func buildURl(url: String) -> String {
        let ts = 30
        let publicKey = "505ea7d44709a9e85ef32c69a56cb2c7"
        let privateKey = "72f8aaf9a1999ccc0a4e2bbe277db8dba3b98135"
        let buildHas = "\(ts)\(privateKey)\(publicKey)"
        //the hash value is the md5 digest of ts,publickey,privatekey
        let hash = MD5(string: buildHas)
           
           return "\(url)?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
       }
       
    static func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
           
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
