//
//  CountryListView.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI

struct CountryListView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: CountryListViewModel

    init(viewModel: CountryListViewModel){
        self.viewModel = viewModel
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }

    var body: some View {
        List(viewModel.countries, id: \.id) { country in
            CountryListRow(country: country)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image("back-btn")
                    .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(.black)
                    }
                }
            )
        .navigationBarTitle("Select a country", displayMode: .inline)
            .navigationBarColor(.white)
    }
}

struct CountryListRow: View {
    @State var country: Country

    var body: some View {
        NavigationLink(destination: LazyView { CountryChartView(country: self.country) }) {
            CountryCardView(countryName: country.name, flagImage: country.flagImage)
            .padding(.bottom, 10)
        }
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CountryListView(viewModel: CountryListViewModel(countries: [Country(flagImage: "", name: "Spain", slug: "spain")]))
        }
    }
}
