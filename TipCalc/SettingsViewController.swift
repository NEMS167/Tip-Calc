//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Eileen Madrigal on 12/31/15.
//  Copyright © 2015 Eileen Madrigal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipField: UITextField!
    @IBOutlet weak var saveLabel: UILabel!
    @IBOutlet weak var splitField: UITextField!
    @IBOutlet weak var colorChanger: UISegmentedControl!
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
       super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()

        var bgColorNo: Int? = defaults.objectForKey("bgColor") as! Int?
        if(bgColorNo == nil){
            bgColorNo = 1
            defaults.setObject(bgColorNo, forKey:"bgColor")
            
        }
        colorChanger.selectedSegmentIndex = bgColorNo!
       
        switch (bgColorNo!) {
            
        case 0:
            self.view.backgroundColor = UIColor(red: 1/255, green: 36/255, blue: 83/255, alpha: 1.0)
            
        case 1:
            self.view.backgroundColor = UIColor(red: 0/255, green: 195/255, blue: 23/255, alpha: 1.0)
           
        
        default :
            self.view.backgroundColor = UIColor(red: 1/255, green: 36/255, blue: 83/255, alpha: 1.0)
            
            
        }
        self.title = "Defaults"
       
        let Percentage = defaults.doubleForKey("percent")
        tipField.text = "\(Percentage)"
        tipField.text = String(format:"%.0f", Percentage)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func colorChanged(sender: AnyObject) {
        
        switch (colorChanger.selectedSegmentIndex) {
        
        case 0:
            self.view.backgroundColor = UIColor(red: 1/255, green: 36/255, blue: 83/255, alpha: 1.0)
            
        case 1:
            self.view.backgroundColor = UIColor(red: 0/255, green: 195/255, blue: 23/255, alpha:1.0)
            
        default :
            self.view.backgroundColor = UIColor(red: 1/255, green: 36/255, blue: 83/255, alpha: 1.0)
            
            
        }
    }

    @IBAction func saveChanges(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let bgColorNo = colorChanger.selectedSegmentIndex
        colorChanger.selectedSegmentIndex = bgColorNo
        defaults.setObject(bgColorNo, forKey: "bgColor")
    
        let Percentage = NSString(string:tipField.text!).doubleValue
        let Split = NSString(string:splitField.text!).doubleValue
        
        defaults.setDouble(Percentage, forKey: "percent")
        defaults.setDouble(Split, forKey: "split")
        defaults.synchronize()
        view.endEditing(true)
       
    }
    @IBAction func offTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
