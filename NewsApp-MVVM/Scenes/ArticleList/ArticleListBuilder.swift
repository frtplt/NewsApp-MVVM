//
//  ArticleListBuilder.swift
//  NewsApp-MVVM
//
//  Created by Gökhan Namal on 2.02.2022.
//

import UIKit

final class ArticleListBuilder {
    static func make() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let navigationViewController = storyboard.instantiateInitialViewController() as? UINavigationController,
            let viewController = navigationViewController.topViewController as? ArticleListTableViewController else {
            fatalError("ArticleListTableViewController not found")
        }
        
        let webService = WebService()
        viewController.articleListViewModel = ArticleListViewModel(webService: webService)
        return navigationViewController
    }
}
