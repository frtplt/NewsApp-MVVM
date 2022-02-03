//
//  WebService.swift
//  NewsApp-MVVM
//
//  Created by Firat on 23.01.2022.
//

import Foundation

protocol WebServiceProtocol {
    func getArticles(completion: @escaping (Result<[Article], Error>) -> Void)
}

class WebService: WebServiceProtocol {
    enum NetworkError: Error {
        case decoding
        case networking(Error?)
    }
    
    func getArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=998cf5debc8c4fe4b2845144197a30ad")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(NetworkError.networking(error)))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.networking(error)))
                return
            }
            
            do {
                let articleList = try JSONDecoder().decode(ArticleList.self,from: data)
                completion(.success(articleList.articles))
            } catch {
                completion(.failure(NetworkError.decoding))
            }
        }.resume()
    }
}

