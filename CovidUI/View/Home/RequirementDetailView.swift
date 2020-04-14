//
//  RequirementDetailView.swift
//  CovidUI
//
//  Created by Daniel Plata on 14/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI

struct RequirementDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: RequirementDetailViewModel
    var body: some View {
        ZStack {
            Color(hex: viewModel.requirement.color).edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image("close-btn")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60, alignment: .center)
                VStack {
                    Image(viewModel.requirement.fullImage)
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .scaledToFill()
                    Text(viewModel.requirement.textTitle)
                        .font(Font.system(size: 25))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 70, alignment: .center)
                        .padding()
                    Text(viewModel.requirement.description)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        .font(Font.system(size: 17))
                        .foregroundColor(Color(hex: "F4F6FC"))
                        .padding()
                        .background(Color.black.opacity(0.2))
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

struct RequirementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementDetailView(viewModel: RequirementDetailViewModel(requirement: .mask))
    }
}
