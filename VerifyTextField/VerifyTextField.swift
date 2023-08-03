//
//  VerifyTF.swift
//  VerifyTextField
//
//  Created by Алексей Авер on 02.08.2023.
//

import UIKit

protocol FieldsProtocol: AnyObject {
    func activateNextField(tag: Int)
    func activatePrevField(tag: Int)
}

class VerifyTextField: UITextField {
    
    weak var fieldDelegate: FieldsProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        configure()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) fail")
    }
    
    private func configure() {
        backgroundColor = #colorLiteral(red: 0.9075556397, green: 0.8140214682, blue: 1, alpha: 1)
        layer.cornerRadius = 10
        tintColor = .clear
        layer.borderColor = UIColor.purple.cgColor
        textColor = .purple
        font = UIFont.systemFont(ofSize: 40)
        textAlignment = .center
    }
    
    override func deleteBackward() {
        fieldDelegate?.activatePrevField(tag: tag)
    }
}
 
extension VerifyTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        text = string
        if range.length == 0 {
            fieldDelegate?.activateNextField(tag: tag)
            resignFirstResponder()
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.borderWidth = 0
    }
}
