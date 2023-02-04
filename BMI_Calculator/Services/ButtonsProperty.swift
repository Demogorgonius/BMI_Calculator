//
//  ButtonsProperty.swift
//  BMI_Calculator
//
//  Created by Sergey on 02.02.2023.
//

import Foundation
import UIKit

struct ButtonsProperty {
    let buttonFrame: CGRect = CGRect(x: 0, y: 0, width: 374, height: 80)
    let buttonFont: UIFont = UIFont.systemFont(ofSize: 25.0, weight: .regular)
    let calcButtonColor: UIColor = #colorLiteral(red: 0.3843137255, green: 0.3764705882, blue: 0.6156862745, alpha: 1)
    let calcButtonTextColor: UIColor = .white
    let reCalcButtonColor: UIColor = .white
    let reCalcButtonTextColor: UIColor = #colorLiteral(red: 0.3843137255, green: 0.3764705882, blue: 0.6156862745, alpha: 1)
}
