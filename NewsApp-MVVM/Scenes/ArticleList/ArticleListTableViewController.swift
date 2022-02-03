//
//  NewsTableViewController.swift
//  NewsApp-MVVM
//
//  Created by Firat on 23.01.2022.
//

import Foundation
import UIKit
import SafariServices

class ArticleListTableViewController: UITableViewController {
    
    var articleListViewModel: ArticleListViewModel? {
        didSet {
            articleListViewModel?.delegate = self
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        articleListViewModel?.getArticles()
    }
    
    private func setup(){
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
    }
    
    // MARK: - TableView Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return articleListViewModel?.numberOfSection ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListViewModel?.numberOfRowInSection(section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        if let article = articleListViewModel?.articleAtIndex(indexPath.row) {
            cell.setupCell(withArticle: article)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        articleListViewModel?.selectArticle(withIndex: indexPath.row)
    }
}
        
extension ArticleListTableViewController:  ArticleListViewModelDelegate {
    func navigateToSafari(withURL url: URL) {
        let viewController = SFSafariViewController(url: url)
        present(viewController, animated: true)
    }
    
    func reloadItems() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
    
    
    
    
    
    

