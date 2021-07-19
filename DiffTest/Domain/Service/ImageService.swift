//
//  ImageService.swift
//  DiffTest
//
//  Created by YJ on 2021/07/19.
//

import Foundation
import UIKit

protocol Cancellable {

    func cancel()
}

extension URLSessionTask: Cancellable {

}

final class ImageService {

    // MARK: - Public API
    func image(for url: URL, completion: @escaping (UIImage?) -> Void) -> Cancellable {
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            var image: UIImage?

            defer {
                // Execute Handler on Main Thread
                DispatchQueue.main.async {
                    // Execute Handler
                    completion(image)
                }
            }

            if let data = data {
                // Create Image from Data
                image = UIImage(data: data)
            }
        }

        // Resume Data Task
        dataTask.resume()

        return dataTask
    }

}
