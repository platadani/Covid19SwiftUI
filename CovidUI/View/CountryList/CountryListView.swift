//
//  CountryListView.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI

struct CountryListView: View {
    @ObservedObject var viewModel = CountryListViewModel()
    var body: some View {
        List {
            ForEach(viewModel.countries, id: \.id) { country in
                HStack {
                    URLImageView(url: country.flagImage)
                        .scaledToFit()
                        .frame(width: 20, height: 20, alignment: .center)
                    NavigationLink(destination: CountryChartView(viewModel: CountryChartViewModel(country: country))) {
                        Text(country.name)
                    }
                }
            }
        }
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
