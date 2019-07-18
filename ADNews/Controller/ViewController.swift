//
//  ViewController.swift
//  ADNews
//
//  Created by Ümit Sevim on 18.07.19.
//  Copyright © 2019 Ümit Sevim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HeaderViewDelegate {
    
    var header = HeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        createHeader()
        
    }

    func createHeader() {
        
        header = Bundle.main.loadNibNamed("HeaderView", owner: nil, options: nil)?.first as! HeaderView
        
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 100)
        header.delegate = self
        header.actionButton.isHidden = true
        header.menuButton.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    
        self.view.addSubview(header)
    }
    
    func MenuOrBack() {
        print("Menu Button pressed")
    }
    
    func Search() {
        print("Search button pressed")
    }
    
    func Action() {
        print("Action button pressed")
    }

}

