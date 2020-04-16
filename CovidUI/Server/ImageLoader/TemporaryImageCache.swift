//
//  TemporaryImageCache.swift
//  CovidUI
//
//  Created by Daniel Plata on 16/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import UIKit
import Foundation

protocol ImageCache {
    subscript(_ url: URL) -> UIImage? { get set }
}

struct TemporaryImageCache: ImageCache {
    private let cache = NSCache<NSURL, UIImage>()

    subscript(_ key: URL) -> UIImage? {
        get { cache.object(forKey: key as NSURL) }
        set { newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL) }
    }
}
