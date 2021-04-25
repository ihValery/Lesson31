//
//  NetworkDataFetcher.swift
//  Lesson31Map
//
//  Created by Валерий Игнатьев on 24.04.21.
//

import Foundation

protocol DataFetcher {
    
    func fetchJSON<T: Decodable>(urlString: String, completionResponse: @escaping (T?) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    
    var networking: Networking
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }
    
    ///Generic to fetch JSON
    func fetchJSON<T: Decodable>(urlString: String, completionResponse: @escaping (T?) -> Void) {
        networking.requestDataUrl(urlString: urlString) { data, error in
            guard error == nil, let data = data else {
                print(error?.localizedDescription ?? Const.Error.problem)
                return
            }
                let decoded = self.decodeJSON(type: T.self, data: data)
                completionResponse(decoded)
        }
    }
    
    ///Generic to parse JSON
    private func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        guard let data = data else { return nil }
        do {
            let response = try JSONDecoder().decode(type.self, from: data)
            return response
        } catch let errorJson {
            print(Const.Error.dontParse, errorJson)
            return nil
        }
    }
}
