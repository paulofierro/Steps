//
//  ViewController.swift
//  Steps
//
//  Created by Paulo Fierro on 09/06/2014.
//  Copyright (c) 2014 jadehopper ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @lazy var label: UILabel = {
        let label:UILabel   = UILabel(frame: self.view.bounds)
        label.textColor     = UIColor.whiteColor()
        label.font          = UIFont(name: "HelveticaNeue-UltraLight", size: 60)
        label.textAlignment = NSTextAlignment.Center
        return label
    }()
    
    @lazy var spinner: UIActivityIndicatorView = {
        let spinner:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
        spinner.center = self.view.center
        return spinner
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationController.navigationBarHidden = true
        self.view.backgroundColor = UIColor.redColor()
        
        // Add the label
        self.view.addSubview(label)
        
        // Add the spinner
        spinner.startAnimating()
        self.view.addSubview(spinner)
        
        // Get the total steps
        StepManager.totalStepsWalkedToday({data in
            
            self.label.text = data
            self.spinner.stopAnimating()
        })
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return UIStatusBarStyle.LightContent;
    }
}

