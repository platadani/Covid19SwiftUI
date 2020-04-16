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

    @Published var totalCountTitle: String

    var country: Country!
    var provider: CountryDataProvider!
    private var publishers = [AnyCancellable]()

    var statusData: [StatusData] = [.confirmed, .recovered, .deaths]

    deinit {
        publishers.forEach { $0.cancel() }
    }

    init(country: Country) {
        self.country = country
        totalCountTitle = ""
        provider = CountryDataServer()
        getData()
    }

    init(data: [CountryDataResponse], country: Country) {
        totalCountTitle = ""
        self.data = data
        self.country = country
    }

    func getData() {
        provider
            .getData(country: country.slug, status: statusData[statusSelected])
            .replaceError(with: [])
            .map { $0.filter { $0.cases > 0 } }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { value in
            }) { value in
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                let formattedNumber = numberFormatter.string(from: NSNumber(value:value.last?.cases ?? 0))
                self.totalCountTitle = formattedNumber ?? ""
                self.data = value
            }

            .store(in: &publishers)
    }

    func openURLInSafari() {
        UIApplication.shared.open(URL(string: "https://covid19api.com/")!, options: [:], completionHandler: nil)
    }
}
