//
//  ResultViewController.swift
//  BMI_Calculator
//
//  Created by Sergey on 04.02.2023.
//

import UIKit
import SnapKit

class ResultViewController: UIViewController {

    //MARK: - Variables
    
    var buttons = ButtonsProperty()
    var labels = LabelProperty()
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    //MARK: - Views and StackView
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "result_background")
        return imageView
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.alignment = .fill
        stackView.contentMode = .scaleToFill
        stackView.distribution = .fillProportionally
        [titleFirstLabel,
        resultTitleLabel,
        titleSecondLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    //MARK: - UIButtons
    
    lazy var recalculateButton: UIButton = {
        let button = UIButton(frame: buttons.buttonFrame)
        button.setTitle("RECALCULATE", for: .normal)
        button.backgroundColor = buttons.reCalcButtonColor
        button.titleLabel?.font = buttons.buttonFont
        button.setTitleColor(buttons.reCalcButtonTextColor, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Labels
    
    lazy var titleFirstLabel: UILabel = {
        let label = UILabel(frame: labels.resultFirstTitleLabelFrame)
        label.font = labels.resultFirstTitleLabelFont
        label.textColor = labels.resultFirstTitleTextColor
        label.textAlignment = .center
        label.text = "YOUR RESULT"
        return label
    }()
    
    lazy var resultTitleLabel: UILabel = {
        let label = UILabel(frame: labels.resultTitleLabelFrame)
        label.font = labels.resultTitleLabelFont
        label.textColor = labels.resultTitleTextColor
        label.textAlignment = .center
        label.text = "20.0"
        return label
    }()
    
    lazy var titleSecondLabel: UILabel = {
        let label = UILabel(frame: labels.resultSecondTitleLabelFrame)
        label.font = labels.resultSecondTitleLabelFont
        label.textColor = labels.resultSecondTitleTextColor
        label.textAlignment = .center
    label.text = "EAT SOME MORE SNACKS!"
        return label
    }()
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color
        view.addSubview(backgroundImageView)
        view.addSubview(verticalStackView)
        view.addSubview(recalculateButton)
        resultTitleLabel.text = bmiValue
        titleSecondLabel.text = advice
        setupConstraints()
        
    }
    
    //MARK: - Setup Constraints
    
    func setupConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        recalculateButton.snp.makeConstraints { make in
            make.height.equalTo(51)
            make.centerX.equalToSuperview()
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.bottom.equalToSuperview().offset(-40)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
//            make.top.equalToSuperview().offset(200)
            make.leading.equalTo(40)
            make.trailing.equalTo(-40)
//            make.height.equalToSuperview().offset(-100)
        }
        
    }
    
    //MARK: - Methods
    
    @objc func buttonTapped() {
        let vc = ViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }


}
