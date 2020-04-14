//
//  HomeView.swift
//  CovidUI
//
//  Created by Daniel Plata on 14/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor().from(hexString: "23273C")]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor:  UIColor().from(hexString: "23273C")]
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "CCCCD1").edgesIgnoringSafeArea(.all)
            }.navigationBarTitle(Text("Covid-19 Info"))
                .foregroundColor(.green)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
