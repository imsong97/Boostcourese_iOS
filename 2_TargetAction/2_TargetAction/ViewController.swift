//
//  ViewController.swift
//  2_TargetAction
//
//  Created by YunHo on 2021/05/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm"
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // IBAction 대신 코드로 호출
        self.dataPicker.addTarget(self, action: #selector(self.valueChanged(_:)), for: UIControl.Event.valueChanged)
    }

    @IBAction func valueChanged(_ sender: UIDatePicker){
        print("value changed")
        
        let date = self.dataPicker.date
        let dateString = self.dateFormatter.string(from: date)
        
        self.label.text = dateString
    }
    
}

