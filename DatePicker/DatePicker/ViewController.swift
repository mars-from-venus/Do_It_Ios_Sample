//
//  ViewController.swift
//  DatePicker
//
//  Created by mars on 2021/04/16.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime: String?
    var alertFlag = false
    
    @IBOutlet var IbICurrentTime: UILabel!
    @IBOutlet var IbIPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        IbIPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from:datePickerView.date)
        
        
    }
    @objc func updateTime(){
        IbICurrentTime.text = String(count)
        count = count + 1
     
    let date = NSDate()
        
    let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        IbICurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        if (alarmTime == currentTime) {
            if !alertFlag {
            let signAlert = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네,알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            signAlert.addAction(onAction)
            present(signAlert, animated: true, completion: nil)
            alertFlag = true
            }
            
        }else {
            alertFlag = false
        }
    
    

}
}
