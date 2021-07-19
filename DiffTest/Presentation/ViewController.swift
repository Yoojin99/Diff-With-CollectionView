//
//  ViewController.swift
//  DiffTest
//
//  Created by YJ on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {
    
    let simpleBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(red: 0x74 / 255, green: 0xBD / 255, blue: 0xCB / 255, alpha: 1.0)
        btn.layer.cornerRadius = 4
        btn.setTitle("simple", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        btn.titleLabel?.textColor = .white
        return btn
    }()
    
    let complexBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(red: 0xFF / 255, green: 0xA3 / 255, blue: 0x84 / 255, alpha: 1.0)
        btn.layer.cornerRadius = 4
        btn.setTitle("complex", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        btn.titleLabel?.textColor = .white
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpView()
        setConstraints()
        setActions()
    }

    private func setUpView() {
        view.backgroundColor = .white
        view.addSubview(simpleBtn)
        view.addSubview(complexBtn)
    }

    private func setConstraints() {
        setSimpleBtnConstraints()
        setComplexBtnConstraints()
    }
    
    private func setActions() {
        simpleBtn.addTarget(self, action: #selector(self.openSimpleViewController), for: .touchUpInside)
        complexBtn.addTarget(self, action: #selector(self.openComplexViewController), for: .touchUpInside)
    }
    
    private func setSimpleBtnConstraints() {
        simpleBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        simpleBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        simpleBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        simpleBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setComplexBtnConstraints() {
        complexBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        complexBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        complexBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
        complexBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc private func openSimpleViewController() {
        navigationController?.pushViewController(SimpleViewController(), animated: true)
    }
    
    @objc private func openComplexViewController() {
        navigationController?.pushViewController(ComplexViewController(), animated: true)
    }
}

