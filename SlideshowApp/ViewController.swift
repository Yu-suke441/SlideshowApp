//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Yusuke Murayama on 2020/11/03.
//  Copyright © 2020 Yusuke.Murayama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var goAndStopButton: UIButton!
    
    //　最初の画像
    var imageIndex = 0
    
    //　タイマー
    var timer: Timer!
    
    
    var imageArray:[UIImage] = [UIImage(named: "animal1")!,
                                UIImage(named: "animal2")!,
                                UIImage(named: "animal3")!,
                                UIImage(named: "animal4")!,
                                UIImage(named: "animal5")!,
                                UIImage(named: "animal6")!,
                                UIImage(named: "animal7")!]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 配列画像（１番目）を表示
        imageView.image = imageArray[imageIndex]
       
    }
    // selectorの因数をとるメソッド
    @objc func onTimer(_ timer:Timer) {
        if imageIndex == 6 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = imageArray[imageIndex]
    }

    // 進むボタンのアクション
    @IBAction func nextButton(_ sender: Any) {
        if imageIndex == 6 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = imageArray[imageIndex]
    }
    
    // 再生/停止ボタンのアクション
    @IBAction func goAndStopButton(_ sender: Any) {
        if self.timer == nil {
            goAndStopButton.setTitle("停止", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            
            //  ボタンの無効化
            nextButton.isEnabled = false
            backButton.isEnabled = false
        } else {
            goAndStopButton.setTitle("再生", for: .normal)
            self.timer.invalidate() //タイマー停止
            self.timer = nil
            
            // ボタンの有効化
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
        
        
    }
    
    // 戻るボタンのアクション
    @IBAction func backButton(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 6
        } else {
            imageIndex -= 1
        }
        imageView.image = imageArray[imageIndex]
    }
    
    @IBAction func unwind(_ segue:UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    
    // 画像をタップした時に呼ばれる処理
   
    @IBAction func tappedImageView(_ sender: Any) {
        performSegue(withIdentifier: "toNext", sender: nil)
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            goAndStopButton.setTitle("再生", for: .normal)
            
            nextButton.isEnabled = true
            backButton.isEnabled = true
            
        }
        
    }
    
    // 画像をタップした時に拡大表示されるview（NextViewController）へ画面遷移する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC:NextViewController = segue.destination as! NextViewController
        
        nextVC.selectedImage = self.imageView.image
    }
}

