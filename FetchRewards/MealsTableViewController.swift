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

//    let baseUrl = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
//    let stringUrl = baseUrl + strCategory // Use lazy to avoid an error "Cannot use instance member 'baseUrl' within property initializer; property initializers run before 'self' is available" BUT if placed within downloadJson(), no need to add 'lazy'
//    let url = URL(string: stringUrl)
    
        
//    let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=" + strCategory)
    
    // Define a local array for TableView
    var localMeals = [Meal]()
    
    func downloadJson() {
        
        guard let downloadUrl = url else { return }
        URLSession.shared.dataTask(with: downloadUrl) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Erro occred.")
                return
            }
            print("url: \(String(describing: self.url)))")
            
            do {
                let decoder = JSONDecoder()
                let downloadedMeals = try decoder.decode(Meals.self, from: data)
//                print(downloadedMeals)
//                print(downloadedMeals.meals[0].idMeal as Any)
                
                self.localMeals = downloadedMeals.meals
                
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
    




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
