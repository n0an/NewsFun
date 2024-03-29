//
//  ViewController.swift
//  NewsFun
//
//  Created by nag on 03/06/2019.
//  Copyright © 2019 Anton Novoselov. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, Storyboarded {

    @IBOutlet weak var tableView: UITableView!
    
    weak var coordinator: MainCoordinator?
    
    var news: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getArticles()
        
        tableView.separatorStyle = .none
    }
    
    func getArticles() {
        NewsManager.shared.getArticles { (articles) in
            
            self.news = articles
            self.tableView.reloadData()
        }
    }

    @IBAction func refreshTapped(_ sender: Any) {
        getArticles()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let article = news[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ArticleCell
        
        cell.captionLabel.text = article.title
        cell.categoryLabel.text = article.category.rawValue
        cell.categoryLabel.backgroundColor = article.categoryColor
        
        let url = URL(string: article.urlToImage)
        
        cell.articleImageView.kf.setImage(with: url)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let article = self.news[indexPath.row]
        
        coordinator?.showWebView(with: article)
    }
}

