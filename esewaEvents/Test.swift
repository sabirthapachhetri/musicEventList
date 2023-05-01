//
//  Test.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 5/1/23.
//

import UIKit
import MBCircularProgressBar

class CircularProgressBarView: MBCircularProgressBarView {
    
    var customMaxValue: CGFloat
    var customValue: CGFloat
    var customProgressColor: UIColor
    var customUnitString: String
    
    init(frame: CGRect, maxValue: CGFloat, value: CGFloat, progressColor: UIColor, unitString: String) {
        self.customMaxValue = maxValue
        self.customValue = value
        self.customProgressColor = progressColor
        self.customUnitString = unitString
        
        super.init(frame: frame)
        
        self.maxValue = maxValue
        self.value = value
        self.progressColor = progressColor
        self.unitString = unitString
        
        self.emptyLineStrokeColor = .gray
        self.layer.borderWidth = 0
        self.progressLineWidth = 5
        self.progressStrokeColor = progressColor
        self.showValueString = true
        self.showUnitString = true
        self.unitString = unitString
        self.valueFontSize = 20
        self.unitFontSize = 10
        self.fontColor = UIColor.black
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
