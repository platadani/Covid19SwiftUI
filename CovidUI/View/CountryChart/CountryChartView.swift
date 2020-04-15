//
//  CountryChartView.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUICharts
import SwiftUI

struct CountryChartView: View {
    @ObservedObject var viewModel: CountryChartViewModel = CountryChartViewModel(country: Country(flagImage: "", name: "", slug: ""))

    init(viewModel: CountryChartViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text(viewModel.country.name)
            VStack {
                Picker(selection: Binding<Int>(
                    get: { self.viewModel.statusSelected },
                    set: { self.viewModel.statusSelected = $0 }), label: Text("Select")) {
                    ForEach(0..<viewModel.statusData.count) { index in
                        Text(self.viewModel.statusData[index].rawValue.capitalized).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                .padding([.leading, .trailing], 10)
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .center)
            LineView(data: viewModel.data.map { Double($0.cases) }, title: "", legend: "")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300, maxHeight: 300, alignment: .center)
                .padding([.leading, .trailing], 10)
            Spacer()
        }

    }
}

struct CountryChartView_Previews: PreviewProvider {
    static let viewModel = CountryChartViewModel(data: [CountryDataResponse(cases: 45, date: Date()),
                                                        CountryDataResponse(cases: 1500, date: Date())], country: Country(flagImage: "e", name: "Spain", slug: "spain"))

    static var previews: some View {
        CountryChartView(viewModel: viewModel)
    }
}
