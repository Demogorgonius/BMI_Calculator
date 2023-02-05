//
//  ViewController.swift
//  BMI_Calculator
//
//  Created by Sergey on 02.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - Variables
    
    var buttons = ButtonsProperty()
    var labels = LabelProperty()
    var sliders = SliderProperty()
    var calculatorController = CalculatorController()
    
    //MARK: - UILabels
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: labels.labelFrame)
        label.font = labels.labelFont
        label.textColor = labels.labelTextColor
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "CALCULATE YOUR BMI"
        return label
    }()
    
    lazy var sliderHeightLabel: UILabel = {
        let label = UILabel(frame: labels.sliderTitleLabelFrame)
        label.textColor = labels.labelTextColor
        label.font = labels.sliderTitleLabelFont
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Height"
        return label
    }()
    
    lazy var sliderHeightIndicationTitle: UILabel = {
        let label = UILabel(frame: labels.sliderTitleLabelFrame)
        label.textColor = labels.labelTextColor
        label.font = labels.sliderTitleLabelFont
        label.numberOfLines = 1
        label.textAlignment = .right
        label.text = "1,5m"
        return label
    }()
    
    lazy var sliderWeightLabel: UILabel = {
        let label = UILabel(frame: labels.sliderTitleLabelFrame)
        label.textColor = labels.labelTextColor
        label.font = labels.sliderTitleLabelFont
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Weight"
        return label
    }()
    
    lazy var sliderWeightIndication: UILabel = {
        let label = UILabel(frame: labels.sliderTitleLabelFrame)
        label.textColor = labels.labelTextColor
        label.font = labels.sliderTitleLabelFont
        label.numberOfLines = 1
        label.textAlignment = .right
        label.text = "20.0kg"
        return label
    }()
    
    //MARK: - UIButtons
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(frame: buttons.buttonFrame)
        button.setTitle("CALCULATE", for: .normal)
        button.backgroundColor = buttons.calcButtonColor
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = buttons.buttonFont
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.5
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - UIStackView/UIViews
    
    lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        [titleLabel,
         heightHorizontalStackView,
         heightSlider,
         weightHorizontalStackView,
         weightSlider,
         calculateButton].forEach {
            stack.addArrangedSubview($0)
        }
        
        return stack
    }()
    
    lazy var heightHorizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .fillProportionally
        [sliderHeightLabel,
         sliderHeightIndicationTitle].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var weightHorizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .fillProportionally
        [sliderWeightLabel,
         sliderWeightIndication].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "calculate_background")
        return imageView
    }()
    
    //MARK: - Other UI Elements
    
    lazy var heightSlider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        slider.minimumValue = 1.0
        slider.maximumValue = 2.5
        slider.isContinuous = true
        slider.minimumTrackTintColor = sliders.minTrackColor
        slider.thumbTintColor = sliders.thumbTintColor
        slider.addTarget(self, action: #selector(heightSliderChange), for: .valueChanged)
        return slider
    }()
    
    lazy var weightSlider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        slider.minimumValue = 20.0
        slider.maximumValue = 200.0
        slider.isContinuous = true
        slider.minimumTrackTintColor = sliders.minTrackColor
        slider.thumbTintColor = sliders.thumbTintColor
        slider.addTarget(self, action: #selector(weightSliderChange), for: .valueChanged)
        return slider
    }()
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView)
        view.addSubview(verticalStackView)
        setupConstraints()
    }
    
    //MARK: - Make constraints
    
    func setupConstraints() {
        
        backgroundImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        verticalStackView.snp.makeConstraints { (make) in
            make.height.equalToSuperview().offset(-40)
            make.width.equalToSuperview().offset(-20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
        
        calculateButton.snp.makeConstraints { make in
            make.height.equalTo(51)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.centerX.equalTo(verticalStackView)
        }
        
        sliderHeightLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        sliderHeightIndicationTitle.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        heightSlider.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        sliderWeightLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        sliderWeightIndication.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        weightSlider.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
    }
    
    //MARK: - Methods
    
    @objc func buttonTapped() {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorController.calculateBMI(height: height, weight: weight)
        goToResultVC()
    }
    
    @objc func heightSliderChange(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        sliderHeightIndicationTitle.text = "\(height)m"
    }
    
    @objc func weightSliderChange(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        sliderWeightIndication.text = "\(weight)kg"
    }
    
    func goToResultVC() {
        let secondVC = ResultViewController()
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.advice = calculatorController.getAdvice()
        secondVC.color = calculatorController.getColor()
        secondVC.bmiValue = calculatorController.getBMIValue()
        self.present(secondVC, animated: true, completion: nil)
    }
    
}

