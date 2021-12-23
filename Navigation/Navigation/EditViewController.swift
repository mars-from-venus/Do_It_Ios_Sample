//
//  EditViewcontrollerViewController.swift
//  Navigation
//
//  Created by mars on 2021/05/15.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewcontrollerViewController, message: String)
    func didImageOnOff(_ controller: EditViewcontrollerViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewcontrollerViewController, isZoom: Bool)
}


class EditViewcontrollerViewController: UIViewController {
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate : EditDelegate?
    var isOn = false
    var isZoom = false
    
    @IBOutlet var IbIWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swlsOn: UISwitch!
    @IBOutlet var Closer: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        IbIWay.text = textWayValue
        txMessage.text = textMessage
        swlsOn.isOn = isOn
        if isZoom {
            Closer.setTitle("확대", for: UIControl.State())
        }else {
            Closer.setTitle("축소", for: UIControl.State())
        }
    }
  
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        }else  {
            isOn = false
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOff(self, isOn: isOn)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func btnCloser(_ sender: UIButton) {
        if isZoom {
            isZoom = false
            Closer.setTitle("축소", for: UIControl.State())
        }else {
            isZoom = true
            Closer.setTitle("확대", for: UIControl.State())
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
