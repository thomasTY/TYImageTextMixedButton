//
//  ModelViewController.swift
//  TYImageTextMixedButton
//
//  Created by thomasTY on 16/11/18.
//  Copyright © 2016年 thomasTY. All rights reserved.
//

import UIKit

class ModelViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.groupTableViewBackground
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
            self.dismiss(animated: true, completion: nil)
    }

}
