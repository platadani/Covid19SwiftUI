//
//  Requirement.swift
//  CovidUI
//
//  Created by Daniel Plata on 14/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import Foundation

enum Requirement {
    case mask
    case alcohol
    case gloves

    var text: String {
        switch self {
        case .mask: return "Mask"
        case .alcohol: return "Alcohol"
        case .gloves: return "Gloves"
        }
    }

    var color: String {
        switch self {
        case .mask: return "F6D06F"
        case .alcohol: return "4F62ED"
        case .gloves: return "F17F8B"
        }
    }

    var image: String {
        switch self {
        case .mask: return "mask"
        case .alcohol: return "hand-sanitizer"
        case .gloves: return "gloves"
        }
    }
}
