//
//  NetworkService.swift
//  swiftbook1
//
//  Created by admin on 22/09/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//

import Foundation
import UIKit

class NetworkService {
    // построение запроса данных по  url
    func request(searchTerm: String, completion: (Data?, Error?) -> Void){
        let parameters = self.prepareParametrs(searchTerm: searchTerm)
        let url = self.url(params: parameters)
        
    }
    private func prepareParametrs(searchTerm: String?) -> [String:String]{
        var parameters = [String: String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(30)
        return parameters
    }
    
    
    // MARK: -- Создание URL и API
    private func url(params:[String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map{ URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
}
