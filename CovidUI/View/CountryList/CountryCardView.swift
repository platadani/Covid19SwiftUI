//
//  CountryCardView.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI

struct CountryCardView: View {
    @Environment(\.imageCache) var cache: ImageCache
    var countryName: String
    var flagImage: String

    var body: some View {
        ZStack {
            Color(hex: "388A7B")
            HStack {
                ZStack {
                    HStack {
                        Spacer()
                        Image("shadow")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .trailing)
                        .offset(x: 10, y: 20)
                    }
                    HStack {
                        HStack {
                            AsyncImage(urlString: flagImage, placeholder: Text("..."), cache: self.cache)
                                .frame(minWidth: 30, maxWidth: 30, minHeight: 20, maxHeight: 20)
                                .aspectRatio(3 / 2, contentMode: .fit)
                                .padding(.leading, 40)
                        }
                        Text(countryName)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, alignment: .leading)
                        Spacer()
                    }
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 150, alignment: .center)
        .cornerRadius(15)
        .padding(.leading, 3)
        .padding(.trailing, 0)

    }
}

struct CountryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CountryCardView(countryName: "Spain", flagImage: "https://raw.githubusercontent.com/hjnilsson/country-flags/master/png1000px/es.png")
    }
}
