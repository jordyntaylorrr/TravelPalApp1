//
//  ListViewController.swift
//  TravelPalApp
//
//  Created by Arman Chauhan on 12/16/18.
//  Copyright © 2018 jordyn hollingsworth. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //prepare for data
    let dishName = ["Scalas", "Kinkhao", "Hakkasan", "Dailygrill", "Colibri", "Delarosa"]
    let dishImage = ["scalas", "kinkhao", "hakkasan", "dailygrill", "colibri", "delarosa"]
    let dishPrice = [12.99, 13.99, 19.99, 10.99, 11.99, 9,99]
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = FoodTableView.dequeueReusableCell(withIdentifier: "foodCell") as! FoodTableViewCell
        myCell.foodImageView.image = UIImage(named: dishImage[indexPath.row])
        myCell.foodNameLabel.text = dishName[indexPath.row]
        myCell.foodPriceLabel.text = "$\(dishPrice[indexPath.row])"
        return myCell
    }
    

    
    @IBOutlet weak var FoodTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        FoodTableView.delegate = self
        FoodTableView.dataSource = self
        
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
