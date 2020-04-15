//
//  Country.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import Foundation

struct Country: Identifiable {
    var id = UUID()
    let flagImage: String
    let name: String
}
