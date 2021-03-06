//
//  ConditionalFormattingController.swift
//  FlexChart101
//
//  Copyright (c) 2015 GrapeCity. All rights reserved.
//

import UIKit
import XuniFlexChartKit

class ConditionalFormattingController: UIViewController {
    
    var _chart = FlexChart()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Conditional Formatting", comment: "")
        
        // Do any additional setup after loading the view.
        let sine = XuniSeries(forChart: _chart, binding: "y", name: "sine")
        sine.bindingX = "x";
        
        _chart.series.addObject(sine)
        _chart.chartType = XuniChartType.LineSymbols
        _chart.bindingX = "x"
        _chart.itemsSource = getData()
        _chart.loadAnimation.animationMode = XuniAnimationMode.Point
        _chart.axisY.format = "F1"
        _chart.axisX.format = "F1"
        
        func plotElementLoadingHandler(args: XuniEventContainer!) {
            let plotArgs = args.eventArgs as! XuniChartPlotElementEventArgs
            if plotArgs.dataPoint != nil && plotArgs.defaultRender != nil {
                let y = plotArgs.dataPoint.value;
                
                // change color values based on y-axis values
                let r = (y >= 0 ? 1 : ((1 + y)))
                let b = (y < 0 ? 1 : ((1 - y)))
                let g = (1 - fabs(y))
                let a = 0.8
                
                (plotArgs.renderEngine as! XuniRenderEngine).setFill(UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a)))
                plotArgs.defaultRender.execute()
            }
        }
        _chart.plotElementLoading.addHandler(plotElementLoadingHandler, forObject: self)
        
        self.view.addSubview(_chart)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        _chart.frame = CGRectMake(0, 65, self.view.bounds.size.width, self.view.bounds.size.height - 65)
    }
    
    func getData() -> NSMutableArray {
        let array = NSMutableArray()
        
        for var i = 0; i < 30; i++ {
            array.addObject(ChartPoint(x: (0.16 * Double(i)), y: cos(0.12 * Double(i))))
        }
        
        return array;
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
