//
//  MealDetails.swift
//  FetchRewards
//
//  Created by Tatsuya Moriguchi on 10/6/21.
//  Copyright © 2021 Tatsuya Moriguchi. All rights reserved.
//

import UIKit

class MealDetailsList: Codable {
    var meals = [MealDetails]()

    init(meals: [MealDetails]) {
        self.meals = meals
    }

}

class MealDetails: Codable {
    let idMeal: String?
    let strMeal: String?
    let strCategory: String?
    let strArea: String?
    let strDrinkAlternate: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
    
    
    init(
    idMeal: String,
    strMeal: String,
    strCategory: String,
    strArea: String,
    strDrinkAlternate: String,
    strInstructions: String,
    strMealThumb: String,
    strTags: String,
     strYoutube: String,
     strIngredient1: String,
     strIngredient2: String,
     strIngredient3: String,
     strIngredient4: String,
     strIngredient5: String,
     strIngredient6: String,
     strIngredient7: String,
     strIngredient8: String,
     strIngredient9: String,
     strIngredient10: String,
     strIngredient11: String,
     strIngredient12: String,
     strIngredient13: String,
     strIngredient14: String,
     strIngredient15: String,
     strIngredient16: String,
     strIngredient17: String,
     strIngredient18: String,
     strIngredient19: String,
     strIngredient20: String,
     strMeasure1: String,
     strMeasure2: String,
     strMeasure3: String,
     strMeasure4: String,
     strMeasure5: String,
     strMeasure6: String,
     strMeasure7: String,
     strMeasure8: String,
     strMeasure9: String,
     strMeasure10: String,
     strMeasure11: String,
     strMeasure12: String,
     strMeasure13: String,
     strMeasure14: String,
     strMeasure15: String,
     strMeasure16: String,
     strMeasure17: String,
     strMeasure18: String,
     strMeasure19: String,
     strMeasure20: String,
     strSource: String,
     strImageSource: String,
     strCreativeCommonsConfirmed: String,
     dateModified: String)  {
        
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strCategory = strCategory
        self.strArea = strArea
        self.strDrinkAlternate = strDrinkAlternate
        self.strInstructions = strInstructions
        self.strMealThumb = strMealThumb
        self.strTags = strTags
        self.strYoutube = strYoutube
        self.strIngredient1 = strIngredient1
         self.strIngredient2 = strIngredient2
         self.strIngredient3 = strIngredient3
         self.strIngredient4 = strIngredient4
         self.strIngredient5 = strIngredient5
         self.strIngredient6 = strIngredient6
         self.strIngredient7 = strIngredient7
         self.strIngredient8 = strIngredient8
         self.strIngredient9 = strIngredient9
         self.strIngredient10 = strIngredient10
         self.strIngredient11 = strIngredient11
         self.strIngredient12 = strIngredient12
         self.strIngredient13 = strIngredient13
         self.strIngredient14 = strIngredient14
         self.strIngredient15 = strIngredient15
         self.strIngredient16 = strIngredient16
         self.strIngredient17 = strIngredient17
         self.strIngredient18 = strIngredient18
         self.strIngredient19 = strIngredient19
         self.strIngredient20 = strIngredient20
         self.strMeasure1 = strMeasure1
         self.strMeasure2 = strMeasure2
         self.strMeasure3 = strMeasure3
         self.strMeasure4 = strMeasure4
         self.strMeasure5 = strMeasure5
         self.strMeasure6 = strMeasure6
         self.strMeasure7 = strMeasure7
         self.strMeasure8 = strMeasure8
         self.strMeasure9 = strMeasure9
         self.strMeasure10 = strMeasure10
         self.strMeasure11 = strMeasure11
         self.strMeasure12 = strMeasure12
         self.strMeasure13 = strMeasure13
         self.strMeasure14 = strMeasure14
         self.strMeasure15 = strMeasure15
         self.strMeasure16 = strMeasure16
         self.strMeasure17 = strMeasure17
         self.strMeasure18 = strMeasure18
         self.strMeasure19 = strMeasure19
         self.strMeasure20 = strMeasure20
        self.strSource = strSource
         self.strImageSource = strImageSource
         self.strCreativeCommonsConfirmed = strCreativeCommonsConfirmed
        self.dateModified = dateModified
     }
}





