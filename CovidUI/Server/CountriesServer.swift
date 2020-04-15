//
//  CountriesServer.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import Foundation
import Combine

class CountriesServer: CountriesProvider {
    private let covidApiBaseURL = "https://api.covid19api.com"
    private enum Endpoint: String {
        case countries = "/countries"
    }
    private enum Method: String {
        case GET
    }

    func getCountries() -> AnyPublisher<[CountryResponse], APIError> {
        return call("\(covidApiBaseURL)\(Endpoint.countries.rawValue)", method: .GET)
    }

    private func call<T: Decodable>(_ endPoint: String, method: Method) -> AnyPublisher<T, APIError> {
        let urlRequest = request(for: endPoint, method: method)

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .mapError{ _ in APIError.serverError }
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { _ in APIError.parsingError }
            .eraseToAnyPublisher()
    }

    private func request(for endpoint: String, method: Method) -> URLRequest {
        guard let url = URL(string: endpoint)
            else { preconditionFailure("Bad URL") }

        var request = URLRequest(url: url)
        request.httpMethod = "\(method)"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        return request
    }
}
