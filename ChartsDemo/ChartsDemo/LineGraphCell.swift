//
//  LineGraphCell.swift
//  ChartsDemo
//
//  Created by Sheshnath on 04/09/19.
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
    
    let x = [0,1,2,3,4,5,6,7,8,9]
    let y = [0,1,2,3,4,5,6,7,8,9]
    
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
        self.lineChart.data = data
    }

}