/*Access an endpoint: https://www.themealdb.com/api/json/v1/1/lookup.php?i=52874
⁃    {
⁃      "meals": [
⁃        {
⁃          "idMeal": "52874",
⁃          "strMeal": "Beef and Mustard Pie",
⁃          "strDrinkAlternate": null,
⁃          "strCategory": "Beef",
⁃          "strArea": "British",
⁃          "strInstructions": "Preheat the oven to 150C/300F/Gas 2.\r\nToss the beef and flour together in a bowl with some salt and black pepper.\r\nHeat a large casserole until hot, add half of the rapeseed oil and enough of the beef to just cover the bottom of the casserole.\r\nFry until browned on each side, then remove and set aside. Repeat with the remaining oil and beef.\r\nReturn the beef to the pan, add the wine and cook until the volume of liquid has reduced by half, then add the stock, onion, carrots, thyme and mustard, and season well with salt and pepper.\r\nCover with a lid and place in the oven for two hours.\r\nRemove from the oven, check the seasoning and set aside to cool. Remove the thyme.\r\nWhen the beef is cool and you're ready to assemble the pie, preheat the oven to 200C/400F/Gas 6.\r\nTransfer the beef to a pie dish, brush the rim with the beaten egg yolks and lay the pastry over the top. Brush the top of the pastry with more beaten egg.\r\nTrim the pastry so there is just enough excess to crimp the edges, then place in the oven and bake for 30 minutes, or until the pastry is golden-brown and cooked through.\r\nFor the green beans, bring a saucepan of salted water to the boil, add the beans and cook for 4-5 minutes, or until just tender.\r\nDrain and toss with the butter, then season with black pepper.\r\nTo serve, place a large spoonful of pie onto each plate with some green beans alongside.",
⁃          "strMealThumb": "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
⁃          "strTags": "Meat,Pie",
⁃          "strYoutube": "https://www.youtube.com/watch?v=nMyBC9staMU",
⁃          "strIngredient1": "Beef",
⁃          "strIngredient2": "Plain Flour",
⁃          "strIngredient3": "Rapeseed Oil",
⁃          "strIngredient4": "Red Wine",
⁃          "strIngredient5": "Beef Stock",
⁃          "strIngredient6": "Onion",
⁃          "strIngredient7": "Carrots",
⁃          "strIngredient8": "Thyme",
⁃          "strIngredient9": "Mustard",
⁃          "strIngredient10": "Egg Yolks",
⁃          "strIngredient11": "Puff Pastry",
⁃          "strIngredient12": "Green Beans",
⁃          "strIngredient13": "Butter",
⁃          "strIngredient14": "Salt",
⁃          "strIngredient15": "Pepper",
⁃          "strIngredient16": "",
⁃          "strIngredient17": "",
⁃          "strIngredient18": "",
⁃          "strIngredient19": "",
⁃          "strIngredient20": "",
⁃          "strMeasure1": "1kg",
⁃          "strMeasure2": "2 tbs",
⁃          "strMeasure3": "2 tbs",
⁃          "strMeasure4": "200ml",
⁃          "strMeasure5": "400ml",
⁃          "strMeasure6": "1 finely sliced",
⁃          "strMeasure7": "2 chopped",
⁃          "strMeasure8": "3 sprigs",
⁃          "strMeasure9": "2 tbs",
⁃          "strMeasure10": "2 free-range",
⁃          "strMeasure11": "400g",
⁃          "strMeasure12": "300g",
⁃          "strMeasure13": "25g",
⁃          "strMeasure14": "pinch",
⁃          "strMeasure15": "pinch",
⁃          "strMeasure16": "",
⁃          "strMeasure17": "",
⁃          "strMeasure18": "",
⁃          "strMeasure19": "",
⁃          "strMeasure20": "",
⁃          "strSource": "https://www.bbc.co.uk/food/recipes/beef_and_mustard_pie_58002",
⁃          "strImageSource": null,
⁃          "strCreativeCommonsConfirmed": null,
⁃          "dateModified": null
⁃        }
⁃      ]

 */
