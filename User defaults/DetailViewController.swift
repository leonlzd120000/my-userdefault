//
//  DetailViewController.swift
//  User defaults
//
//  Created by leon on 2018/10/3.
//  Copyright © 2018年 leonlee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var dataPassOver : String = ""
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = dataPassOver
       
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
