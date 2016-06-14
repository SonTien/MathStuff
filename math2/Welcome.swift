//
//  Welcome.swift
//  math2
//
//  Created by HoangHai on 6/13/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit

class Welcome: UIViewController {
    var nav = UINavigationController()
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var appname: UILabel!
    @IBAction func playbt(sender: UIButton) {
        let play = self.storyboard?.instantiateViewControllerWithIdentifier("play") as! ViewController
        self.navigationController?.pushViewController(play, animated: true)
    
    
    
    }
        override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
            }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animateWithDuration(2, animations: {
            self.appname.center = CGPointMake(self.appname.center.x, 160)
        })
        
    }
    
    func viewWillAppear2(animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animateWithDuration(2, animations: {
            self.logo.center = CGPointMake(self.logo.center.x, 250)
})

}

}

