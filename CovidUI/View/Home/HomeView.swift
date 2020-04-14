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
    @State var showRequirementDetail: Bool = false
    @State var showStayHomeDetail: Bool = false

    @State var requirementSelected: Requirement?

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor().from(hexString: "23273C")]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor:  UIColor().from(hexString: "23273C")]
    }

    var body: some View {
        ZStack {
            Color(hex: "F4F6FC").edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    Text("Requirements")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .foregroundColor(Color(hex: "51525C"))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.requeriments, id: \.self) { req in
                                CardView(color: req.color, text: req.text, image: req.image)
                                    .onTapGesture {
                                        self.requirementSelected = req
                                        self.showRequirementDetail.toggle()
                                    }
                                    .sheet(isPresented: self.$showRequirementDetail) {
                                        RequirementDetailView(viewModel: RequirementDetailViewModel(requirement: self.requirementSelected!))
                                    }
                                }
                            }.padding([.leading, .trailing], 10)
                    }.frame(height: 120)
                    FullCardView()
                    .onTapGesture {
                        self.showStayHomeDetail.toggle()
                    }
                    .sheet(isPresented: self.$showStayHomeDetail) {
                        RequirementDetailView(viewModel: RequirementDetailViewModel(requirement: .stayHome))
                    }
                }
            }
        }.navigationBarTitle("Covid-19 Info", displayMode: .inline)
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

        }.frame(width: 150, height: 120, alignment: .center)
        .cornerRadius(15)
            .padding([.leading, .trailing], 5)
    }
}

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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
