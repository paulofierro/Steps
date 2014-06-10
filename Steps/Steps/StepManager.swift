//
//  StepManager.swift
//  Steps
//
//  Created by Paulo Fierro on 09/06/2014.
//  Copyright (c) 2014 jadehopper ltd. All rights reserved.
//

import Foundation
import CoreMotion

/*
*  PFStepQueryHandler
*
*  Discussion:
*    Typedef of block to be invoked when the step count query is completed.
*/
typealias PFStepQueryHandler = (String, String) -> Void


class StepManager
{
    // TODO: Figure out the syntax so we can write something nice like this:
    class func totalStepsWalkedToday(handler:PFStepQueryHandler!)
    {
        var totalSteps:String = "0"
        
        if CMStepCounter.isStepCountingAvailable()
        {
            let pedometer:CMStepCounter             = CMStepCounter() // CMPedometer doesn't seem to return anything when we query it in iOS 8 beta 1
            let lengthFormatter:NSLengthFormatter   = NSLengthFormatter()
            
            let now:NSDate          = NSDate()
            let startDate:NSDate    = NSCalendar.currentCalendar().startOfDayForDate(now)
            
            pedometer.queryStepCountStartingFrom(startDate, to: NSDate(), toQueue: NSOperationQueue.mainQueue(), withHandler: { data, error in
                
                if !error
                {
                    let numberFormatter:NSNumberFormatter   = NSNumberFormatter()
                    numberFormatter.numberStyle             = NSNumberFormatterStyle.DecimalStyle
                    totalSteps                              = numberFormatter.stringFromNumber(data)
                    
                    println("Steps taken today: \(totalSteps)")
                    
                    var emoji:String
                    
                    if data >= 10000
                    {
                        emoji = "😁👍👍👍💪"
                        
                    }
                    else if data >= 7500
                    {
                        emoji = "😃👍👍"
                    }
                    else if data >= 5000
                    {
                        emoji = "😏👍"
                    }
                    else if data >= 2500
                    {
                        emoji = "😐"
                    }
                    else
                    {
                        emoji = "😩"
                    }
                    
                    handler(totalSteps, emoji)
                }
                else
                {
                    // TODO: Return the error
                    println("ERROR: \(error)")
                    totalSteps = "-1"
                    handler("-1", "💩")
                }
                
            })
        }
        else
        {
            // TODO: Return an error stating that step counting is not available
            handler("-2", "💩")
        }
    }
}