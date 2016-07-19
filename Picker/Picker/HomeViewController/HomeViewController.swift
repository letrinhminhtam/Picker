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
    @IBOutlet weak private var dateTimeAgoLabel: UILabel!
    @IBOutlet weak private var myDatePicker: UIDatePicker!
    @IBOutlet weak private var hiddenDatePickerUiView: UIView!
    
    var timer: NSTimer!
    var timeDate = NSDateFormatter()

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
        timeSelectPicker()
        hiddenDatePickerUiView.hidden = true
    }
    
    private func setUpUI() {
        configureHomeViewController()
        tapUILabel()
        hiddenDatePickerUiView.hidden = true
        setTimeForDatePicker()
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
        UIView.animateWithDuration(1.0, animations: {
            if self.hiddenDatePickerUiView.hidden == true {
                self.hiddenDatePickerUiView.hidden = false
            } else {
                self.hiddenDatePickerUiView.hidden = true
            }
        }, completion: (nil))
    }
    
    private func setTimeForDatePicker() {
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(updateTimeAgoOfPicker), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc private func updateTimeAgoOfPicker() {
        myDatePicker.maximumDate = NSDate()
    }
    
    private func timeSelectPicker() {
        let dateComponentsFormatter = NSDateComponentsFormatter()
        dateComponentsFormatter.unitsStyle = NSDateComponentsFormatterUnitsStyle.Full
        let interval = NSDate().timeIntervalSinceDate(myDatePicker.date)
        let diffirentDate = dateComponentsFormatter.stringFromTimeInterval(interval)
        let dateTime = diffirentDate?.componentsSeparatedByString(", ")
        if dateTime!.count > 1 {
            dateTimeAgoLabel.text = "\(dateTime![0]) \(dateTime![1])"
        } else {
            dateTimeAgoLabel.text = "\(dateTime![0])"
        }
        
    }
    
    private func timerSystem() {
       
    }
}

