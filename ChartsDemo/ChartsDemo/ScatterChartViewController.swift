//
//  ScatterChartViewController.swift
//  ChartsDemo
//
//  Created by DG on 24/09/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import Charts

class ScatterChartViewController: UIViewController {

    @IBOutlet var chartView: ScatterChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Scatter Chart"
        setChart()
    }
    
    func setChart() {
        
//        chartView.delegate = self
        
        chartView.chartDescription?.enabled = false
        
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.maxVisibleCount = 200
        chartView.pinchZoomEnabled = true
        
        
        let l = chartView.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .top
        l.orientation = .vertical
        l.drawInside = false
        l.font = .systemFont(ofSize: 10, weight: .light)
        l.xOffset = 5
        
        let leftAxis = chartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        leftAxis.axisMinimum = 0
        var limitLine = ChartLimitLine()
        limitLine = ChartLimitLine(limit:50, label: "This weeks average")
        leftAxis.addLimitLine(limitLine)
        
        chartView.rightAxis.enabled = false
        
        
        let xAxis = chartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        xAxis.drawLimitLinesBehindDataEnabled = true
        var limitLineX = ChartLimitLine()
        limitLineX = ChartLimitLine(limit:5, label: "This weeks average")
        xAxis.addLimitLine(limitLineX)
        self.setDataCount(10, range: UInt32(100))
    
        
    }
    
    func setDataCount(_ count: Int, range: UInt32) {
        let values1 = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(range) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        let values2 = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(range) + 3)
            return ChartDataEntry(x: Double(i) + 0.33, y: val)
        }
        let values3 = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(range) + 3)
            return ChartDataEntry(x: Double(i) + 0.66, y: val)
        }

        
        let set1 = ScatterChartDataSet(entries: values1, label: "DS 1")
        set1.setScatterShape(.square)
        set1.setColor(ChartColorTemplates.colorful()[0])
        set1.scatterShapeSize = 8
        
        let set2 = ScatterChartDataSet(entries: values2, label: "DS 2")
        set2.setScatterShape(.circle)
        set2.scatterShapeHoleColor = ChartColorTemplates.colorful()[3]
        set2.scatterShapeHoleRadius = 3.5
        set2.setColor(ChartColorTemplates.colorful()[1])
        set2.scatterShapeSize = 8
        
        let set3 = ScatterChartDataSet(entries: values3, label: "DS 3")
        set3.setScatterShape(.cross)
        set3.setColor(ChartColorTemplates.colorful()[2])
        set3.scatterShapeSize = 8
        
        let data = ScatterChartData(dataSets: [set1, set2, set3])
        data.setValueFont(.systemFont(ofSize: 7, weight: .light))

        chartView.data = data
    }
    
}
