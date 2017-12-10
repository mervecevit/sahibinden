//
//  Scoin.swift
//  sahibinden
//
//  Created by Merve Ecevit on 10/12/17.
//

import UIKit

struct Scoins: Decodable{

    let pastScoin: [Scoin]?
    
    static func fetchPastScoins(_ completionHandler: @escaping ([Scoin]) -> ()) {
        
        let urlString = "https://devakademi.sahibinden.com/history"
        
        URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { (data, response, error) -> Void in
            
            guard let data = data else { return }
            
            if let error = error {
                print(error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let pastScoins = try decoder.decode([Scoin].self, from: data)
                
                
                DispatchQueue.main.async(execute: { () -> Void in
                    completionHandler(pastScoins)
                })
            } catch let err {
                print(err)
            }
            
        }) .resume()
        
    }
}

struct Scoin: Decodable {
    var date: Double!
    var value: Double!
    
    static func fetchCurrentScoin(_ completionHandler: @escaping (Scoin) -> ()) {
        
        let urlString = "https://devakademi.sahibinden.com/ticker"
        
        URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { (data, response, error) -> Void in
            
            guard let data = data else { return }
            
            if let error = error {
                print(error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let currentScoin = try decoder.decode(Scoin.self, from: data)
                
                DispatchQueue.main.async(execute: { () -> Void in
                    completionHandler(currentScoin)
                })
                
            } catch let err {
                print(err)
            }
            
        }) .resume()
        
    }
}
