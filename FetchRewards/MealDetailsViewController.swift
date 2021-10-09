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
 
    @IBOutlet weak var strImageSourceButton: UIButton!
    @IBAction func strImageSourceButton(_ sender: Any) {
        UIApplication.shared.open(URL(string: self.strImageSource!)! as URL, options: [:], completionHandler: nil)
    }

    @IBOutlet weak var strSourceButton: UIButton!
    @IBAction func strSourceButton(_ sender: Any) {
          UIApplication.shared.open(URL(string: self.strSource!)! as URL, options: [:], completionHandler: nil)
    }
    
    @IBOutlet weak var strYoutubeButton: UIButton!
        
    @IBAction func strYoutubeButton(_ sender: Any) {
    UIApplication.shared.open(URL(string: self.strYoutube!)! as URL, options: [:], completionHandler: nil)
    }


    @IBOutlet weak var strInstructionsTextView: UITextView!
    @IBOutlet weak var strIngredientsstrMeasureTextView: UITextView!
    
    // Properties to store JSON values
    var strMealThumb: String?
    var idMeal: String?
    var strMeal: String?
    var strDrinkAlternate: String?
    var strCategory: String?
    var strArea: String?
    var strTags: String?
    var dateModified: String?
    var strCreativeCommonsConfirmed: String?

    // External links
    var strImageSource: String?
    var strSource: String?
    var strYoutube: String?

    // Instructions
    var strInstructions: String?

    // Ingredients
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    
    // Measure
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    

    // url to get  JSON data
    var url: URL!
 
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
                    
                    // To convert string to URL type
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
 
                    self.dateModified = item.dateModified
                    print("self.dateModified: \(String(describing: self.dateModified))")
                    
                    self.strCreativeCommonsConfirmed = item.strCreativeCommonsConfirmed
                    self.strImageSource = item.strImageSource
                    self.strSource = item.strSource
                    self.strYoutube = item.strYoutube
                    self.strInstructions = item.strInstructions
                    self.strIngredient1 = item.strIngredient1
                    self.strIngredient2 = item.strIngredient2
                    self.strIngredient3 = item.strIngredient3
                    self.strIngredient4 = item.strIngredient4
                    self.strIngredient5 = item.strIngredient5
                    self.strIngredient6 = item.strIngredient6
                    self.strIngredient7 = item.strIngredient7
                    self.strIngredient8 = item.strIngredient8
                    self.strIngredient9 = item.strIngredient9
                    self.strIngredient10 = item.strIngredient10
                    self.strIngredient11 = item.strIngredient11
                    self.strIngredient12 = item.strIngredient12
                    self.strIngredient13 = item.strIngredient13
                    self.strIngredient14 = item.strIngredient14
                    self.strIngredient15 = item.strIngredient15
                    self.strIngredient16 = item.strIngredient16
                    self.strIngredient17 = item.strIngredient17
                    self.strIngredient18 = item.strIngredient18
                    self.strIngredient19 = item.strIngredient19
                    self.strIngredient20 = item.strIngredient20
                    
                    self.strMeasure1 = item.strMeasure1
                    self.strMeasure2 = item.strMeasure2
                    self.strMeasure3 = item.strMeasure3
                    self.strMeasure4 = item.strMeasure4
                    self.strMeasure5 = item.strMeasure5
                    self.strMeasure6 = item.strMeasure6
                    self.strMeasure7 = item.strMeasure7
                    self.strMeasure8 = item.strMeasure8
                    self.strMeasure9 = item.strMeasure9
                    self.strMeasure10 = item.strMeasure10
                    self.strMeasure11 = item.strMeasure11
                    self.strMeasure12 = item.strMeasure12
                    self.strMeasure13 = item.strMeasure13
                    self.strMeasure14 = item.strMeasure14
                    self.strMeasure15 = item.strMeasure15
                    self.strMeasure16 = item.strMeasure16
                    self.strMeasure17 = item.strMeasure17
                    self.strMeasure18 = item.strMeasure18
                    self.strMeasure19 = item.strMeasure19
                    self.strMeasure20 = item.strMeasure20
                    
                    
                    DispatchQueue.main.async {
                        self.idMealLabel.text = self.idMeal
                        self.strMealLabel.text = self.strMeal
                        self.strDrinkAlternateLabel.text = self.strDrinkAlternate
                        self.strCategoryLabel.text = self.strCategory
                        self.strAreaLabel.text = self.strArea
                        self.strTagsLabel.text = self.strTags
                        self.dateModifiedLabel.text = self.dateModified
                        self.strCreativeCommonsConfirmedLabel.text = self.strCreativeCommonsConfirmed

                        // Hide strImageSourceButton if "" or nil
                        if self.strImageSource == "" || self.strImageSource ==  nil {
                            self.strImageSourceButton.alpha = 0
                        } else {
                            self.strImageSourceButton.setTitle("Image", for: .normal)
                            self.strImageSourceButton.alpha = 1
                        }

                        // Hide strSourceButton if "" or nil
                        if self.strSource == "" || self.strSource == nil {
                            self.strSourceButton.alpha = 0
                        } else {
                            self.strSourceButton.setTitle("Source", for: .normal)
                            self.strSourceButton.alpha = 1
                        }

                        // Hide strYoutubeButton if "" or nil
                        if self.strYoutube == "" || self.strYoutube == nil {
                            self.strYoutubeButton.alpha = 0
                            self.strYoutubeButton.setTitle("No link", for: .normal)
                        } else {
                            self.strYoutubeButton.setTitle("YouTube", for: .normal)
                            self.strYoutubeButton.alpha = 1
                        }
                        
                        
                        self.strInstructionsTextView.text = self.strInstructions
                        
                        // Array to store all ingredient data in order
                        let arrayIngredients = [
                            self.strIngredient1, self.strIngredient2, self.strIngredient3, self.strIngredient4, self.strIngredient5, self.strIngredient6, self.strIngredient7, self.strIngredient8, self.strIngredient9, self.strIngredient10, self.strIngredient11, self.strIngredient12, self.strIngredient13, self.strIngredient14, self.strIngredient15, self.strIngredient16, self.strIngredient17, self.strIngredient18, self.strIngredient19, self.strIngredient20
                        ]
                        
                        // Array to store all measure data in order
                        let arrayMeasure = [
                            self.strMeasure1, self.strMeasure2, self.strMeasure3, self.strMeasure4, self.strMeasure5, self.strMeasure6, self.strMeasure7, self.strMeasure8, self.strMeasure9, self.strMeasure10, self.strMeasure11, self.strMeasure12, self.strMeasure13, self.strMeasure14, self.strMeasure15, self.strMeasure16, self.strMeasure17, self.strMeasure18, self.strMeasure19, self.strMeasure20
                        ]
                       
                        self.strIngredientsstrMeasureTextView.insertText("\n")
                        // Iterate arrays to insert data to strIngredientsstrMeasureTextView
                        for i in 0...19 {
                           
                            if arrayIngredients[i] ==  "" || arrayIngredients[i] == nil {} else {

                                self.strIngredientsstrMeasureTextView.insertText(arrayIngredients[i] ?? "")
                                self.strIngredientsstrMeasureTextView.insertText(" : ")
                                self.strIngredientsstrMeasureTextView.insertText(arrayMeasure[i] ?? "")
                                self.strIngredientsstrMeasureTextView.insertText("\n")
                            }
                        }
                    }
                }
                
            } catch {
                print("Something went wrong after downloading.")
            }
            
            }.resume()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Meal Details"
        
        downloadJson()
        
    }
}
