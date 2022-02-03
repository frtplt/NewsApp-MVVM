//
//  ArticleTableViewCell.swift
//  NewsApp-MVVM
//
//  Created by Firat on 23.01.2022.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var newsImage: UIImageView!
    
    
    func setupCell(withArticle article: Article) {
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        newsImage.kf.setImage(with: URL(string: article.urlToImage))
        }
    }

