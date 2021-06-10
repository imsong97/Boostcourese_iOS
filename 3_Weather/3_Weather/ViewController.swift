//
//  ViewController.swift
//  3_Weather
//
//  Created by YunHo on 2021/06/07.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "cell"
    let customCellIdentifier = "customCell"
    
    let kor = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카", "타"]
    let eng = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n"]
    
    var dates: [Date] = []
    
    let dateformatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter
    }()
    
    let timeformatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { // tableView의 row개수
        return 3
    }

    // UITableView 필수 구현 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // tableView의 row개수
        switch section {
        case 0:
            return kor.count
        case 1:
            return eng.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    
    // UITableView 필수 구현 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // row마다 해당하는 cell
        
        if indexPath.section < 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            let text = indexPath.section == 0 ? kor[indexPath.row] : eng[indexPath.row]
            cell.textLabel?.text = text
            
            return cell
        }
        else {
            let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell
            cell.leftLabel.text = self.dateformatter.string(from: self.dates[indexPath.row])
            cell.rightLabel.text = self.timeformatter.string(from: self.dates[indexPath.row])
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { // section마다 title
        if section < 2 {
            return section == 0 ? "한글" : "영어"
        }
        else{
            return nil
        }
    }
    
    @IBAction func addData(_ sender: UIButton){ // Add Data 버튼 클릭 시 데이터를 넣고 reload하여 화면에 표시
        dates.append(Date())
        
//        self.tableView.reloadData() // 전체 reload
        self.tableView.reloadSections(IndexSet(2...2), with: .automatic) // 추가되는 데이터만 reload, 애니메이션 추가
    }
}

