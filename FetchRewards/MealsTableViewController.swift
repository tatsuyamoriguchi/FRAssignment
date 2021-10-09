//
//  MealsTableViewController.swift
//  FetchRewards
//
//  Created by Tatsuya Moriguchi on 10/5/21.
//  Copyright © 2021 Tatsuya Moriguchi. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController {

            
    var url: URL!
    let idMeal: String = ""

    
    // Define a local array for TableView
    var localMeals = [Meal]()
    
    func downloadJson() {
        
        guard let downloadUrl = url else { return }
        URLSession.shared.dataTask(with: downloadUrl) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Erro occred.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let downloadedMeals = try decoder.decode(Meals.self, from: data)
                
                self.localMeals = downloadedMeals.meals.sorted { $0.strMeal ?? "" < $1.strMeal ?? "" } // strMeal? in Meal class (See Meal.swift) causes an error here: 'Binary operator '<' cannot be applied to two 'String?' operands'
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print("Something went wrong after downloading.")
            }
            
            
            }.resume()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadJson()

      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return localMeals.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealsCell", for: indexPath) as? MealsTableViewCell else { return UITableViewCell() }
        
        cell.idMealLabel.text = localMeals[indexPath.row].idMeal
        cell.strMealLabel.text = localMeals[indexPath.row].strMeal
        
        if let imageURL = URL(string: localMeals[indexPath.row].strMealThumb ?? "No Image Available") {
            DispatchQueue.global().async {
                guard let data = try? Data(contentsOf: imageURL) else { return }
                let image = UIImage(data: data)
                    DispatchQueue.main.sync {
                        cell.strMealThumbImageView.image = image
                    }
            }
                
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let idMealForURL = localMeals[indexPath.row].idMeal {
        urlToPassForMealDetails = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + idMealForURL)
        performSegue(withIdentifier: "toMealDetails", sender: nil)
        } else { print("idMail was nil?")}
    }
    
    var idMealForURL: String?



    
    // MARK: - Navigation
     // To pass idCategory value to segue
     var urlToPassForMealDetails: URL?
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMealDetails", let destination = segue.destination as? MealDetailsViewController {
            destination.url = urlToPassForMealDetails
            //destination.idMeal = idMealForURL
            print("urlToPassForMealDetails: \(String(describing: urlToPassForMealDetails))")
            
        }

        
        
        
    }
    

}
