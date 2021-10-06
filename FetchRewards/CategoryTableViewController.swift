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
    // To pass idCategory value to segue
    var idCategoryToSegue: String = ""
    
    func downloadJson() {
        guard let downloadUrl = url else { return }
        URLSession.shared.dataTask(with: downloadUrl) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Erro occred.")
                return
            }
            print("downloaded")
            
            do {
                let decoder = JSONDecoder()
                let downloadedCategories = try decoder.decode(Categories.self, from: data)
                print(downloadedCategories)
                print(downloadedCategories.categories[0].strCategory)
                
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
        downloadJson()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return localCategories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }

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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toMeals", sender: nil)
        idCategoryToSegue = localCategories[indexPath.row].idCategory
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation
    let segueIdentifier = "toMeals"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if  segue.identifier == segueIdentifier,
                let destination = segue.destination as? MealsTableViewController {
                destination.idCategory = idCategoryToSegue
            }
    }

}

/*        guard let selectedPath = tableView.indexPathForSelectedRow else { return }

if segue.identifier == "NewsDetails" {
    
    if let target = segue.destination as? NewsViewController {
        
        let news = newsData[selectedPath.row]
        target.selectedCountry = selectedCountry
        target.newsTitle = news.title
        target.excerpt = news.excerpt
        target.heat = news.heat
        target.webUrl = news.webUrl
        target.publishedDateTime = news.publishedDateTime
        target.providerName = news.provider?.name
        target.images = news.images
    }
}
*/
