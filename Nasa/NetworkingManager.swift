//
//  NetworkingManager.swift
//  Nasa
//
//  Created by Чистяков Василий Александрович on 07.09.2021.
//

import Foundation

struct NetworkingManager {
    
    static let shared = NetworkingManager()
    private init() { }
    
    func fetchData(url: String, complitionHandler: @escaping (Nasa)-> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let json = try JSONDecoder().decode(Nasa.self, from: data)
                complitionHandler(json)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
