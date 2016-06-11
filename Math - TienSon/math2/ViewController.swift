//
//  ViewController.swift
//  math2
//
//  Created by HoangHai on 6/3/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var nsTimer = NSTimer()
    var time = 30
    override func viewDidLoad() {
        //asasdasd
        Timer.text = String(time)
        super.viewDidLoad()
        nsTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        hienThiSo()
    }

    @IBOutlet weak var over: UILabel!
    
    @IBOutlet weak var correct: UIImageView!
    @IBOutlet weak var incorrect: UIImageView!
    @IBOutlet weak var retry: UIButton!
    
    @IBAction func retry(sender: UIButton) {
        time = 30
        retry.hidden = true
        over.alpha = 0
        soDung = 0
        Dung.text = String(soDung)
        soSai = 0
        Sai.text = String(soSai)
        score.hidden = true
        scoreNumber.hidden = true
        score2.hidden = true
        correct.hidden = true
        incorrect.hidden = true
       }
    @IBOutlet weak var scoreNumber: UILabel!
    @IBOutlet weak var score2: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var Timer: UILabel!
 //Hien thi dau
    @IBOutlet weak var lbl_dau: UILabel!
 //Hien thi so ngau nhien
    @IBOutlet weak var Lbl1: UILabel!
    @IBOutlet weak var Lbl2: UILabel!
 //Hien thi ket qua
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    var soDung = 0
    var soSai = 0
 //Hien thi ket qua dung/sai
    @IBAction func btnac3(sender: UIButton) {
        if (Int(sender.currentTitle!) == cal(Int(Lbl1.text!)!, b: Int(Lbl2.text!)!))
        {
            soDung = soDung + 1
            print(soDung)
            Dung.text = String(soDung)
        }
        else {
            soSai = soSai + 1
            print(soSai)
            Sai.text = String(soSai)
        }
        hienThiSo()
    }
    @IBOutlet weak var Dung: UILabel!
    @IBOutlet weak var Sai: UILabel!


    
    func hienThiSo(){
 //Chon so ngau nhien
        let hienThi1 = Int(arc4random_uniform(10) + 1)
        let hienThi2 = Int(arc4random_uniform(10) + 1)
        let hienThiDau = Int(arc4random_uniform(3) + 1)
        if (hienThiDau == 1) {
            lbl_dau.text = "+"
        }
        else if (hienThiDau == 2) {
            lbl_dau.text = "-"
        }
        else {
            lbl_dau.text = "*"
        }
 //Hien thi so ngau nhien
        Lbl1.text = String(hienThi1)
        Lbl2.text = String(hienThi2)
        hienKetQua(hienThi1, hienThiB: hienThi2)
    }
 //Hien thi ket qua
    func hienKetQua(hienThiA: Int, hienThiB: Int){
        let th = Int(arc4random_uniform(3) + 1)
        var kq1 = Int(arc4random_uniform(20) + 1)
        while(kq1 == cal(hienThiA, b: hienThiB)){
            kq1 = Int(arc4random_uniform(20) + 1)
        }
        var kq2 = Int(arc4random_uniform(20) + 1)
        while(kq2 == kq1 || kq2 == cal(hienThiA,b: hienThiB)) {
            kq2 = Int(arc4random_uniform(20) + 1)
        }
        if (th == 1) {
            btn1.setTitle(String(kq1), forState: .Normal)
            btn2.setTitle(String(kq2), forState: .Normal)
            btn3.setTitle(String(cal(hienThiA, b: hienThiB)), forState: .Normal)
        }
        else if (th == 2) {
            btn1.setTitle(String(kq2), forState: .Normal)
            btn3.setTitle(String(kq1), forState: .Normal)
            btn2.setTitle(String(cal(hienThiA, b: hienThiB)), forState: .Normal)
        }
        else {
            btn3.setTitle(String(kq1), forState: .Normal)
            btn2.setTitle(String(kq2), forState: .Normal)
            btn1.setTitle(String(cal(hienThiA, b: hienThiB)), forState: .Normal)
        }
        
    }
    
    func cal(a: Int, b: Int) -> Int
    {
        if (lbl_dau.text == "+")
        {
            return a+b
        }
        if (lbl_dau.text == "-")
        {
            return a-b
        }
        return a*b
    }
    
    func update(){
        if(time > 0){
            time -= 1
        }
        if(time == 0){
            over.alpha = 1
            retry.hidden = false
            score.hidden = false
            scoreNumber.hidden = false
            scoreNumber.text = String(soDung)
            correct.hidden = false
            incorrect.hidden = false
            score2.hidden = false
            score2.text = String(soSai)
        }
        Timer.text = String(time)
    }
}



