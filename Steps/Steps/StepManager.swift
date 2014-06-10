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
typealias PFStepQueryHandler = (String) -> Void


class StepManager
{
    // TODO: Figure out the syntax so we can write something nice like this:
    class func totalStepsWalkedToday(handler: PFStepQueryHandler!)
    {
        var totalSteps:String = "0"
        
        if CMStepCounter.isStepCountingAvailable()
        {
            let pedometer:CMStepCounter             = CMStepCounter() // CMPedometer doesn't return anything when we query it in iOS 8 beta 1
            let lengthFormatter:NSLengthFormatter   = NSLengthFormatter()
            
            // Calculate the start date
            let now:NSDate                  = NSDate()
            let calendar:NSCalendar         = NSCalendar.currentCalendar()
            let flags: NSCalendarUnit       = .DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit
            var components:NSDateComponents = calendar.components(flags, fromDate: now)
            components.hour                 = 0
            let startDate:NSDate            = calendar.dateFromComponents(components)
            
            pedometer.queryStepCountStartingFrom(startDate, to: NSDate(), toQueue: NSOperationQueue(), withHandler: { data, error in
                
                if !error
                {
                    let numberFormatter:NSNumberFormatter = NSNumberFormatter()
                    numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                    totalSteps = numberFormatter.stringFromNumber(data)
                    
                    println("Steps taken today: \(totalSteps)")
                    handler(totalSteps)
                }
                else
                {
                    // TODO: Return the error
                    println("ERROR: \(error)")
                    totalSteps = "-1"
                    handler("-1")
                }
                
            })
        }
        else
        {
            // TODO: Return an error stating that step counting is not available
            handler("-2")
        }
    }
}