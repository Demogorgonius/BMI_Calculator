//
//  LabelsProperty.swift
//  BMI_Calculator
//
//  Created by Sergey on 02.02.2023.
//

import Foundation
import UIKit

struct LabelProperty {
    let labelFrame: CGRect = CGRect(x: 0, y: 0, width: 374, height: 614)
    let labelFont: UIFont = UIFont.systemFont(ofSize: 40.0, weight: .bold)
    let labelTextColor: UIColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    
    let sliderTitleLabelFrame: CGRect = CGRect(x: 0, y: 0, width: 50, height: 21)
    let sliderTitleLabelFont: UIFont = UIFont.systemFont(ofSize: 17.0, weight: .light)
    let sliderTitleTextColor: UIColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
}
