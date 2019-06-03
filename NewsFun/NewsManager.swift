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
                        
                        var article = Article(title: title, urlToImage: urlToImage, url: url, description: description, category: "")
                        
                        article.category = DocumentClassifier().classify(article.description + " " + article.title)?.prediction.category.rawValue ?? ""
                        
                        articles.append(article)
                        
                        let classifier = DocumentClassifier()
                        let prediction = classifier.classify(article.description + " " + article.title)?.prediction
//                        print(title)
//                        print(prediction?.category.rawValue)
                        
                    }
                    
                    completion(articles)
                    
                }
            }
        }
    }
}
