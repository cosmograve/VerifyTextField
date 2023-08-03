//
//  ViewController.swift
//  VerifyTextField
//
//  Created by Алексей Авер on 02.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let verifyView = VerifyView()
    private let accessCode = "12345"
    private lazy var verifyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(verifyTapped), for: .touchUpInside)
        button.setTitle("Verify", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verifyView.verifyDelegate = self
        view.backgroundColor = .white
        view.addSubview(verifyView)
        view.addSubview(verifyButton)
        setConstraints()
    }

    @objc private func verifyTapped() {
        let code = verifyView.getFieldsCode()
        if code == accessCode {
            showAlert(text: "Done")
        }else {
            showAlert(text: "Error")
        }
    }
}

extension ViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            verifyView.centerYAnchor.constraint(equalTo: view.centerYAnchor ),
            verifyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verifyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verifyView.heightAnchor.constraint(equalToConstant: 100),
            
            verifyButton.topAnchor.constraint(equalTo: verifyView .bottomAnchor, constant: 20 ),
            verifyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verifyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verifyButton.heightAnchor.constraint(equalToConstant: 54)])
        
        
    }
}

extension ViewController: VerifyProtocol {
    func verify() {
        verifyTapped()
    }
    
    
}
