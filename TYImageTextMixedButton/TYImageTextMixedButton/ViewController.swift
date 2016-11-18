//
//  ViewController.swift
//  TYImageTextMixedButton
//
//  Created by thomasTY on 16/11/16.
//  Copyright © 2016年 thomasTY. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let v : MenuView = MenuView()
        v.show(target: self)
    }
    
}

