//
//  Article.swift
//  NewsApp-MVVM
//
//  Created by Firat on 23.01.2022.
//

import Foundation

struct ArticleList: Codable{
    var articles: [Article]
}

struct Article: Codable {
    
    var urlToImage: String
    var title: String
    var description: String
    var url: String
}
