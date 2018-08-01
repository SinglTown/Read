//
//  AnyeBookShelfVC.swift
//  AnyeProject
//
//  Created by 赵传保 on 2017/8/22.
//  Copyright © 2017年 赵传保. All rights reserved.
//

import UIKit

class AnyeBookShelfVC: RootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.alpha = 0
        
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
