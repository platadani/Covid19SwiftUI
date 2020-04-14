//
//  CardView.swift
//  CovidUI
//
//  Created by Daniel Plata on 14/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var color: String
    var text: String
    var image: String

    var body: some View {
        ZStack {
            Color(hex: color)
            HStack {
                VStack {
                    Text(text)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                    Image(image)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 0))
                }
                VStack {
                    Text("")
                }
            }
        }.frame(width: 150, height: 120, alignment: .center)
        .cornerRadius(15)
            .padding([.leading, .trailing], 5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(color: "F17F8B", text: "Preview", image: "mask")
    }
}
