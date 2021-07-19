//
//  ComplexViewController.swift
//  DiffTest
//
//  Created by YJ on 2021/07/19.
//

import Foundation
import UIKit

class ComplexViewController: UIViewController {
    private var model: [Profile] = Model.getComplexModel()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0x4C / 255, green: 0x52/255, blue: 0x70/255, alpha: 1.0)
        view.register(ImageCell.self, forCellWithReuseIdentifier: String(describing: ImageCell.self))
        
        return view
    }()
    
    let reloadBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(red: 0x3D / 255, green: 0x5B / 255, blue: 0x59 / 255, alpha: 1.0)
        btn.layer.cornerRadius = 4
        btn.setTitle("reload data", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        btn.titleLabel?.textColor = .white
        return btn
    }()
    
    override func viewDidLoad() {
        setUpView()
        setConstraints()
        setActions()
    }
    
    private func setUpView() {
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        view.addSubview(reloadBtn)
    }
    
    private func setConstraints() {
        setCollectionViewConstraints()
        setReloadBtnConstraints()
    }
    
    private func setCollectionViewConstraints() {
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setReloadBtnConstraints() {
        reloadBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        reloadBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        reloadBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        reloadBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        reloadBtn.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30).isActive = true
    }
    
    private func setActions() {
//        reloadBtn.addTarget(self, action: #selector(self.reloadData), for: .touchUpInside)
        reloadBtn.addTarget(self, action: #selector(self.reloadDataWithDiff), for: .touchUpInside)
    }
    
    @objc private func reloadData() {
        let newData = Model.getComplexModel()
        model = newData
        // 비효율적임. 변하지 않는 애들에 대해서도 모두 reload, 계산 작업이 들어감
        collectionView.reloadData()
    }
    
    @objc private func reloadDataWithDiff() {
        let newData = Model.getComplexModel()
        let diff = newData.difference(from: model)
        print(newData)
        var deletedIndexPaths = [IndexPath]()
        var insertedIndexPaths = [IndexPath]()
        
        // 위에서 로직으로 구현하기 어려웠던 과정을 diff 를 이용해서 간편하게 구현
        diff.forEach{
            switch $0 {
            case let .remove(offset, _, _):
                deletedIndexPaths.append(IndexPath(row: offset, section: 0))
            case let .insert(offset, _, _):
                insertedIndexPaths.append(IndexPath(row: offset, section: 0))
            }
        }
        
        model = newData
        
        collectionView.performBatchUpdates {
            collectionView.deleteItems(at: deletedIndexPaths)
            collectionView.insertItems(at: insertedIndexPaths)
        } completion: { completed in
            print("All done updating!")
        }
    }
}

extension ComplexViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ImageCell.self), for: indexPath) as! ImageCell
        cell.fill(profile: model[indexPath.item])
        return cell
    }
}

extension ComplexViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size.width / 5
        return CGSize(width: size, height: size)
    }
}
