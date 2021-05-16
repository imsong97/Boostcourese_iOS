//
//  SecondViewController.swift
//  2_SignUp
//
//  Created by YunHo on 2021/05/12.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("SecondViewController - view가 메모리에 로드 됨")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("SecondViewController - view가 화면에 보여질 예정")
        
        self.name.text = UserInfo.userInfo.name
        self.age.text = UserInfo.userInfo.age
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("SecondViewController - view가 화면에 보여짐")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("SecondViewController - view가 화면에서 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("SecondViewController - view가 화면에서 사라짐")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("SecondViewController - view가 subview를 레이아웃 하려고 함")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("SecondViewController - view가 subview를 레이아웃 함")
    }
    
    // 네비게이션 -> POP 버튼 누르면 이전화면 보여지게 (코드로)
    @IBAction func popToPrev(){
        self.navigationController?.popViewController(animated: true)
    }
    
    // 모달 ->    버튼 누르면 이전화면 보여지게 (코드로)
    @IBAction func dismissModal(){
        self.dismiss(animated: true, completion: nil)
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
