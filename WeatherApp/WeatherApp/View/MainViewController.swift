//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Miras Iskakov on 22.04.2024.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    private var searchTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Введите название города"
        field.textAlignment = .center
        field.borderStyle = .roundedRect
        field.backgroundColor = .white
        field.autocorrectionType = .yes
        field.autocapitalizationType = .words
        field.keyboardType = .default
        return field
    }()
    
    //private var

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        setupViews()
        constraintsViews()
    }
    
    func setupViews() {
        view.addSubview(searchTextField)
    }
    
    func constraintsViews() {
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            searchTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    func textFieldShouldReturn(_ field: UITextField) -> Bool {
        field.resignFirstResponder()
        return true
    }
}
