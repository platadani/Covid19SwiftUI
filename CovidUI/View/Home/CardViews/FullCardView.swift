//
//  FullCardView.swift
//  CovidUI
//
//  Created by Daniel Plata on 14/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI

struct FullCardView: View {
    var body: some View {
        ZStack {
            Color(hex: "3C4FE9")
            HStack {
                VStack {
                    Text("Stay at home to Stop corona virus")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, alignment: .center)
                        .padding(.leading, 15)
                    Text("Know more")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(5)
                        .background(Color(hex: "2C3ECC"))
                        .cornerRadius(5)
                        .padding()
                }
                VStack {
                    Image("g_msk")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .bottom)
                        .padding(EdgeInsets(top: 65, leading: 0, bottom: 0, trailing: 0))
                }
            }

        }
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 150, alignment: .center)
        .cornerRadius(15)
        .padding()
    }
}

struct FullCardView_Previews: PreviewProvider {
    static var previews: some View {
        FullCardView()
    }
}
