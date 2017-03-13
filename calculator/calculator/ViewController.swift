//
//  ViewController.swift
//  calculator
//
//  Created by Rajesh Madiri on 08/03/17.
//  Copyright © 2017 Rajesh Madiri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipcontrol: UISegmentedControl!
    @IBOutlet weak var BillLabel: UITextField!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    
    var roundingSetting = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let percentSetting = defaults.integer(forKey: "tip_percent")
        tipcontrol.selectedSegmentIndex = percentSetting
        //self.roundingSetting = defaults.integer(forKey: "rounding")
        self.CaluculateTip(self)
    }
  

    @IBAction func onTap(_ sender: Any) {
       view.endEditing(true)
    }

    @IBAction func CaluculateTip(_ sender: Any) {
        
        let tippercent = [0.18,0.2,0.25]
        let bill = Double(BillLabel.text!) ?? 0
        let tip = bill * tippercent[tipcontrol.selectedSegmentIndex]
        let total = bill + tip
        TipLabel.text = String(format : "$%.2f" , tip)
        TotalLabel.text = String(format : "$%.2f" , total)
    }
   /* override func viewWillDisappear(_ animated: Bool) {
        
        let defaults = UserDefaults.standard
        defaults.set(Int(tipcontrol.selectedSegmentIndex),forKey: "tip_percent")
        defaults.synchronize()
        
    }*/
}

