//
//  HomeView.swift
//  CovidUI
//
//  Created by Daniel Plata on 14/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var showRequirementDetail: Bool = false
    @State var showStayHomeDetail: Bool = false
    @State var showCountryList: Bool = false

    @State var requirementSelected: Requirement?

    init() {
        // this is not the same as manipulating the proxy directly
        let appearance = UINavigationBarAppearance()

        // this overrides everything you have set up earlier.
        appearance.configureWithTransparentBackground()
        //appearance.backgroundColor = .white

        appearance.largeTitleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 20, weight: .bold),
            NSAttributedString.Key.foregroundColor : UIColor().from(hexString: "222C44"),

        ]
        appearance.titleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 20, weight: .bold),
            NSAttributedString.Key.foregroundColor : UIColor().from(hexString: "222C44")
        ]

        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().tintColor = UIColor().from(hexString: "222C44")
    }

    var body: some View {
        ZStack {
            Color(hex: "F4F6FC").edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    Text("Requirements")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                        .padding(.top, 30)
                        .foregroundColor(Color(hex: "51525C"))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.requeriments, id: \.self) { req in
                                CardView(color: req.color, text: req.text, image: req.image)
                                    .onTapGesture {
                                        self.requirementSelected = req
                                        self.showRequirementDetail.toggle()
                                    }
                                    .sheet(isPresented: self.$showRequirementDetail) {
                                        RequirementDetailView(viewModel: RequirementDetailViewModel(requirement: self.requirementSelected!))
                                    }
                                }
                            }.padding([.leading, .trailing], 10)
                    }.frame(height: 120)
                    FullCardView()
                    .onTapGesture {
                        self.showStayHomeDetail.toggle()
                    }
                    .sheet(isPresented: self.$showStayHomeDetail) {
                        RequirementDetailView(viewModel: RequirementDetailViewModel(requirement: .stayHome))
                    }
                    NavigationLink(destination: LazyView { CountryListView(viewModel: CountryListViewModel()) }) {
                        CountriesCardView()
                    }
                }
            }
        }.navigationBarTitle("Covid-19 Info", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
            .navigationBarColor(UIColor().from(hexString: "F4F6FC"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
