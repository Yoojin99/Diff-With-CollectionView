//
//  ImageCell.swift
//  DiffTest
//
//  Created by YJ on 2021/07/19.
//

import Foundation
import UIKit

class ImageCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 2
        view.layer.masksToBounds = false
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = view.frame.height/2
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var imageService = ImageService()
    private var imageRequest: Cancellable?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        contentView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func fill(profile: Profile) {
//        downloadImage(from: URL(string: profile.imageUrl)!)
        imageRequest = imageService.image(for: URL(string: profile.imageUrl)!) { [weak self] image in
            self?.imageView.image = image
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        // Reset Thumbnail Image View
        imageView.image = nil

        // Cancel Image Request
        imageRequest?.cancel()
    }
    
    func downloadImage(from url: URL) {
        var request = URLRequest(url: url)
            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else {
                        print("Download image fail : \(url)")
                        return
                }

                DispatchQueue.main.async() {[weak self] in
                    print("Download image success \(url)")

                    self?.imageView.image = image
                }
            }.resume()
    }
}
