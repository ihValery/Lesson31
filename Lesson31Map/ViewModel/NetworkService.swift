//
//  NetworkService.swift
//  Lesson31Map
//
//  Created by Валерий Игнатьев on 24.04.21.
//

import Foundation

protocol Networking {
    
    func requestDataUrl(urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkService: Networking {
    
    ///Request given from our link
    func requestDataUrl(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        createDataTask(from: request, completion: completion).resume()
    }
    
    ///Create a DataTask and transfer it to an asynchronous block
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
