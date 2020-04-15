//
//  CountryListViewModel.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI
import Combine

final class CountryListViewModel: ObservableObject {
    @Published var countries: [Country] = []
    var provider: CountriesProvider!
    private var publishers = [AnyCancellable]()

    deinit {
    }

    init() {
        provider = CountriesServer()
        getCountries()
    }

    init(countries: [Country]) {
        self.countries = countries
    }

    func getCountries() {
        provider
            .getCountries()
            .replaceError(with: [])
            .map { $0.map { Country(flagImage: "https://raw.githubusercontent.com/hjnilsson/country-flags/master/png1000px/\($0.iso2.lowercased()).png",
                name: $0.name, slug: $0.slug) }
                     .sorted(by: { $0.name < $1.name }) }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { error in
                print(error)
            }) { value in
                self.countries = value
            }
        .store(in: &publishers)
    }
}
