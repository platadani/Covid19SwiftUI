//
//  RequirementDetailView.swift
//  CovidUI
//
//  Created by Daniel Plata on 14/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI

struct RequirementDetailView: View {
    @ObservedObject var viewModel: RequirementDetailViewModel
    var body: some View {
        VStack {
            Text(viewModel.requirement.textTitle)
            Text(viewModel.requirement.description)
        }
    }
}

struct RequirementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementDetailView(viewModel: RequirementDetailViewModel(requirement: .mask))
    }
}
