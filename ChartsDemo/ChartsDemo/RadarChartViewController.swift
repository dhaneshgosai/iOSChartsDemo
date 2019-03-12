//
//  RadarChartViewController.swift
//  ChartsDemo
//
//  Created by Sheshnath on 11/03/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import Charts

class RadarChartViewController: UIViewController {
    
    @IBOutlet var radarChartView: RadarChartView!
    var mobileTech: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Radar Chart"
        self.radarChartView.setUpRadarChartData()
        self.radarChartView.extraLeftOffset = 10
        self.radarChartView.extraRightOffset = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.radarChartView.animate(xAxisDuration: 0.0, yAxisDuration: 1.0)
    }

}

extension RadarChartView {
    
    private class RadarChartFormatter: NSObject, IAxisValueFormatter {
        
        var labels: [String] = []
        
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            if Int(value) < labels.count {
                return labels[Int(value)]
            }else{
                return String("")
            }
        }
        
        init(labels: [String]) {
            super.init()
            self.labels = labels
        }
    }
    
    func setUpRadarChartData(){
        
        let ys1 = Array(1..<10).map { x in return sin(Double(x) / 2.0 / 3.141 * 1.5) }
        let ys2 = Array(1..<10).map { x in return cos(Double(x) / 2.0 / 3.141) }
        
        let yse1 = ys1.enumerated().map { x, y in return RadarChartDataEntry(value: y) }
        let yse2 = ys2.enumerated().map { x, y in return RadarChartDataEntry(value: y) }
        
        let data = RadarChartData()
        let ds1 = RadarChartDataSet(values: yse1, label: "Hello")
        ds1.colors = [NSUIColor.red]
        data.addDataSet(ds1)
        
        let ds2 = RadarChartDataSet(values: yse2, label: "World")
        ds2.colors = [NSUIColor.blue]
        data.addDataSet(ds2)
        self.data = data
        self.chartDescription?.text = "Radarchart Demo"
        
        let xValues = ["X1", "X2", "X3", "X4", "X5", "X6", "X7", "X8", "X9", "X10"]
        let chartFormatter = RadarChartFormatter(labels: xValues)
        let xAxis = XAxis()
        xAxis.valueFormatter = chartFormatter
        self.xAxis.valueFormatter = xAxis.valueFormatter
        
        self.xAxis.labelTextColor = .blue
        self.xAxis.labelFont = UIFont.boldSystemFont(ofSize: 12)
        
    }
}
