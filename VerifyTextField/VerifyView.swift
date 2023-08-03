//
//  VerifyView.swift
//  VerifyTextField
//
//  Created by Алексей Авер on 02.08.2023.
//

import UIKit
protocol VerifyProtocol: AnyObject {
    func verify()
}

class VerifyView: UIView {
    
    weak var verifyDelegate: VerifyProtocol?
    
    var stack = UIStackView()
    var verifyFields = [VerifyTextField]()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
        setConstraints()
        verifyFields[0].becomeFirstResponder()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) fail")
    }
    
    private func configuration() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        stack.distribution = .fillEqually
        
        for number in 0...4 {
            let verifyTextField = VerifyTextField()
            verifyTextField.tag = number
            verifyTextField.fieldDelegate = self
            verifyFields.append(verifyTextField)
            stack.addArrangedSubview(verifyTextField)
            
        }
        addSubview(stack)
    }
    
    func getFieldsCode() -> String {
        var verifyCode = ""
        verifyFields.forEach {
            verifyCode.append($0.text ?? "")
        }
        return verifyCode
    }
}

extension VerifyView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
         ])
    }
}

extension VerifyView: FieldsProtocol {
    func activateNextField(tag: Int) {
        if tag != verifyFields.count - 1 {
            verifyFields[tag + 1].becomeFirstResponder()
        }  else {
            verifyDelegate?.verify()
        }
    }
    
    func activatePrevField(tag: Int) {
        if tag != 0 {
            verifyFields[tag - 1].text = ""
            verifyFields[tag - 1].becomeFirstResponder()
        }
    }
    
    
}
