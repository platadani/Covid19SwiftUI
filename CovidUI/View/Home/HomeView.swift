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
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor().from(hexString: "23273C")]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor:  UIColor().from(hexString: "23273C")]
    }

    var body: some View {
        ZStack {
            Color(hex: "F8F8FC").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Requirements")
                    .font(Font.system(size: 20))
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundColor(Color(hex: "51525C"))
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.requeriments, id: \.self) {
                            CardView(color: $0.color, text: $0.text, image: $0.image)
                        }
                    }
                }.frame(height: 180)
                .padding()
            }
        }.navigationBarTitle("Covid-19 Info")
        .navigationBarBackButtonHidden(true)
    }
}

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

        }.frame(width: 150, height: 180, alignment: .center)
        .cornerRadius(15)
        //.padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
