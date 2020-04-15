//
//  CountryDataServer.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import Combine
import Foundation

class CountryDataServer: ServerManager, CountryDataProvider {
    private enum Endpoint: String {
        case data = "/total/dayone/country/"
    }

    func getData(country: String, status: StatusData) -> AnyPublisher<[CountryDataResponse], APIError> {
        return call("\(covidApiBaseURL)\(Endpoint.data.rawValue)\(country)/status/\(status.rawValue)", method: .GET)
    }
}
