//
//  ViewController.swift
//  2_SignUp
//
//  Created by YunHo on 2021/05/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController - view가 메모리에 로드 됨")
        
        // tapGuesture -> 코드로 (스토리보드 연결 X)
//        let tapGuesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
//        self.view.addGestureRecognizer(tapGuesture)
        
        // 또는 UIGestureRecognizerDelegate 사용
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("ViewController - view가 화면에 보여질 예정")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("ViewController - view가 화면에 보여짐")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("ViewController - view가 화면에서 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("ViewController - view가 화면에서 사라짐")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("ViewController - view가 subview를 레이아웃 하려고 함")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("ViewController - view가 subview를 레이아웃 함")
    }
    
    @IBAction func setDataBtn(_ sender: UIButton){
        UserInfo.userInfo.name = nameField.text
        UserInfo.userInfo.age = ageField.text
    }
    
    // 탭 하면 키보드 내려가게끔
    @IBAction func tapView(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
}

