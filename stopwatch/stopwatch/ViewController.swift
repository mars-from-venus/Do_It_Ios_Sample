//
//  ViewController.swift
//  stopwatch
//
//  Created by mars on 2021/04/18.
//

import UIKit

class ViewController: UIViewController {
    var seconds = 60
    var timer = Timer()
    var isTimerRuning = false
    var resumeTapped = false
    
    @IBOutlet var stopWatch: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnStart(_ sender: UIButton) {
        runTimer()
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:(#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
   @objc func updateTimer() {
        seconds -= 1
        stopWatch.text = timeString(time: TimeInterval(seconds))
        
    }

    
    @IBAction func btnPause(_ sender: UIButton) {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
        }else {
            runTimer()
            self.resumeTapped = false
        }
    }
    @IBAction func btnReset(_ sender: UIButton) {
        timer.invalidate()
        seconds = 60
        stopWatch.text = timeString(time: TimeInterval(seconds))
        
    }
    @objc func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds )
        
    }
}

