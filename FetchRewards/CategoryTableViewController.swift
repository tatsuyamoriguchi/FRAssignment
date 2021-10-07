//
//  CategoryTableViewController.swift
//  FetchRewards
//
//  Created by Tatsuya Moriguchi on 10/1/21.
//  Copyright © 2021 Tatsuya Moriguchi. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    
    final let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")
    
    // Define a local array for TableView
    var localCategories = [Category]()
    
    func downloadJson() {
        guard let downloadUrl = url else { return }
        URLSession.shared.dataTask(with: downloadUrl) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Erro occred.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let downloadedCategories = try decoder.decode(Categories.self, from: data)
                
                self.localCategories = downloadedCategories.categories
                
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
        navigationItem.title = "Category List"
        downloadJson()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return localCategories.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }

        cell.idCategoryLabel.text = localCategories[indexPath.row].idCategory
        cell.strCategoryLabel.text = localCategories[indexPath.row].strCategory
        cell.strCategoryDescriptionTextView.text = localCategories[indexPath.row].strCategoryDescription
 
        if let imageURL = URL(string: localCategories[indexPath.row].strCategoryThumb) {
            DispatchQueue.global().async {
                guard let data = try? Data(contentsOf: imageURL) else { return }
                let image = UIImage(data: data)
                    DispatchQueue.main.sync {
                        cell.strCategoryThumb.image = image
                    }
            }
                
        }
    
        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let strCategoryForURL = localCategories[indexPath.row].strCategory
        urlToPass = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=" + strCategoryForURL)
        performSegue(withIdentifier: "toMeals", sender: nil)
    }


    // MARK: - Navigation

    // To pass idCategory value to segue
    var urlToPass: URL?

    let segueIdentifier = "toMeals"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if  segue.identifier == segueIdentifier,
                let destination = segue.destination as? MealsTableViewController {
                destination.url = urlToPass
                
            }
    }

}

