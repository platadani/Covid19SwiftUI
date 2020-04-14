//
//  ContentView.swift
//  CovidUI
//
//  Created by Daniel Plata on 14/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "4F62ED").edgesIgnoringSafeArea(.all)
                VStack {
                    WelcomeImage()
                    TitleAndSubtitleView()
                    WelcomeButton()
                }
            }
        }
    }
}

struct WelcomeImage: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(EdgeInsets(top: 10, leading: 60, bottom: 10, trailing: 60))
            Image("mask-man")
            .resizable()
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(EdgeInsets(top: 10, leading: 60, bottom: 10, trailing: 60))
        }
    }
}

struct TitleAndSubtitleView: View {
    var body: some View {
        VStack {
            Text("Find What you Need To Survive Covid-19")
                .foregroundColor(.white)
                .font(Font.title)
                .fontWeight(.bold)
                .padding([.leading, .trailing, .bottom], 16)
                .frame(minWidth: 0, maxWidth: .infinity)
                .multilineTextAlignment(.center)

            Text("and all the info and data")
                .foregroundColor(Color(hex: "9BA4F4"))
                .font(Font.subheadline)
        }
    }
}

struct WelcomeButton: View {
    @State var showHomeView: Bool = false
    var body: some View {
        NavigationLink(destination: HomeView(), isActive: $showHomeView) {
            Button(action: {
                self.showHomeView.toggle()
            }) {
                Text("Let's Go")
                    .fontWeight(.black)
                    .font(Font.system(size: 20))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color(hex: "4F62ED"))
                    .cornerRadius(10)
            }.padding(EdgeInsets(top: 100, leading: 40, bottom: 40, trailing: 40))
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
