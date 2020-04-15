//
//  ImageLoader.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//
import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var downloadedImage: UIImage?
    //let didChange = PassthroughSubject<ImageLoader?, Never>()

    func load(url: String) {
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct!")
        }

        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data else { return self.downloadedImage = nil }
            DispatchQueue.main.async {
                self.downloadedImage = UIImage(data: data)
            }
        }.resume()
    }
}
