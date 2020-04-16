//
//  ImageCacheKey.swift
//  CovidUI
//
//  Created by Daniel Plata on 16/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI
import Foundation

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
