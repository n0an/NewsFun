//
//  Article.swift
//  NewsFun
//
//  Created by nag on 03/06/2019.
//  Copyright © 2019 Anton Novoselov. All rights reserved.
//

import UIKit

struct Article {
    
    var title: String
    var urlToImage: String
    var url: String
    var description: String
    var category: NewsCategory = .business
    var categoryColor = UIColor.red
    
}

enum NewsCategory: String {
    case business = "📤 Business"
    case entertainment = "🍄 Entertainment"
    case politics = "👮‍♀️ Politics"
    case sports = "🎾 Sports"
    case technology = "💻 Technology"
}
