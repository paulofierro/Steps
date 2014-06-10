//
//  TodayViewController.swift
//  StepsToday
//
//  Created by Paulo Fierro on 09/06/2014.
//  Copyright (c) 2014 jadehopper ltd. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController
{
    
    @IBOutlet var label : UILabel
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        // Get the total steps
        StepManager.totalStepsWalkedToday({data, emoji in
            self.label.text = "You've walked \(data) steps. \(emoji)"
        })
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!)
    {
        // Perform any setup necessary in order to update the view.

        // If an error is encoutered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
