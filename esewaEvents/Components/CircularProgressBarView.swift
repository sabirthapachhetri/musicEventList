import UIKit
import MBCircularProgressBar

class CircularProgressBarView: MBCircularProgressBarView {
    
    var customMaxValue: CGFloat
    var customValue: CGFloat
    var customProgressColor: UIColor
    var customUnitString: String
    
    init(maxValue: CGFloat, value: CGFloat, progressColor: UIColor, unitString: String) {
        
        self.customMaxValue = maxValue
        self.customValue = value
        self.customProgressColor = progressColor
        self.customUnitString = unitString
        
        super.init(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        
        self.emptyLineStrokeColor = .systemGray
        self.layer.borderWidth = 0
        self.progressLineWidth = 5
        self.progressStrokeColor = progressColor
        self.showValueString = true
        self.showUnitString = true
        self.unitString = unitString
        self.valueFontSize = 16
        self.unitFontSize = 8
        self.progressColor = progressColor
        self.fontColor = UIColor.black
        self.backgroundColor = UIColor.white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
