//
//  ServerManager.swift
//  CovidUI
//
//  Created by Daniel Plata on 15/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import Combine
import Foundation

class ServerManager {
    let covidApiBaseURL = "https://api.covid19api.com"

    enum Method: String {
        case GET
    }

    func call<T: Decodable>(_ endPoint: String, method: Method) -> AnyPublisher<T, APIError> {
        let urlRequest = request(for: endPoint, method: method)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .mapError{ _ in APIError.serverError }
            .map { $0.data }
            .decode(type: T.self, decoder: decoder)
            .mapError { _ in APIError.parsingError }
            .eraseToAnyPublisher()
    }

    func request(for endpoint: String, method: Method) -> URLRequest {
        guard let url = URL(string: endpoint.folding(options: .diacriticInsensitive, locale: .current))
            else { preconditionFailure("Bad URL \(endpoint)") }

        var request = URLRequest(url: url)
        request.httpMethod = "\(method)"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]

        print("🌍🌍🌍🌍🌍🌍🌍🌍🌍")
        print("REQUEST: [\(method.rawValue)] \(endpoint)")
        return request
    }
}
