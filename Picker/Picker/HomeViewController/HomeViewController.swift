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
        timeSelectPicker()
        print("adsdadads")
    }
    
    private func timeSelectPicker() {
        timeDate.locale = NSLocale.currentLocale()
        timeDate.dateStyle = NSDateFormatterStyle.NoStyle
        timeDate.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let ampmtext = timeDate.stringFromDate(NSDate())
        print(ampmtext)
        
        if ampmtext.rangeOfString("M") != nil {
            if dateTimeAgoLabel.text == String(10) {
                dateTimeAgoLabel.text = ampmtext
            }
         //   dateTimeAgoLabel.text = ampmtext
            print("12-hour clock")
        } else {
            print("24-hour clock")
        }
    }
    
    private func timerSystem() {
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "ss"
        let dateTimePrefix: String = formatter.stringFromDate(NSDate())
        dateTimeAgoLabel.text = dateTimePrefix
    }
}
