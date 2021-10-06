//
//  Meal.swift
//  FetchRewards
//
//  Created by Tatsuya Moriguchi on 10/5/21.
//  Copyright © 2021 Tatsuya Moriguchi. All rights reserved.
//

import UIKit

class Meals: Codable {
    var meals = [Meal]()
    // Without (), Xcode throws errors "Meals does not conform to protcol 'Decodable' 'Encodable', Cannot assign value of type [Meal] to type [Meal].Type

    init(meals: [Meal]) {
        self.meals = meals
    }
    
}

class Meal: Codable {
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?
    
    init(strMeal: String, strMealThumb: String, idMeal: String?) {
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb
        self.idMeal = idMeal
    }

}

/*
 {
 ⁃      "meals": [
 ⁃        {
 ⁃          "strMeal": "Beef and Mustard Pie",
 ⁃          "strMealThumb": "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
 ⁃          "idMeal": "52874"
 ⁃        },
 ⁃        {
 ⁃          "strMeal": "Beef and Oyster pie",
 ⁃          "strMealThumb": "https://www.themealdb.com/images/media/meals/wrssvt1511556563.jpg",
 ⁃          "idMeal": "52878"
 ⁃        },
 
 */
