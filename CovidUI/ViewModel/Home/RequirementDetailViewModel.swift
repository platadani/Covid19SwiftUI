//
//  RequirementDetailViewModel.swift
//  CovidUI
//
//  Created by Daniel Plata on 14/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI
import Combine

final class RequirementDetailViewModel: ObservableObject {
    var requirement: Requirement!
    deinit {
    }

    init(requirement: Requirement) {
        self.requirement = requirement
    }
}
