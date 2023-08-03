//
//  UIViewControllerExtensions.swift
//  VerifyTextField
//
//  Created by Алексей Авер on 03.08.2023.
//

import UIKit

extension UIViewController {
    func showAlert(text: String) {
        let alertController = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
