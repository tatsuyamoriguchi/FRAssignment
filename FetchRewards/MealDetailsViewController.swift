//
//  MealDetailsViewController.swift
//  FetchRewards
//
//  Created by Tatsuya Moriguchi on 10/7/21.
//  Copyright © 2021 Tatsuya Moriguchi. All rights reserved.
//

import UIKit

class MealDetailsViewController: UIViewController {

    @IBOutlet weak var strMealThumbImageView: UIImageView!
    
    @IBOutlet weak var idMealLabel: UILabel!
    @IBOutlet weak var strMealLabel: UILabel!
    @IBOutlet weak var strDrinkAlternateLabel: UILabel!
    @IBOutlet weak var strCategoryLabel: UILabel!
    @IBOutlet weak var strAreaLabel: UILabel!
    @IBOutlet weak var strTagsLabel: UILabel!
    @IBOutlet weak var dateModifiedLabel: UILabel!
    @IBOutlet weak var strCreativeCommonsConfirmedLabel: UILabel!
    
    @IBOutlet weak var strImageSourceLabel: UILabel!
    @IBOutlet weak var strSourceLabel: UILabel!
    @IBOutlet weak var strYoutubeLabel: UILabel!
    @IBOutlet weak var strInstructionsTextView: UITextView!
    @IBOutlet weak var strIngredientsstrMeasureTextView: UITextView!
    
    
    var idMeal: String?
    var strMeal: String?
    var strDrinkAlternate: String?
    var strCategory: String?
//    strArea
//    strTags
//    //dateModifiedLabel.text =
//    strCreativeCommonsConfirmed
//    strImageSourece
//    strSource
//    strYoutube
//    strInstructions
//    strIngredient1
    
    
    
    var url: URL!
    //var idMeal: String!
    
    var localMealDetails = [MealDetails]()
    
    func downloadJson() {
        guard let downloadUrl = url else { return }
        URLSession.shared.dataTask(with: downloadUrl) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Erro occured.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let downloadedMealDetails = try decoder.decode(MealDetailsList.self, from: data)

                
                for item in downloadedMealDetails.meals {
                    
                    self.idMeal = item.idMeal
                    self.strMeal = item.strMeal
                    self.strDrinkAlternate = item.strDrinkAlternate
                    self.strCategory = item.strCategory
//                    print("\(String(describing: item.idMeal))")
//                    print("\(String(describing: item.strMeal))")
//                    print("\(String(describing: item.strArea))")
//                    print("\(String(describing: item.strIngredient1))")


                    DispatchQueue.main.async {
                    print("idMeal: \(String(describing: self.idMeal))")
                    self.idMealLabel.text = self.idMeal
                    self.strMealLabel.text = self.strMeal
                    self.strDrinkAlternateLabel.text = self.strDrinkAlternate
                    self.strCategoryLabel.text = self.strCategory
                    }
                }
                
                
                self.localMealDetails = downloadedMealDetails.meals
                


                
                                
            } catch {
                print("Something went wrong after downloading.")
            }
            
            
            }.resume()
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Meal Details"

         
//        DispatchQueue.main.sync {
//            self.downloadJson()
//        }
        downloadJson()
        
               
           
//            print("idMeal: \(String(describing: idMeal))")
//            idMealLabel.text = idMeal
//            strMealLabel.text = strMeal
//            strDrinkAlternateLabel.text = strDrinkAlternate
//            strCategoryLabel.text = strCategory
        
        
//        for item in localMealDetails {
//            idMealLabel.text = item.idMeal
//            strMealLabel.text = item.strMeal
//            strDrinkAlternateLabel.text = item.strDrinkAlternate
//            strCategoryLabel.text = item.strCategory
//            strAreaLabel.text = item.strArea
//            strTagsLabel.text = item.strTags
//            //dateModifiedLabel.text =
//            strCreativeCommonsConfirmedLabel.text = item.strCreativeCommonsConfirmed
//            strImageSourceLabel.text = item.strImageSourece
//            strSourceLabel.text = item.strSource
//            strYoutubeLabel.text = item.strYoutube
//            strInstructionsTextView.text = item.strInstructions
//            strIngredientsstrMeasureTextView.text = item.strIngredient1
//        }
        
    }
    
    
    
    

}
