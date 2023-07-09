import UIKit
import MBCircularProgressBar

class CircularProgressBarView: MBCircularProgressBarView {
    
    // MARK: - Properties
    
    var customMaxValue: CGFloat
    var customValue: CGFloat
    var customProgressColor: UIColor
    var customUnitString: String
    
    // MARK: - Initialization
    
    init(maxValue: CGFloat, value: CGFloat, progressColor: UIColor, unitString: String) {
        self.customMaxValue = maxValue
        self.customValue = value
        self.customProgressColor = progressColor
        self.customUnitString = unitString
        
        super.init(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        
        setupProgressBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupProgressBar() {
        progressColor = customProgressColor
        maxValue = customMaxValue
        value = customValue
        unitString = customUnitString
        
        emptyLineStrokeColor = .systemGray
        layer.borderWidth = 0
        progressLineWidth = 5
        progressStrokeColor = customProgressColor
        showValueString = true
        showUnitString = true
        unitString = customUnitString
        valueFontSize = 16
        unitFontSize = 8
        fontColor = .black
        backgroundColor = .white
    }
}
