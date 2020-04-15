//
//  CountryChartViewModel.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI
import Combine

final class CountryChartViewModel: ObservableObject {
    @Published var data: [CountryDataResponse] = []
    @Published var statusSelected = 0 {
        didSet {
            getData()
        }
    }
    var country: Country!
    var provider: CountryDataProvider!
    private var publishers = [AnyCancellable]()

    var statusData: [StatusData] = [.confirmed, .recovered, .deaths]

    deinit {
    }

    init(country: Country) {
        self.country = country
        provider = CountryDataServer()
        getData()
    }

    init(data: [CountryDataResponse], country: Country) {
        self.data = data
        self.country = country
    }

    func getData() {
        provider
            .getData(country: country.slug, status: statusData[statusSelected])
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { error in
                print(error)
            }) { value in
                self.data = value
            }
            .store(in: &publishers)
    }

    func openURLInSafari() {
        UIApplication.shared.open(URL(string: "https://covid19api.com/")!, options: [:], completionHandler: nil)
    }
}
