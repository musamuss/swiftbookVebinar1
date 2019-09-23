//
//  NetworkDataFetcher.swift
//  swiftbook1
//
//  Created by Муса Дениев on 23.09.2019.
//  Copyright © 2019 musamuss. All rights reserved.
//

import Foundation
class NetworkDataFetcher{
    var networkService = NetworkService()
    func getImages(searchTerm: String, completion: @escaping (SearchResults?) -> ()){
        networkService.request(searchTerm: searchTerm) { (data, error) in
            if let error = error {
                print("Error\(error.localizedDescription)")
                completion(nil)
            }
            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decode)
        }
    }
    // MARL:- прием JAON любой модели подписанной под декодабл
    func decodeJSON< T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else{return nil}
        do{
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError{
            print("error Json decode", jsonError)
            return nil
        }
        
    }
    
}
