//
//  LineGraphCell.swift
//  ChartsDemo
//
//  Created by DG on 04/09/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import Charts

class LineGraphCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var lineChart: LineChartView!
    
    let x = [0]
    let y = [5]
    
    func setChartValues() {
        
        var values = [ChartDataEntry]()
        for index in x {
            let value = ChartDataEntry(x: Double(index), y: Double(y[index]))
            values.append(value)
        }
        
        let set1 = LineChartDataSet(entries: values, label: "Set1")
        let data = LineChartData(dataSet: set1)
//        let data = LineChartData()
//        data.addDataSet(set1)
        // Some debug output
        if data.entryCount > 0 {
            let yValue = "\(values[data.entryCount-1].y)"
            print("Y : \(yValue)")
            for value in values {
                print("\(value.y) ", terminator: "")
            }
        }
            
            let yAxis = self.lineChart.leftAxis
//            yAxis.labelFont = UIFont.mainAppFont(11)
            yAxis.setLabelCount(5, force: true)
//            yAxis.labelTextColor = .white
            yAxis.labelPosition = .outsideChart
//            yAxis.axisLineColor = .stackedTipTextColor
            yAxis.granularity = 1.0
            yAxis.granularityEnabled = true
            yAxis.drawGridLinesEnabled = true
            yAxis.drawAxisLineEnabled = false
        
        let xAxis = self.lineChart.xAxis
//        xAxis.labelFont = UIFont.mainAppFont(11)
//        xAxis.labelTextColor = .white
        xAxis.labelPosition = .bottom
//        xAxis.granularity = 1.0
//        xAxis.granularityEnabled = true
        xAxis.drawAxisLineEnabled = false
        xAxis.drawGridLinesEnabled = false
        xAxis.labelCount = x.count
        xAxis.setLabelCount(5, force: true)
//        xAxis.valueFormatter = DateValueFormatter()
        xAxis.yOffset = 20.0
        self.lineChart.data = data
    }

}
