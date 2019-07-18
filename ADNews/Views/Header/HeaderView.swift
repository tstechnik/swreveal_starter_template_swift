//
//  HeaderView.swift
//  ADNews
//
//  Created by Ümit Sevim on 18.07.19.
//  Copyright © 2019 Ümit Sevim. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate {
    func MenuOrBack()
    func Search()
    func Action()
}

class HeaderView: UIView {

    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var actionButton: UIButton!
    
    var delegate: HeaderViewDelegate?
    
    
    @IBAction func menuButtonPressed(_ sender: Any) {
        self.delegate?.MenuOrBack()
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        self.delegate?.Search()
    }
    @IBAction func actionButtonPressed(_ sender: Any) {
        self.delegate?.Action()
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
}
