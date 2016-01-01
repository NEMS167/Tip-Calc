//
//  ViewController.swift
//  TipCalc
//
//  Created by Eileen Madrigal on 12/24/15.
//  Copyright © 2015 Eileen Madrigal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var percentField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitField: UITextField!
    @IBOutlet weak var subtotalField: UILabel!
    @IBOutlet var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tip Calculator"

        self.secondView.alpha = 0
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let Percentage = defaults.doubleForKey("percent")
        let Split = defaults.doubleForKey("split")
        
        var bgColorNo: Int? = defaults.objectForKey("bgColor") as! Int?
        if(bgColorNo == nil){
            bgColorNo = 1
            defaults.setObject(bgColorNo, forKey:"bgColor")
            
        }
        
        
        switch (bgColorNo!) {
            
        case 0:
            self.view.backgroundColor = UIColor(red: 1/255, green: 36/255, blue: 83/255, alpha: 1.0)
           
        case 1:
            self.view.backgroundColor = UIColor(red: 0/255, green: 195/255, blue: 23/255, alpha: 1.0)
            
            
        default :
            self.view.backgroundColor = UIColor(red: 1/255, green: 36/255, blue: 83/255, alpha: 1.0)
            
            
        }

        
        splitField.text = "\(Split)"
        percentField.text = "\(Percentage)"
        splitField.text = String(format:"%.0f", Split)
        percentField.text = String(format:"%.0f", Percentage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
        // Dispose of any resources that can be recreated.
    }

    @IBAction func bill(sender: AnyObject) {
        if(secondView.alpha == 0){
            self.firstView.alpha = 0
            self.secondView.alpha = 1
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.firstView.alpha = 1
                self.secondView.alpha = 1
            })
        }

    }
    
    @IBAction func percent(sender: AnyObject) {
        if(secondView.alpha == 0){
            self.firstView.alpha = 0
            self.secondView.alpha = 1
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.firstView.alpha = 1
                self.secondView.alpha = 1
            })
        }
    }
    
    @IBAction func split(sender: AnyObject) {
        if(secondView.alpha == 0){
            self.firstView.alpha = 0
            self.secondView.alpha = 1
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.firstView.alpha = 1
                self.secondView.alpha = 1
            })
        }
    }
    
    

    @IBAction func onEditingChanged(sender: AnyObject) {
    
        var Percentage = NSString(string:percentField.text!).doubleValue
        if(Percentage > 1)
        {
            Percentage = Percentage / 100
        }
       
        let billAmount = NSString(string:billField.text!).doubleValue
        var splitAmount = NSString(string:splitField.text!).doubleValue
        if(splitAmount==0)
        {
            splitAmount = 1
        }
        let tip = billAmount * Percentage
        let subtotal = tip + billAmount
        let total = (tip + billAmount) / splitAmount
        
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        subtotalField.text = "$\(subtotal)"
        
        
        subtotalField.text = String(format:"$%.2f", subtotal)
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        
        
    }
    @IBAction func percentChange(sender: AnyObject) {
        
        
        var Percentage = NSString(string:percentField.text!).doubleValue
        if(Percentage > 1)
        {
            Percentage = Percentage / 100
        }
        let billAmount = NSString(string:billField.text!).doubleValue
        var splitAmount = NSString(string:splitField.text!).doubleValue
        if(splitAmount==0)
        {
            splitAmount = 1
        }
        let tip = billAmount * Percentage
        let subtotal = tip + billAmount
        let total = (tip + billAmount) / splitAmount
        
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        subtotalField.text = "$\(subtotal)"
        
        
        subtotalField.text = String(format:"$%.2f", subtotal)
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
    }
    @IBAction func splitChange(sender: AnyObject) {
    
        
        var Percentage = NSString(string:percentField.text!).doubleValue
        if(Percentage > 1)
        {
            Percentage = Percentage / 100
        }
        let billAmount = NSString(string:billField.text!).doubleValue
        var splitAmount = NSString(string:splitField.text!).doubleValue
        if(splitAmount==0)
        {
            splitAmount = 1
        }
        let tip = billAmount * Percentage
        let subtotal = tip + billAmount
        let total = (tip + billAmount) / splitAmount
        
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        subtotalField.text = "$\(subtotal)"
        
        
        subtotalField.text = String(format:"$%.2f", subtotal)
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

