//
//  NetworkService.swift
//  swiftbook1
//
//  Created by admin on 22/09/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//

import UIKit
import Foundation


class NetworkService {
    // Mark: - построение запроса данных по  url
    func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void){
        let parameters = self.prepareParametrs(searchTerm: searchTerm)
        let url = self.url(params: parameters)
        var request = URLRequest(url:url)
        request.allHTTPHeaderFields = prepareHeaders()
        request.httpMethod = "get"
        let task = createDataTask(from: request, comletion: completion)
        task.resume()
        //print(url)
    }
    private func prepareHeaders() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorezation"] = "Client-ID 839ddb108b55fa7dc73f86e0376f2bad9053491bd9994c43e52a5f421b5b2678"
        
        return headers
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
    //MARK: - cоздаем запрос
    private func createDataTask(from request: URLRequest, comletion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                comletion(data,error)
            }
            
        }
    }
}
