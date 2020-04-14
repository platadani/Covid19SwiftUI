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

    var textTitle: String {
        switch self {
        case .mask: return "Use masks"
        case .alcohol: return "Wash your hands frequently"
        case .gloves: return "Avoid touching everything and wear gloves"
        }
    }

    var description: String {
        switch self {
        case .mask: return "Cover your nose and mouth with disposable tissue or handkerchief. \nWhile coughing or sneezing cover your nose and mouth with handkerchief."
        case .alcohol: return "Wash your hands often with soap and water for at least 20 seconds."
        case .gloves: return "Avoid touching your eyes, nose and mouth if your hands aren't clean. \nYou should wear gloves especially when you go out"
        }
    }

    var fullImage: String {
        switch self {
        case .mask: return "Mask"
        case .alcohol: return "Alcohol"
        case .gloves: return "Gloves"
        }
    }
}
