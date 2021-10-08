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
    @IBOutlet weak var striInstructionsTextView: UITextView!
    @IBOutlet weak var strIngredientsstrMeasureTextView: UITextView!
    
    
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
                    print("\(String(describing: item.idMeal))")
                    print("\(String(describing: item.strMeal))")
                }
//                self.localMealDetails = downloadedMealDetails.meals
//
//                print(self.localMealDetails)
//

                
                                
            } catch {
                print("Something went wrong after downloading.")
            }
            
            
            }.resume()
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Meal Details"

        downloadJson()
        
        //idMealLabel.text = downloadedMealDetails.
    }
    
    
    
    

}
