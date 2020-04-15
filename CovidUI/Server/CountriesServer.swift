//
//  CountriesServer.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import Foundation
import Combine

class CountriesServer: ServerManager, CountriesProvider {
    private enum Endpoint: String {
        case countries = "/countries"
    }
    
    func getCountries() -> AnyPublisher<[CountryResponse], APIError> {
        return call("\(covidApiBaseURL)\(Endpoint.countries.rawValue)", method: .GET)
    }
}
