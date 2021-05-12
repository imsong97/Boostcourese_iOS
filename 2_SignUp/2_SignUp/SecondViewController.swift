//
//  SecondViewController.swift
//  2_SignUp
//
//  Created by YunHo on 2021/05/12.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
