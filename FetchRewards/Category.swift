//
//  Category.swift
//  FetchRewards
//
//  Created by Tatsuya Moriguchi on 10/3/21.
//  Copyright © 2021 Tatsuya Moriguchi. All rights reserved.
//

import UIKit

class Categories: Codable {
    let categories: [Category]
    
    init(categories: [Category]) {
        self.categories = categories
    }
}


class Category: Codable {
    
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String

    init(idCategory: String, strCategory: String, strCategoryThumb: String, strCategoryDescription: String) {
        self.idCategory = idCategory
        self.strCategory = strCategory
        self.strCategoryThumb = strCategoryThumb
        self.strCategoryDescription = strCategoryDescription
    }

}
