//
//  ViewController.swift
//  PickerView
//
//  Created by mars on 2021/04/19.
//

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    var imageFileName = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10,jpg"]
    
    
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var IbIImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent
                            component: Int) -> Int {
        return imageFileName.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent
                            component:Int) -> String? {
        return imageFileName[row]
    }
}

