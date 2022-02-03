//
//  ArticleViewModel.swift
//  NewsApp-MVVM
//
//  Created by Firat on 23.01.2022.
//

import Foundation

protocol ArticleListViewModelDelegate: AnyObject {
    func reloadItems()
    func navigateToSafari(withURL url: URL)
}

final class ArticleListViewModel {
    private var articles = [Article]()
    private var webService: WebServiceProtocol
    
    weak var delegate: ArticleListViewModelDelegate?
    
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }
    
    // TODO: Show loading
    
    func getArticles() {
        webService.getArticles() { result in
            switch result {
            case .success(let articles):
                self.articles.append(contentsOf: articles)
                self.delegate?.reloadItems()
            case .failure(let error):
                break
                // TODO: Show Error
            }
        }
    }
    
    func selectArticle(withIndex index: Int) {
        let urlString = articles[index].url
        guard let url = URL(string: urlString) else {
                  return
        }
        delegate?.navigateToSafari(withURL: url)
    }
}

extension ArticleListViewModel {
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowInSection (_ section: Int) -> Int {
        return articles.count
    }
    
    func articleAtIndex (_ index: Int) -> Article? {
        return articles[index]
    }
}
