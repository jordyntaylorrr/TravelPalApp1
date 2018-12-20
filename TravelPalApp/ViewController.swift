//
//  ViewController.swift
//  TravelPalApp
//
//  Created by jordyn hollingsworth on 12/6/18.
//  Copyright © 2018 jordyn hollingsworth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cityButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handleSelection(_ sender: UIButton) {
        cityButtons.forEach { (button) in
            UIView.animate(withDuration: 0.5, animations:{
            button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
            
        }
    }
    enum Citys: String{
        case losAngeles = "Los Angeles"
        case sanFrancisco = "San Francisco"
    }
    @IBAction func cityTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let city = Citys(rawValue: title) else { return
        }
        switch city {
        case .sanFrancisco:
            print("San Francisco")
            GlobalSettings.city = "San Francisco"
        default:
            print("Los Angeles")
            GlobalSettings.city = "Los Angeles"
        }
    }
    func loadDestinations(){
        let path = Bundle.main.path(forResource: "Data", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do{
            let data = try Data(contentsOf: url)
            GlobalSettings.Destinations = try JSONDecoder().decode([Destination].self, from: data)
            
            for eachDestination in GlobalSettings.Destinations{
                print(eachDestination.NAME)
            }
            
        }catch{
            print("Couldn't load data")
        }
    }
}

