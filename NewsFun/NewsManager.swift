//
//  NewsManager.swift
//  NewsFun
//
//  Created by nag on 03/06/2019.
//  Copyright © 2019 Anton Novoselov. All rights reserved.
//

import Foundation
import Alamofire
import DocumentClassifier

class NewsManager {
    static let shared = NewsManager()
    
    private init() {}
    
    func getArticles(completion: @escaping ([Article]) -> ()) {
        Alamofire.request("https://newsapi.org/v2/top-headlines?country=us&apiKey=0e6b77450d554b0b809d679b98d66394").responseJSON { (response) in
            
            if let json = response.result.value as? [String: Any] {
                
                if let jsonArticles = json["articles"] as? [[String: Any]] {
                    
                    var articles = [Article]()
                    
                    for jsonArticle in jsonArticles {
                        
                        guard let title = jsonArticle["title"] as? String,
                        let urlToImage = jsonArticle["urlToImage"] as? String,
                        let url = jsonArticle["url"] as? String,
                        let description = jsonArticle["description"] as? String else { continue }
                        
                        var article = Article(title: title, urlToImage: urlToImage, url: url, description: description, category: .business, categoryColor: .red)
                        
                        let classifier = DocumentClassifier()
                        guard let classification = classifier.classify(description + " " + title) else { continue }
                        
                        switch classification.prediction.category {
                        case .business:
                            article.category = .business
                            article.categoryColor = #colorLiteral(red: 0.9712339449, green: 0.7909381754, blue: 0.7903050474, alpha: 1)

                        case .entertainment:
                            article.category = .entertainment
                            article.categoryColor = #colorLiteral(red: 0.4219700981, green: 0.8855112887, blue: 0.130600521, alpha: 1)

                        case .sports:
                            article.category = .sports
                            article.categoryColor = #colorLiteral(red: 0.938082443, green: 0.9712339449, blue: 0.5952478299, alpha: 1)

                        case .politics:
                            article.category = .politics
                            article.categoryColor = #colorLiteral(red: 0.7060737717, green: 0.9712339449, blue: 0.9673998652, alpha: 1)

                        case .technology:
                            article.category = .technology
                            article.categoryColor = #colorLiteral(red: 0.8432022172, green: 0.8440583058, blue: 0.9712339449, alpha: 1)

                        }
                        
                        articles.append(article)
                        
                    }
                    
                    completion(articles)
                    
                }
            }
        }
    }
}
