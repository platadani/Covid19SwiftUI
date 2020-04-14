//
//  HomeViewModel.swift
//  CovidUI
//
//  Created by Daniel Plata on 14/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    @Published var requeriments: [Requirement] = []
    deinit {
    }

    init() {
        requeriments = [.mask, .alcohol, .gloves]
    }
}
