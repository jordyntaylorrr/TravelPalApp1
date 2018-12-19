//
//  EmergencyDialController.swift
//  TravelPalApp
//
//  Created by RCMACEXT-29 on 12/18/18.
//  Copyright © 2018 jordyn hollingsworth. All rights reserved.
//

import UIKit

class EmergencyDialController: UIViewController {
    @IBOutlet weak var DialEmergency: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func NonEmergencyClicked(_ sender: Any) {
        callNumber()
    }
    
    @IBAction func EmergencyClicked(_ sender: Any) {
        callNumber()
    }
    @IBOutlet weak var BartPoliceClicked: UIButton!
    @IBAction func BartPoliceClicked(_ sender: Any) {
        callNumber()
    }
    
    func callNumber(){
        print("Calling")
        let url: NSURL = URL(string: "TEL://1234567890")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
