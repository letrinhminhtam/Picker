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
    @IBOutlet weak private var hiddenDatePickerUiView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Action button
    @IBAction func displayButtonTappedPicker(sender: AnyObject) {
        dateTimeLabel.text = NSDateFormatter.localizedStringFromDate(myDatePicker.date, dateStyle: NSDateFormatterStyle.FullStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
        hiddenDatePickerUiView.hidden = true
    }
    
    private func setUpUI() {
        configureHomeViewController()
        tapUILabel()
        hiddenDatePickerUiView.hidden = true
    }
    
    private func setUpData() {
        
    }
    
    private func configureHomeViewController() {
        self.title = "Home"
    }
    
    private func tapUILabel() {
        let tapDateTimeLabel = UITapGestureRecognizer(target: self, action: #selector(openPickerView(_:)))
        dateTimeLabel.userInteractionEnabled = true
        dateTimeLabel.addGestureRecognizer(tapDateTimeLabel)
    }
    
    @objc private func openPickerView(sender: UIGestureRecognizer) {
        UIView.animateWithDuration(0.4, animations: {
            if self.hiddenDatePickerUiView.hidden == true {
                self.hiddenDatePickerUiView.hidden = false
            } else {
                self.hiddenDatePickerUiView.hidden = true
            }
        }, completion: (nil))
    }
}
