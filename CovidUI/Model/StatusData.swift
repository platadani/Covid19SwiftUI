//
//  StatusData.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import Foundation

enum StatusData: String {
    case confirmed = "confirmed"
    case recovered = "recovered"
    case deaths = "deaths"

    var titleText: String {
        switch self {
        case .confirmed: return "Total cases"
        case .recovered: return "Total recovered"
        case .deaths: return "Total deaths"
        }
    }
}
