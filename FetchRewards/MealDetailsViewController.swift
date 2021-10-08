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
    @IBOutlet weak var strYoutubeButton: UIButton!
    @IBAction func strYoutubeButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: strYoutube!)! as URL, options: [:], completionHandler: nil)
    }


    /*
     UIButton.alpha = 0 or 1 to hide or show
     
     if let isThereData = strImageSource {
        UIButton.alpha = 1
     } else {
        UIButton.alpha = 0
     }
     
     */



    @IBOutlet weak var strInstructionsTextView: UITextView!
    @IBOutlet weak var strIngredientsstrMeasureTextView: UITextView!
    
    var strMealThumb: String?
    var idMeal: String?
    var strMeal: String?
    var strDrinkAlternate: String?
    var strCategory: String?
    var strArea: String?
    var strTags: String?
    //dateModifiedLabel.text =
    var strCreativeCommonsConfirmed: String?
    var strImageSource: String?
    var strSource: String?
    var strYoutube: String?
    var strInstructions: String?
    var strIngredient1: String?
    
    
    
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
                    
                    
                    if let imageURL = URL(string: item.strMealThumb ?? "No Image Available") {
                        DispatchQueue.global().async {
                            guard let data = try? Data(contentsOf: imageURL) else { return }
                            let image = UIImage(data: data)
                            
                            DispatchQueue.main.sync {
                                self.strMealThumbImageView.image = image
                            }
                        }
                    }

                    self.idMeal = item.idMeal
                    self.strMeal = item.strMeal
                    self.strDrinkAlternate = item.strDrinkAlternate
                    self.strCategory = item.strCategory
                    self.strArea = item.strArea
                    self.strTags = item.strTags
                    //self.dateModifiedLabel.text =
                    self.strCreativeCommonsConfirmed = item.strCreativeCommonsConfirmed
                    self.strImageSource = item.strImageSource
                    
                    
                    self.strSource = item.strSource
                    self.strYoutube = item.strYoutube
                    
                    
                    self.strInstructions = item.strInstructions
                    //self.strIngredientsstrMeasure = item.strIngredient1


                    DispatchQueue.main.async {
                        self.idMealLabel.text = self.idMeal
                        self.strMealLabel.text = self.strMeal
                        self.strDrinkAlternateLabel.text = self.strDrinkAlternate
                        self.strCategoryLabel.text = self.strCategory
                        self.strAreaLabel.text = self.strArea
                        self.strTagsLabel.text = self.strTags
                        //self.dateModifiedLabel.text =
                        self.strCreativeCommonsConfirmedLabel.text = self.strCreativeCommonsConfirmed
                        self.strImageSourceLabel.text = self.strImageSource
                        
                        
                        self.strSourceLabel.text = self.strSource
                        
                        self.strYoutubeLabel.text = self.strYoutube
                        
                        self.strYoutubeButton.setTitle(self.strYoutube, for: .normal)
                        print("strYoutube: \(String(describing: self.strYoutube))")
                        
                        func strYoutubeButton(_ sender: UIButton) {
                            UIApplication.shared.open(URL(string: self.strYoutube!)! as URL, options: [:], completionHandler: nil)
                        }
                        
                        self.strInstructionsTextView.text = self.strInstructions
                        //self.strIngredientsstrMeasureTextView.text = self.strIngredient1
                        
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
        
        downloadJson()
        
        
        
//        if strYoutube == nil {
//            strYoutubeButton.alpha = 0
//        } else {
//            strYoutubeButton.alpha = 1
//        }

        
    }
    
    
    
    

}
