//
//  ViewController.swift
//  SlideshowApp
//
//  Created by tetsuro miyagawa on 2018/08/16.
//  Copyright © 2018年 tetsuro miyagawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var pre: UIButton!
    @IBOutlet weak var nex: UIButton!
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    
    var timer_sec: Int = 0 //タイマー時間
    var timer: Timer! //タイマー
    var c: Int = 0 //配列を番号で呼ぶ為のカウンター
    var data: Array<UIImage> = []//画像を入れる配列
    let image0 = UIImage(named:"IMG_1600.jpg" )!//ファイル名を入れる
    let image1 = UIImage(named:"IMG_1601.jpg")!
    let image2 = UIImage(named:"IMG_1602.jpg")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.append(image0)
        data.append(image1)
        data.append(image2)
        photo.image = data[c]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    
    override func viewWillAppear(_ animated: Bool) {
        if timer != nil {
            self.timer.invalidate()
            timer = nil
            nex.isEnabled = true
            pre.isEnabled = true
        }
        
        photo.image = data[c]
    }

    @objc func updateTimer(_ timer: Timer){
        self.timer_sec += 1
        if self.timer_sec % 2 == 0{
            c += 1
            if c == 3 {
                c = 0
            }
            if c == -1{
                c = 2
            }
            photo.image = data[c]
        }
    }//タイマーが２秒ごとにcが１
    
    @IBAction func nex(_ sender: Any) {
        if timer != nil {
            self.timer.invalidate()
            timer = nil
        }
        c += 1
        if c == 3 {
            c = 0
        }
        if c == -1{
            c = 2
        }
        photo.image = data[c]
    }//次。タイマーの解除、カウンター１
    
    @IBAction func pre(_ sender: Any) {
        if timer != nil {
            self.timer.invalidate()
            timer = nil
        }
        c -= 1
        if c == 3 {
            c = 0
        }
        if c == -1{
            c = 2
        }
        photo.image = data[c]
    }//前。タイマーの解除、カウンター−１
    
    @IBAction func startStop(_ sender: Any) {
        if timer == nil {
            
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            nex.isEnabled = false
            pre.isEnabled = false//ボタンの無効化
            
        }else{
            
            self.timer.invalidate()
            timer = nil
            nex.isEnabled = true
            pre.isEnabled = true//ボタンの有効化

            
        }
    }//再生停止。タイマーの作成、解除
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let photoViewController: PhotoViewController = segue.destination as! PhotoViewController
        photoViewController.c = c
        
    }
    
    @IBAction func tapges(_ sender: Any) {
        if timer != nil {
            self.timer.invalidate()
            timer = nil
        }
    }
    

    
}

