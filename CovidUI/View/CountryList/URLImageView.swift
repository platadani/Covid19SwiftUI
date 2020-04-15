//
//  URLImageView.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//
import Foundation
import SwiftUI

struct URLImageView: View {
    @ObservedObject private var imageLoader = ImageLoader()

    var placeholder: Image

    init(url: String, placeholder: Image = Image("")) {
        self.placeholder = placeholder
        self.imageLoader.load(url: url)
    }

    var body: some View {
        if let uiImage = self.imageLoader.downloadedImage {
            return Image(uiImage: uiImage)
            .resizable()
        } else {
            return placeholder
        }
    }

}
