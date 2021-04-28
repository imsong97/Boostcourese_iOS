//
//  ViewController.swift
//  1_MusicPlayer
//
//  Created by YunHo on 2021/04/28.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet var playBtn: UIButton!
    @IBOutlet var time: UILabel!
    @IBOutlet var progress: UISlider!
    
    var player: AVAudioPlayer!
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.initialPlayer()
    }

    @IBAction func btnClicked(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
                
        if sender.isSelected {
            self.player?.play()
        } else {
            self.player?.pause()
        }
        
        if sender.isSelected {
            self.makeAndFireTimer()
        } else {
            self.invalidateTimer()
        }
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        self.updateTime(time: TimeInterval(sender.value))
        if sender.isTracking { return }
        self.player.currentTime = TimeInterval(sender.value)
    }
    
    // 플레이어 초기화
    func initialPlayer(){
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            print("음원 로드 실패")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
        }
        
        self.progress.maximumValue = Float(self.player.duration)
        self.progress.minimumValue = 0
        self.progress.value = Float(self.player.currentTime)
    }
    
    // 레이블 표시
    func updateTime(time: TimeInterval){
        let minute = Int(time/60)
        let second = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond = Int(time.truncatingRemainder(dividingBy: 1)*100)
        
        let timeText = String(format: "%02ld:%02ld:%02ld", minute, second, milisecond)
        
        self.time.text = timeText
    }
    
    // 타이머
    func makeAndFireTimer(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {[unowned self] (timer: Timer) in
                if self.progress.isTracking { return }
                
                self.updateTime(time: self.player.currentTime)
                self.progress.value = Float(self.player.currentTime)
            
        })
        
        self.timer.fire()
    }
    
    // 타이머 해제
    func invalidateTimer(){
        self.timer.invalidate()
        self.timer = nil
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error: Error = error else {
            print("디코드 오류")
            return
        }
        
        let message: String
        message = "플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in
            
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.playBtn.isSelected = false
        self.progress.value = 0
        self.updateTime(time: 0)
        self.invalidateTimer()
    }
}

