//
//  CountriesResponse.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import Foundation

struct CountryResponse: Decodable {
    let name: String
    let slug: String
    let iso2: String

    enum CodingKeys: String, CodingKey {
        case name = "Country"
        case slug = "Slug"
        case iso2 = "ISO2"
    }
}
