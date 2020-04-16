//
//  CountriesCardView.swift
//  CovidUI
//
//  Created by Daniel Plata on 14/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI

struct CountriesCardView: View {
    var body: some View {
        ZStack {
            Color(hex: "222C44")
            HStack {
                ZStack {
                    HStack {
                        Image("virus")
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: 150, alignment: .leading)
                            .padding(EdgeInsets(top: 60, leading: 0, bottom: 0, trailing: 66))
                            .offset(x: -40, y: 0)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                            .frame(minWidth: 0, maxWidth: 100, alignment: .leading)
                        VStack {
                            Text("Country data")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, alignment: .leading)
                                .padding(.leading, 15)
                            Text("See all info on cases of infection, deaths and recoveries in each country")
                                .font(Font.system(size: 13))
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, alignment: .leading)
                                .padding(.leading, 15)
                        }
                        Image("right-arrow")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 15, height: 15, alignment: .center)
                            .foregroundColor(.white)
                            .padding(.trailing, 30)
                    }
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, maxHeight: 150, alignment: .center)
        .cornerRadius(15)
        .padding(.leading, 15)
        .padding(.top, 15)
        .padding(.trailing, -15)

    }
}

struct CountriesCardView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesCardView()
    }
}
