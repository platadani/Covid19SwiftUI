//
//  CountryDataResponse.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import Foundation

struct CountryDataResponse: Decodable {
    let cases: Int
    let date: Date

    enum CodingKeys: String, CodingKey {
        case cases = "Cases"
        case date = "Date"
    }
}
