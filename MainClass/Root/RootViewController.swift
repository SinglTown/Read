//
//  RootViewController.swift
//  AnyeProject
//
//  Created by 赵传保 on 2017/7/19.
//  Copyright © 2017年 赵传保. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.navigationController?.navigationBar.barTintColor = kMainTopBackColor
        
        self.navigationController?.navigationBar.titleTextAttributes =  [NSForegroundColorAttributeName:UIColor.white]
    }
    
    public func setTitleOfVC(titleStr:String) {
        self.navigationController?.navigationItem.title = titleStr
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
