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
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: CountryChartViewModel = CountryChartViewModel(country: Country(flagImage: "", name: "", slug: ""))

    init(viewModel: CountryChartViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color(hex: "388A7B").edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    HStack {
                        URLImageView(url: viewModel.country.flagImage)
                            .scaledToFit()
                            .frame(width: 25, height: 25, alignment: .center)
                            .padding(10)
                        Text(viewModel.country.name)
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40, alignment: .center)

                    VStack {
                        Picker(selection: Binding<Int>(
                            get: { self.viewModel.statusSelected },
                            set: { self.viewModel.statusSelected = $0 }), label: Text("Select")) {
                            ForEach(0..<viewModel.statusData.count) { index in
                                Text(self.viewModel.statusData[index].rawValue.capitalized).tag(index)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                            .padding([.leading, .trailing, .bottom], 10)
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30, alignment: .center)

                }
                VStack {
                    VStack {
                        HStack {
                            Text(viewModel.statusData[viewModel.statusSelected].titleText)
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex:"2A685D"))
                                .padding([.leading, .bottom], 40)
                                .padding(.top, 60)
                            Spacer()
                        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .center)
                        LineView(data: viewModel.data.map { Double($0.cases) }, title: nil, legend: nil)
                            .padding([.leading, .trailing], 10)
                        Spacer()
                    }
                    Spacer()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    Button(action: {
                        self.viewModel.openURLInSafari()
                    }) {
                        Image("covidapi-logo")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color(hex: "388A7B"))
                        .frame(width: 90, height: 30, alignment: .center)
                        .padding(.bottom, 40)
                    }
                }
                .background(Color.white)
                .cornerRadius(20)
            .offset(x: 0, y: 20)
            }

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
                        .foregroundColor(Color(hex: "8AEAD9"))
                    }
                }
            )
        .navigationBarTitle("", displayMode: .inline)
            .navigationBarColor(UIColor().from(hexString: "388A7B"))
    }
}

struct CountryChartView_Previews: PreviewProvider {
    static let viewModel = CountryChartViewModel(data: [CountryDataResponse(cases: 45, date: Date()),
                                                        CountryDataResponse(cases: 1500, date: Date())], country: Country(flagImage: "e", name: "Spain", slug: "spain"))

    static var previews: some View {
        NavigationView {
            CountryChartView(viewModel: viewModel)
        }
    }
}
