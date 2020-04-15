//
//  CountryDataProvider.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import Combine
import Foundation

protocol CountryDataProvider {
    func getData(country: String, status: StatusData) -> AnyPublisher<[CountryDataResponse], APIError>
}
