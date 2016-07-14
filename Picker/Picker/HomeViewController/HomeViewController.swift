//
//  HomeViewController.swift
//  Picker
//
//  Created by Le Tam on 7/13/16.
//  Copyright © 2016 TamLTM. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak private var dateTimeLabel: UILabel!
    @IBOutlet weak private var myDatePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func displayButtonTappedPicker(sender: AnyObject) {
        dateTimeLabel.text = NSDateFormatter.localizedStringFromDate(myDatePicker.date, dateStyle: NSDateFormatterStyle.FullStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
    }
}
