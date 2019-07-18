//
//  MenuController.swift
//  ADNews
//
//  Created by Ümit Sevim on 18.07.19.
//  Copyright © 2019 Ümit Sevim. All rights reserved.
//

import UIKit

class MenuController: UIViewController {

    var menuHeader = MenuHeaderView()
    private var tableMenu: UITableView = UITableView()
    
    var list = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Home", "Category", "Latest News", "Favourites", "Profile", "Settings", "Share App"]
        
        createHeader()
        // Do any additional setup after loading the view.
    }
    
    func createHeader() {
        
        menuHeader = Bundle.main.loadNibNamed("MenuHeaderView", owner: nil, options: nil)?.first as! MenuHeaderView
        
        menuHeader.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 150)
        self.view.addSubview(menuHeader)
        
        tableMenu.frame = CGRect(x: 0, y: 200, width: self.view.frame.size.width/1.2, height: self.view.frame.height-200)
        tableMenu.delegate = self
        tableMenu.dataSource = self
        tableMenu.backgroundColor = .clear
        tableMenu.separatorColor = .clear
        tableMenu.allowsSelection = true
        tableMenu.isScrollEnabled = false
        
        tableMenu.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        
        self.view.addSubview(tableMenu)
        
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

extension MenuController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.titleLabel.text = list[indexPath.row] as? String
        cell.titleLabel.textColor = .white
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuCell
        
        cell.contentView.backgroundColor = UIColor.init(red: 44/255.0, green: 57/255.0, blue: 64/255.0, alpha: 1)
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        switch indexPath.row {
        case 0:
            let destination = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
            self.revealViewController().pushFrontViewController(destination, animated: true)
        case 1:
            let destination = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CategoryController")
            self.revealViewController().pushFrontViewController(destination, animated: true)
        case 2:
            print("Latest News")
        case 3:
            print("Favourites")
        case 4:
            print("Profile")
        case 5:
            print("Settings")
        default:
           print("SHARE APP")
        
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
}
